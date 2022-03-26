import 'package:flutter/services.dart';

class AppConfig {
  static String version = '';
  static bool isActivityPlaying = false;

  static void setOrientation({portraitMode, landscapeMode}) {
    SystemChrome.setPreferredOrientations(
      [
        if (portraitMode == true) DeviceOrientation.portraitUp,
        if (portraitMode == true) DeviceOrientation.portraitUp,
        if (landscapeMode == true) DeviceOrientation.landscapeRight,
        if (landscapeMode == true) DeviceOrientation.landscapeLeft,
      ],
    );
  }
}
