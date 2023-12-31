// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA-k-oOapIonVAOLYD7MDqEX-aM7qSmRHo',
    appId: '1:962715955432:web:704c6d363e419ac0aa595d',
    messagingSenderId: '962715955432',
    projectId: 'foodmealgt',
    authDomain: 'foodmealgt.firebaseapp.com',
    storageBucket: 'foodmealgt.appspot.com',
    measurementId: 'G-FED766T1CB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAi5wi6Kcv4hhBh4AzpE0Bxq6ADELogz9E',
    appId: '1:962715955432:android:b30ae424fc74d9cfaa595d',
    messagingSenderId: '962715955432',
    projectId: 'foodmealgt',
    storageBucket: 'foodmealgt.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBu9V48u-ZZ6-4M6Az9DUj475dbNr4iY6s',
    appId: '1:962715955432:ios:f2c5b0531d8990bcaa595d',
    messagingSenderId: '962715955432',
    projectId: 'foodmealgt',
    storageBucket: 'foodmealgt.appspot.com',
    iosBundleId: 'com.example.base',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBu9V48u-ZZ6-4M6Az9DUj475dbNr4iY6s',
    appId: '1:962715955432:ios:12e9e36a37396497aa595d',
    messagingSenderId: '962715955432',
    projectId: 'foodmealgt',
    storageBucket: 'foodmealgt.appspot.com',
    iosBundleId: 'com.example.base.RunnerTests',
  );
}
