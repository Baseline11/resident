import 'package:flutter/widgets.dart';

import './strings/strings.dart';

class R {
  static Translations strings = EnCa();

  static void load(Locale locale) {
    switch (locale.toString()) {
      case 'en_CA':
        strings = EnCa();
        break;
      case 'pt_BR':
        strings = PtBr();
        break;
      default:
        strings = EnCa();
        break;
    }
  }
}
