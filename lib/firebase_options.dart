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
    apiKey: 'AIzaSyDYQhzC7fRyq0p3KbkP6G_JC4glu1328Oc',
    appId: '1:669283823826:web:3591aff99f79d95feafd0b',
    messagingSenderId: '669283823826',
    projectId: 'books-bac44',
    authDomain: 'books-bac44.firebaseapp.com',
    databaseURL: 'https://books-bac44-default-rtdb.firebaseio.com',
    storageBucket: 'books-bac44.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwKKRHhczuLCrYjmd91PlPdVutK8XhOGQ',
    appId: '1:669283823826:android:03e17aca9cb42b0deafd0b',
    messagingSenderId: '669283823826',
    projectId: 'books-bac44',
    databaseURL: 'https://books-bac44-default-rtdb.firebaseio.com',
    storageBucket: 'books-bac44.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDi5sA4vLClvMFei73SJWR_zJQrQmuKN6M',
    appId: '1:669283823826:ios:702e7bd3f69797b3eafd0b',
    messagingSenderId: '669283823826',
    projectId: 'books-bac44',
    databaseURL: 'https://books-bac44-default-rtdb.firebaseio.com',
    storageBucket: 'books-bac44.appspot.com',
    androidClientId: '669283823826-784dl3gu6ma2g8affmg9niv2j2mror58.apps.googleusercontent.com',
    iosClientId: '669283823826-l2bu4kujq4e24p1f9nbku69qq62djrda.apps.googleusercontent.com',
    iosBundleId: 'com.example.book',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDi5sA4vLClvMFei73SJWR_zJQrQmuKN6M',
    appId: '1:669283823826:ios:702e7bd3f69797b3eafd0b',
    messagingSenderId: '669283823826',
    projectId: 'books-bac44',
    databaseURL: 'https://books-bac44-default-rtdb.firebaseio.com',
    storageBucket: 'books-bac44.appspot.com',
    androidClientId: '669283823826-784dl3gu6ma2g8affmg9niv2j2mror58.apps.googleusercontent.com',
    iosClientId: '669283823826-l2bu4kujq4e24p1f9nbku69qq62djrda.apps.googleusercontent.com',
    iosBundleId: 'com.example.book',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDYQhzC7fRyq0p3KbkP6G_JC4glu1328Oc',
    appId: '1:669283823826:web:3591aff99f79d95feafd0b',
    messagingSenderId: '669283823826',
    projectId: 'books-bac44',
    authDomain: 'books-bac44.firebaseapp.com',
    databaseURL: 'https://books-bac44-default-rtdb.firebaseio.com',
    storageBucket: 'books-bac44.appspot.com',
  );

}