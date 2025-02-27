// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBE1nt4L-Sz2mt2Hf77ImTvGqgQycWXJ2w',
    appId: '1:943731696743:web:2168c6fc8323d01a8ca0c2',
    messagingSenderId: '943731696743',
    projectId: 'space-llama',
    authDomain: 'space-llama.firebaseapp.com',
    storageBucket: 'space-llama.appspot.com',
    measurementId: 'G-B7RSYQZVPE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqMkwB2N4O2EfDLlT9bsFRGYSEC4KEZlE',
    appId: '1:943731696743:android:3dc825b084c3e6b28ca0c2',
    messagingSenderId: '943731696743',
    projectId: 'space-llama',
    storageBucket: 'space-llama.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBFFDBordYH9PJ0njkLDD-Z0wD9uIRYslM',
    appId: '1:943731696743:ios:2c1d08629c2d62208ca0c2',
    messagingSenderId: '943731696743',
    projectId: 'space-llama',
    storageBucket: 'space-llama.appspot.com',
    iosBundleId: 'com.example.astroLlama',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBFFDBordYH9PJ0njkLDD-Z0wD9uIRYslM',
    appId: '1:943731696743:ios:2c1d08629c2d62208ca0c2',
    messagingSenderId: '943731696743',
    projectId: 'space-llama',
    storageBucket: 'space-llama.appspot.com',
    iosBundleId: 'com.example.astroLlama',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBE1nt4L-Sz2mt2Hf77ImTvGqgQycWXJ2w',
    appId: '1:943731696743:web:6bbaedaea2cbad398ca0c2',
    messagingSenderId: '943731696743',
    projectId: 'space-llama',
    authDomain: 'space-llama.firebaseapp.com',
    storageBucket: 'space-llama.appspot.com',
    measurementId: 'G-6S532T9F89',
  );
}
