import 'package:flutter/widgets.dart';

import './strings/strings.dart';

class R {
  static Translations strings = EnUs();

  static void load(Locale locale) {
    switch (locale.toString()) {
      case 'en_US':
        strings = EnUs();
        break;
      case 'pt_BR':
        strings = PtBr();
        break;
      default:
        strings = PtBr();
        break;
    }
  }
}
