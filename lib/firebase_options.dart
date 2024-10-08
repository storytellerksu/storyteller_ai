// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDjn2ebGUUxhAivu3-mpmibXXIo_jYf0H8',
    appId: '1:915397074830:web:1f9a1c252b0822bec68edf',
    messagingSenderId: '915397074830',
    projectId: 'storytellerai-swag',
    authDomain: 'storytellerai-swag.firebaseapp.com',
    storageBucket: 'storytellerai-swag.appspot.com',
    measurementId: 'G-6MLF1CBPFE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUMKKW89x1ClEr_SuGG6oqH_BwR7iP5WY',
    appId: '1:915397074830:android:6e1663f8a4de997cc68edf',
    messagingSenderId: '915397074830',
    projectId: 'storytellerai-swag',
    storageBucket: 'storytellerai-swag.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDG26bOnHOgwt7HS6X0dPCNkVIZNZvLCLw',
    appId: '1:915397074830:ios:78dd94479fb86355c68edf',
    messagingSenderId: '915397074830',
    projectId: 'storytellerai-swag',
    storageBucket: 'storytellerai-swag.appspot.com',
    iosBundleId: 'com.example.storytellerai',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDG26bOnHOgwt7HS6X0dPCNkVIZNZvLCLw',
    appId: '1:915397074830:ios:78dd94479fb86355c68edf',
    messagingSenderId: '915397074830',
    projectId: 'storytellerai-swag',
    storageBucket: 'storytellerai-swag.appspot.com',
    iosBundleId: 'com.example.storytellerai',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDjn2ebGUUxhAivu3-mpmibXXIo_jYf0H8',
    appId: '1:915397074830:web:4b897da0ced62f48c68edf',
    messagingSenderId: '915397074830',
    projectId: 'storytellerai-swag',
    authDomain: 'storytellerai-swag.firebaseapp.com',
    storageBucket: 'storytellerai-swag.appspot.com',
    measurementId: 'G-NX0HLQDN80',
  );
}
