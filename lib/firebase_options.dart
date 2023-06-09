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
    apiKey: 'AIzaSyD3A_AMSiYesB7ThrS_svrjDCruErRp-Us',
    appId: '1:1063619579617:web:a7e91f5a879d7f9df7f1a0',
    messagingSenderId: '1063619579617',
    projectId: 'bykakrentalsuitstate',
    authDomain: 'bykakrentalsuitstate.firebaseapp.com',
    storageBucket: 'bykakrentalsuitstate.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAMjFOQ8NpUUDijPOPZqUe7lsnSJo85PC0',
    appId: '1:1063619579617:android:522db0989f9ee48bf7f1a0',
    messagingSenderId: '1063619579617',
    projectId: 'bykakrentalsuitstate',
    storageBucket: 'bykakrentalsuitstate.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4AAXQRhjmu9GPALdT0uFgjgvQ_W9mTFs',
    appId: '1:1063619579617:ios:d8f6228c9c913137f7f1a0',
    messagingSenderId: '1063619579617',
    projectId: 'bykakrentalsuitstate',
    storageBucket: 'bykakrentalsuitstate.appspot.com',
    iosClientId: '1063619579617-6o09qvgdjh3oiqa3jo6ok018b4nqmk3m.apps.googleusercontent.com',
    iosBundleId: 'com.designer.bykakrentalsuitstate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4AAXQRhjmu9GPALdT0uFgjgvQ_W9mTFs',
    appId: '1:1063619579617:ios:d8f6228c9c913137f7f1a0',
    messagingSenderId: '1063619579617',
    projectId: 'bykakrentalsuitstate',
    storageBucket: 'bykakrentalsuitstate.appspot.com',
    iosClientId: '1063619579617-6o09qvgdjh3oiqa3jo6ok018b4nqmk3m.apps.googleusercontent.com',
    iosBundleId: 'com.designer.bykakrentalsuitstate',
  );
}
