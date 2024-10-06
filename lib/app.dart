import 'package:astro_llama/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/auth/auth_gate.dart';
import 'features/search_page/search_page.dart';
import 'features/settings/settings_page.dart';
import 'features/video_pagination/video_pagination.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'amall',
        theme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: const AuthGate(idx: 0)
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> titles =['Videos', 'Searching', 'Setting'];
    final List<Widget> pages = [const VideoPagination(), const SearchPage(), const SettingsPage()];

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Icon(Icons.star),
              Text(titles[currentPageIndex],
                style: GoogleFonts.libreBaskerville(),

              ),
              const Icon(Icons.star),
            ],
          ),
        )
      ),
      body:pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 1.5,
        indicatorColor: theme.colorScheme.primary,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
