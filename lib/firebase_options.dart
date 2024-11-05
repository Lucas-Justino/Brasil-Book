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
    apiKey: 'AIzaSyCbUq0UP0-OVyYpKqo5tpZWOqI6hT-Ej3Q',
    appId: '1:649998683079:web:c668906c812b510ffba7e2',
    messagingSenderId: '649998683079',
    projectId: 'brasil-book',
    authDomain: 'brasil-book.firebaseapp.com',
    storageBucket: 'brasil-book.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7Owge965BugyGDJIQClZJ86vwoJ5y0_A',
    appId: '1:649998683079:android:e08eb74bad679037fba7e2',
    messagingSenderId: '649998683079',
    projectId: 'brasil-book',
    storageBucket: 'brasil-book.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvSAzz4uZo0FM7eacJevoV7nOFNrq-T3I',
    appId: '1:649998683079:ios:18ca631d253e47e9fba7e2',
    messagingSenderId: '649998683079',
    projectId: 'brasil-book',
    storageBucket: 'brasil-book.firebasestorage.app',
    iosBundleId: 'com.example.brasilBook',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvSAzz4uZo0FM7eacJevoV7nOFNrq-T3I',
    appId: '1:649998683079:ios:18ca631d253e47e9fba7e2',
    messagingSenderId: '649998683079',
    projectId: 'brasil-book',
    storageBucket: 'brasil-book.firebasestorage.app',
    iosBundleId: 'com.example.brasilBook',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCbUq0UP0-OVyYpKqo5tpZWOqI6hT-Ej3Q',
    appId: '1:649998683079:web:9931ca1e0042e043fba7e2',
    messagingSenderId: '649998683079',
    projectId: 'brasil-book',
    authDomain: 'brasil-book.firebaseapp.com',
    storageBucket: 'brasil-book.firebasestorage.app',
  );

}