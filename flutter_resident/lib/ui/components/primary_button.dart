import 'package:flutter/material.dart';

import './theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  final double totalHeight;
  final double totalWidth;
  final String buttonText;
  final Color backgroundColor;
  final backgroundDisabledColor;
  final Color overlayColor;
  final void Function()? onPressed;
  final bool isLoading;
  final Color? textColor;

  const PrimaryButton({
    required this.totalWidth,
    required this.buttonText,
    required this.backgroundColor,
    required this.overlayColor,
    required this.onPressed,
    this.totalHeight = 50,
    this.backgroundDisabledColor,
    this.isLoading = false,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: totalHeight,
      width: totalWidth,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return backgroundColor;
              if (states.contains(MaterialState.disabled)) {
                Color disabledColor = backgroundDisabledColor;
                if (backgroundDisabledColor == null) {
                  disabledColor = backgroundColor.withOpacity(0.5);
                }

                return disabledColor;
              }

              return backgroundColor; // Use default color.
            },
          ),
          overlayColor: MaterialStateProperty.all<Color>(overlayColor),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  textColor ?? colorFunctionalSoftLightest,
                ),
              )
            : Text(
                buttonText,
                style: TextStyle(
                  color: textColor ?? colorFunctionalSoftLightest,
                  fontSize: fontSizeXXS,
                  fontWeight: fontWeightBold,
                  fontFamily: fontFamilyBrand,
                ),
              ),
        onPressed: onPressed,
      ),
    );
  }
}
