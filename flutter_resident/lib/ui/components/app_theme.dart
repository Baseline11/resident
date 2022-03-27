import 'package:flutter/material.dart';

import './theme/theme.dart';

ThemeData makeAppTheme() {
  final primaryColor = colorBrandPrimaryDark;
  final primaryColorDark = colorBrandPrimaryDarkest;
  final primaryColorLight = colorBrandPrimaryMedium;
  final secundaryColor = colorBrandSecundaryDark;
  final secondaryColorDark = colorBrandSecundaryDarkest;
  final disableColor = colorFunctionalHeavyLightest;
  final dividerColor = colorFunctionalHeavyMedium;

  final textTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: ThemeColors.colorLightBackgroundsPrimary,
    ),
  );

  final inputDecorationTheme = InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: primaryColorLight,
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: primaryColor,
      ),
    ),
    alignLabelWithHint: true,
  );
  final buttonTheme = ButtonThemeData(
    colorScheme: ColorScheme.light(
      primary: primaryColor,
    ),
    buttonColor: primaryColor,
    splashColor: primaryColorLight,
    padding: EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 20,
    ),
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  return ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    highlightColor: secundaryColor,
    secondaryHeaderColor: secondaryColorDark,
    disabledColor: disableColor,
    dividerColor: dividerColor,
    colorScheme: ColorScheme.light(primary: primaryColor),
    backgroundColor: ThemeColors.colorLightTintsBlue,
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme,
    buttonTheme: buttonTheme,
  );
}
