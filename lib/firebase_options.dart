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
    apiKey: 'AIzaSyA3dZlh-QfoTBLaF23MzuHK4DTLkI2U3_I',
    appId: '1:763231298158:web:6de4d58b9396399de67c7f',
    messagingSenderId: '763231298158',
    projectId: 'mock-13382',
    authDomain: 'mock-13382.firebaseapp.com',
    storageBucket: 'mock-13382.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4yzHX4Kfem1sXKMyOwGcdp6B1hgDHMK8',
    appId: '1:763231298158:android:113b968aca0dc314e67c7f',
    messagingSenderId: '763231298158',
    projectId: 'mock-13382',
    storageBucket: 'mock-13382.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiupIObrOi69gOX4pTyscEqX-7DNXC7AU',
    appId: '1:763231298158:ios:03c9d2d4bd7d4769e67c7f',
    messagingSenderId: '763231298158',
    projectId: 'mock-13382',
    storageBucket: 'mock-13382.appspot.com',
    iosBundleId: 'com.example.mock',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAiupIObrOi69gOX4pTyscEqX-7DNXC7AU',
    appId: '1:763231298158:ios:c2bf227c36c0935fe67c7f',
    messagingSenderId: '763231298158',
    projectId: 'mock-13382',
    storageBucket: 'mock-13382.appspot.com',
    iosBundleId: 'com.example.mock.RunnerTests',
  );
}
