import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:video_player/video_player.dart';
class VideoPagination extends StatefulWidget {
  const VideoPagination({super.key});

  @override
  State<VideoPagination> createState() => _VideoPaginationState();
}

class _VideoPaginationState extends State<VideoPagination> with TickerProviderStateMixin {
  VideoPlayerController? _controller;
  final List<String> _videoUrls = [];
  int _currentIndex = 0;
  bool _isLoading = true;
  bool _isFetchingMore = false;
  bool _isPaused = false;
  final int _pageSize = 2;
  String _nextPageToken = '';

  @override
  void initState() {
    super.initState();
    _loadInitialVideos();
  }

  Future<void> _loadInitialVideos() async {
    await _fetchVideosFromStorage();
  }

  Future<void> _fetchVideosFromStorage() async {
    if (_isFetchingMore) return;

    setState(() {
      _isFetchingMore = true;
    });

    FirebaseStorage storage = FirebaseStorage.instance;
    ListResult result;

    try {
      result = await storage.ref('first_videos').list(ListOptions(maxResults: _pageSize, pageToken: _nextPageToken));

      print('Found videos: ${result.items.length}'); // Логируем количество найденных видео

      List<String> videoUrls = await Future.wait(result.items.map((item) => item.getDownloadURL()).toList());

      setState(() {
        _videoUrls.addAll(videoUrls);
        _nextPageToken = result.nextPageToken ?? ''; // Safe handling of null
        _isFetchingMore = false;
        _isLoading = false;
      });

      if (_videoUrls.isNotEmpty) {
        await _initializeVideoPlayer(_videoUrls[_currentIndex]);
      }
    } catch (e) {
      print("Error fetching videos: $e");
      setState(() {
        _isFetchingMore = false;
        _isLoading = false;
      });
    }
  }

  Future<void> _initializeVideoPlayer(String url) async {
    try {
      final fileInfo = await DefaultCacheManager().getSingleFile(url);
      print('Cached file path: ${fileInfo.path}'); // Логируем путь к кэшированному файлу

      _controller?.dispose();

      _controller = VideoPlayerController.file(fileInfo)
        ..initialize().then((_) {
          if (mounted) {
            print('Video initialized successfully'); // Логируем успешную инициализацию
            setState(() {});
            _controller?.play();
          }
        }).catchError((e) {
          print('Error initializing video: $e'); // Логируем ошибки инициализации
        });

    } catch (e) {
      print('Error caching video: $e'); // Логируем ошибки кэширования
    }
  }

  Future<void> _switchVideo(int direction) async {
    if (_videoUrls.isEmpty) return;

    if (mounted) {
      setState(() {
        _currentIndex = (_currentIndex + direction) % _videoUrls.length;

        if (_currentIndex == _videoUrls.length - 1) {
          _fetchVideosFromStorage();
        }

        _controller?.pause(); // Ставим текущее видео на паузу перед переключением
      });
    }

    await _initializeVideoPlayer(_videoUrls[_currentIndex]);
  }


  void _onVerticalSwipe(DragEndDetails details) {
    if (details.primaryVelocity! < 0) {
      _switchVideo(1); // Свайп вниз — переключение на следующее видео
    } else if (details.primaryVelocity! > 0) {
      _switchVideo(-1); // Свайп вверх — переключение на предыдущее видео
    }
  }

  void _onTap() {
    if(_isPaused){
      _controller!.play();
      _isPaused = !_isPaused;
    } else {
      _controller!.pause();
      _isPaused = !_isPaused;
      }
  }

  @override
  void dispose() {
    _controller?.dispose(); // Безопасное освобождение контроллера видео
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator() // Показываем индикатор загрузки
            : GestureDetector(
          onVerticalDragEnd: _onVerticalSwipe, // Обработка свайпов вверх/вниз
          onTap: _onTap, // Пауза при нажатии
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              final offsetAnimation = Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: const Offset(0.0, 0.0),   // Полностью на экране
              ).animate(animation);
              return ClipRect(
                child: SlideTransition(
                  position: offsetAnimation,
                  child: child,
                ),
              );
            },
            child: _controller != null && _controller!.value.isInitialized
                ? VideoPlayer(_controller!)
                : const CircularProgressIndicator(), // Показ загрузки, пока видео не готово
          ),
        ),
      ),
    );
  }
}