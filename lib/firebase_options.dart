import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions currentPlatform(Map<String, String> env) {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android(env);
      case TargetPlatform.iOS:
        return ios(env);
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

  static FirebaseOptions android(Map<String, String> env) => FirebaseOptions(
        apiKey: env['FSDK_ANDROID_API_KEY'] ?? "",
        appId: env['FSDK_ANDROID_APP_ID'] ?? "",
        messagingSenderId: env['FSDK_MESSENGER_ID'] ?? "",
        projectId: env['FSDK_PROJECT_ID'] ?? "",
        databaseURL: env['FSDK_DATABASE_URL'] ?? "",
        storageBucket: env['FSDK_STORAGE_BUCKET'] ?? "",
      );

  static FirebaseOptions ios(Map<String, String> env) => FirebaseOptions(
        apiKey: env['FSDK_IOS_API_KEY'] ?? "",
        appId: env['FSDK_IOS_APP_ID'] ?? "",
        messagingSenderId: env['FSDK_MESSENGER_ID'] ?? "",
        projectId: env['FSDK_PROJECT_ID'] ?? "",
        databaseURL: env['FSDK_DATABASE_URL'] ?? "",
        storageBucket: env['FSDK_STORAGE_BUCKET'] ?? "",
        androidClientId: env['FSDK_ANDROID_CLIENT_ID'] ?? "",
        iosClientId: env['FSDK_IOS_CLIENT_ID'] ?? "",
        iosBundleId: env['FSDK_IOS_BUNDLE_ID'] ?? "",
      );
}
