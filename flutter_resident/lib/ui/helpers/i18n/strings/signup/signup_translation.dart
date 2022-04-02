import 'package:flutter/material.dart';

abstract class SignUpTranslation {
  String get page1Title;
  String get page1ButtonText;
  List<TextSpan> sliderCard1Body(BuildContext context);
  String get sliderCard1Bottom;
}
