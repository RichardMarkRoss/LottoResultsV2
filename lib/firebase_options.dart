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
    apiKey: 'AIzaSyAvfOzMcK3ZKz4mLgyDwBtfDFM7FoBkz5M',
    appId: '1:250812480651:web:dd8c6d542d8916bcfbe88e',
    messagingSenderId: '250812480651',
    projectId: 'login-6fb9b',
    authDomain: 'login-6fb9b.firebaseapp.com',
    storageBucket: 'login-6fb9b.appspot.com',
    measurementId: 'G-CT2TTVC47H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDm_UhRQrfDGz2bgEUOWF5pW1aGQyUb3D4',
    appId: '1:250812480651:android:5a077b0643db20b9fbe88e',
    messagingSenderId: '250812480651',
    projectId: 'login-6fb9b',
    storageBucket: 'login-6fb9b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbIyY198WYnti21bwyCLRqz4kugGcFm9g',
    appId: '1:250812480651:ios:7ba896349c8a4f66fbe88e',
    messagingSenderId: '250812480651',
    projectId: 'login-6fb9b',
    storageBucket: 'login-6fb9b.appspot.com',
    iosClientId: '250812480651-qm5221jun3tto8po95fjiu1b66a40lm2.apps.googleusercontent.com',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbIyY198WYnti21bwyCLRqz4kugGcFm9g',
    appId: '1:250812480651:ios:7ba896349c8a4f66fbe88e',
    messagingSenderId: '250812480651',
    projectId: 'login-6fb9b',
    storageBucket: 'login-6fb9b.appspot.com',
    iosClientId: '250812480651-qm5221jun3tto8po95fjiu1b66a40lm2.apps.googleusercontent.com',
    iosBundleId: 'com.example.login',
  );
}
