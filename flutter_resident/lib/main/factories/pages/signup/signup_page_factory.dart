import 'package:flutter/material.dart';

import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

Widget makeSignUpPage() {
  return IosSignUpPage(makeGetxSignUpPresenter());
}
