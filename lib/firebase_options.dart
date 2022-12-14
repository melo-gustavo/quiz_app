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
    apiKey: 'AIzaSyBZCQFyqSmZ8YqV15a2md1jgFGiJAS2afw',
    appId: '1:43797107262:web:62c390190ab9a1b95df76f',
    messagingSenderId: '43797107262',
    projectId: 'quiz-app-a78bd',
    authDomain: 'quiz-app-a78bd.firebaseapp.com',
    storageBucket: 'quiz-app-a78bd.appspot.com',
    measurementId: 'G-F52D0P5R6K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfjJpxEa4DbT5nwl8_-zI_QYiWss4nogE',
    appId: '1:43797107262:android:8bf975be0f9b94fa5df76f',
    messagingSenderId: '43797107262',
    projectId: 'quiz-app-a78bd',
    storageBucket: 'quiz-app-a78bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-CI-sF5qmjFaSSnE_G1xEVw6NBM57O_w',
    appId: '1:43797107262:ios:88718409f01913d15df76f',
    messagingSenderId: '43797107262',
    projectId: 'quiz-app-a78bd',
    storageBucket: 'quiz-app-a78bd.appspot.com',
    iosClientId: '43797107262-aij8mjbj3kc72fesv2i275mli13009ri.apps.googleusercontent.com',
    iosBundleId: 'com.example.quiz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-CI-sF5qmjFaSSnE_G1xEVw6NBM57O_w',
    appId: '1:43797107262:ios:88718409f01913d15df76f',
    messagingSenderId: '43797107262',
    projectId: 'quiz-app-a78bd',
    storageBucket: 'quiz-app-a78bd.appspot.com',
    iosClientId: '43797107262-aij8mjbj3kc72fesv2i275mli13009ri.apps.googleusercontent.com',
    iosBundleId: 'com.example.quiz',
  );
}
