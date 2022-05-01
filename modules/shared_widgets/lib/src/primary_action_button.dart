import 'package:flutter/material.dart';

import 'base_widget.dart';

class ThemeColors {
  static const colorLightTintsBlue = Color(0xFF007AFF);
  static const colorLightLabelsQuaternary = Color(0xFFDCDCDD);
  static const colorLightLabelsTertiary = Color(0xFFBFBFC1);
  static const colorLightBackgroundsPrimary = Color(0xFFFFFFFF);
  static const colorLightBackgroundsSecondary = Color(0xFFF2F2F7);
  static const colorLightTintsRed = Color(0xFFFF3B30);
}

class PrimaryActionButton extends StatelessWidget {
  final double height;
  final double? width;
  final String buttonText;
  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color overlayColor;
  final void Function()? onPressed;
  final bool isLoading;
  final Color textColor;
  final Color disabledTextColor;
  final Widget? trailingWidget;

  const PrimaryActionButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.width,
    this.height = 50,
    this.isLoading = false,
    this.textColor = ThemeColors.colorLightTintsBlue,
    this.disabledTextColor = ThemeColors.colorLightLabelsTertiary,
    this.backgroundColor = ThemeColors.colorLightBackgroundsPrimary,
    this.disabledBackgroundColor = ThemeColors.colorLightBackgroundsPrimary,
    this.overlayColor = ThemeColors.colorLightLabelsQuaternary,
    this.trailingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = width ?? MediaQuery.of(context).size.width;

    return BaseWidget(
      widget: SizedBox(
        height: height,
        width: buttonWidth,
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return backgroundColor;
                }
                if (states.contains(MaterialState.disabled)) {
                  return disabledBackgroundColor;
                }

                return backgroundColor; // Use default color.
              },
            ),
            overlayColor: MaterialStateProperty.all<Color>(overlayColor),
          ),
          child: isLoading
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    onPressed != null ? textColor : disabledTextColor,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      buttonText,
                      style: TextStyle(
                        color:
                            onPressed != null ? textColor : disabledTextColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (trailingWidget != null) trailingWidget!
                  ],
                ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
