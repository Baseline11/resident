import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './../theme/theme.dart';

class Input extends StatelessWidget {
  final String? helperText;
  final Color? helperColor;
  final String? hintText;
  final String? labelText;
  final Color? hintColor;
  final TextInputType? keyboardType;
  final void Function(String)? onChangedFunction;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final String? errorText;
  final Color? errorColor;
  final Widget? suffix;
  final Widget? prefix;
  final List<TextInputFormatter>? textInputFormatterList;
  final int? errorMaxLines;
  final double? height;
  final double? width;
  final TextAlign textAlign;
  final String? initialValue;
  final TextEditingController? textEditingController;
  final BoxConstraints? prefixIconConstraints;
  final bool? enabled;
  final bool? obscureText;

  Input({
    this.helperText,
    this.helperColor,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.onChangedFunction,
    this.enabledBorderColor =
        Colors.transparent, //colorFunctionalHeavyLightest,
    this.focusedBorderColor = colorBrandPrimaryDark,
    this.errorBorderColor = colorFeedbackDangerDark,
    this.errorText,
    this.errorColor = colorFeedbackDangerDark,
    this.hintColor = colorFunctionalHeavyLight,
    this.suffix,
    this.prefix,
    this.textInputFormatterList,
    this.errorMaxLines,
    this.height,
    this.width,
    this.textAlign = TextAlign.left,
    this.initialValue,
    this.textEditingController,
    this.prefixIconConstraints,
    this.enabled,
    this.obscureText,
  });

  Widget get defaultInput {
    final borderRadius = BorderRadius.circular(25.0);

    var enabledBorder = OutlineInputBorder(
      borderSide: BorderSide(color: enabledBorderColor, width: 2.0),
      borderRadius: borderRadius,
    );

    var errorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: errorBorderColor, width: 2.0),
      borderRadius: borderRadius,
    );

    var errorTextStyle = TextStyle(
      color: errorColor,
      fontSize: fontSizeXXXXS,
    );
    var helperTextStyle = TextStyle(
      color: helperColor,
      fontSize: fontSizeXXXXS,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height,
          width: width,
          child: TextFormField(
            obscureText: obscureText ?? false,
            enabled: enabled,
            initialValue: initialValue,
            controller: textEditingController,
            cursorColor: focusedBorderColor,
            textAlign: textAlign,
            style: TextStyle(
              color: colorBrandPrimaryDarkest,
              fontSize: fontSizeXXS,
            ),
            decoration: InputDecoration(
              filled: true,
              label: labelText != null
                  ? Text(
                      labelText!,
                      style: TextStyle(
                        color: colorBrandPrimaryMedium,
                        fontSize: fontSizeXXS,
                      ),
                    )
                  : null,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: colorFunctionalSoftMedium,
              prefixIcon: prefix,
              prefixIconConstraints: prefixIconConstraints,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              suffix: suffix,
              hintText: hintText,
              hintStyle: TextStyle(color: hintColor, fontSize: fontSizeXXS),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(),
              ),
              enabledBorder: enabledBorder,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: focusedBorderColor, width: 2.0),
                borderRadius: borderRadius,
              ),
              errorBorder: errorText != null ? errorBorder : enabledBorder,
              errorMaxLines: errorMaxLines,
              errorText: errorText ?? helperText,
              errorStyle: errorText != null ? errorTextStyle : helperTextStyle,
            ),
            keyboardType: keyboardType,
            inputFormatters: textInputFormatterList,
            onChanged: onChangedFunction,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return defaultInput;
  }
}
