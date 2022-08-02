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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDo0CXYJfcGus6qJmXuVXPaJRNi159Qlqo',
    appId: '1:902864893803:web:4a82c0054fcf31ab683e2e',
    messagingSenderId: '902864893803',
    projectId: 'seiddikafifiprize',
    authDomain: 'seiddikafifiprize.firebaseapp.com',
    storageBucket: 'seiddikafifiprize.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfxzgwSC5IP0m0G6jba019ugHYZ3lrzUY',
    appId: '1:902864893803:android:d0adc8815670e216683e2e',
    messagingSenderId: '902864893803',
    projectId: 'seiddikafifiprize',
    storageBucket: 'seiddikafifiprize.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAeVrEWK90yLsNjOVkrkMTeywowQNIKem4',
    appId: '1:902864893803:ios:1df69b336a097158683e2e',
    messagingSenderId: '902864893803',
    projectId: 'seiddikafifiprize',
    storageBucket: 'seiddikafifiprize.appspot.com',
    androidClientId: '902864893803-cgrjob717pbueveudfr351nd85lnqqcq.apps.googleusercontent.com',
    iosClientId: '902864893803-tgd3l930t9u5j5odl7f0u2fitcup3grf.apps.googleusercontent.com',
    iosBundleId: 'com.example.firistProject',
  );
}
