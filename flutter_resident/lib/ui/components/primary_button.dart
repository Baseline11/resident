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
    required this.overlayColor,
    required this.onPressed,
    this.totalHeight = 50,
    this.isLoading = false,
    this.textColor,
    this.backgroundColor = ThemeColors.colorLightBackgroundsPrimary,
    this.backgroundDisabledColor = ThemeColors.colorLightBackgroundsPrimary,
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
              borderRadius: BorderRadius.circular(14.0),
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
                  textColor ?? ThemeColors.colorLightLabelsTertiary,
                ),
              )
            : Text(
                buttonText,
                style: TextStyle(
                  color: textColor ?? ThemeColors.colorLightLabelsTertiary,
                  fontSize: fontSizeXXS,
                  fontWeight: fontWeightRegular,
                  fontFamily: fontFamilyBrand,
                ),
              ),
        onPressed: onPressed,
      ),
    );
  }
}
