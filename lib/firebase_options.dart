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
    apiKey: 'AIzaSyB_HTaTahqL98hmNsVCJuy4bQIjiRlkwV0',
    appId: '1:935135435852:web:f76e8859f182606560a8e9',
    messagingSenderId: '935135435852',
    projectId: 'ecom-4ba61',
    authDomain: 'ecom-4ba61.firebaseapp.com',
    storageBucket: 'ecom-4ba61.appspot.com',
    measurementId: 'G-96CY9T7HM4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCXUBF6zP2WirfGUWT7hXPVktEC-O7ZqMY',
    appId: '1:935135435852:android:6af688133e1ad35860a8e9',
    messagingSenderId: '935135435852',
    projectId: 'ecom-4ba61',
    storageBucket: 'ecom-4ba61.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAeSqhSnhrAqtxjGxZ1xQHkhm9xp0TaqWI',
    appId: '1:935135435852:ios:8d9d1320819f218260a8e9',
    messagingSenderId: '935135435852',
    projectId: 'ecom-4ba61',
    storageBucket: 'ecom-4ba61.appspot.com',
    iosBundleId: 'com.example.ecom',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAeSqhSnhrAqtxjGxZ1xQHkhm9xp0TaqWI',
    appId: '1:935135435852:ios:dd358c779ff23d6060a8e9',
    messagingSenderId: '935135435852',
    projectId: 'ecom-4ba61',
    storageBucket: 'ecom-4ba61.appspot.com',
    iosBundleId: 'com.example.ecom.RunnerTests',
  );
}
