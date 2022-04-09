import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_resident/ui/components/assets/global_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  final Color? errorTextColor;
  final Widget? suffix;
  final bool? isInputValid;
  final Key? textFormFieldKey;

  final List<TextInputFormatter>? textInputFormatterList;
  final int? errorMaxLines;
  final TextAlign textAlign;
  final String? initialValue;
  final TextEditingController? textEditingController;
  final BoxConstraints? prefixIconConstraints;
  final bool? enabled;
  final bool? obscureText;
  final Widget? prefixIcon;
  final String? prefixText;
  final FocusNode? focusNode;

  Input({
    this.helperText,
    this.helperColor,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.onChangedFunction,
    this.enabledBorderColor = ThemeColors.colorLightLabelsQuaternary,
    this.focusedBorderColor = ThemeColors.colorLightLabelsQuaternary,
    this.errorBorderColor = colorFeedbackDangerDark,
    this.errorText,
    this.errorTextColor = colorFunctionalSoftLightest,
    this.hintColor = ThemeColors.colorLightLabelsTertiary,
    this.suffix,
    this.prefixIcon,
    this.textInputFormatterList,
    this.errorMaxLines,
    this.textAlign = TextAlign.left,
    this.initialValue,
    this.textEditingController,
    this.prefixIconConstraints,
    this.enabled,
    this.obscureText,
    this.prefixText,
    this.isInputValid,
    this.focusNode,
    this.textFormFieldKey,
  });

  Widget get defaultInput {
    final borderRadius = BorderRadius.circular(10.0);

    var enabledBorder = OutlineInputBorder(
      borderSide: BorderSide(color: enabledBorderColor, width: 2.0),
      borderRadius: borderRadius,
    );

    var errorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: enabledBorderColor, width: 2.0),
      borderRadius: borderRadius,
    );

    var errorTextStyle = TextStyle(
      color: errorTextColor,
      fontSize: fontSizeXXXXS,
    );
    var helperTextStyle = TextStyle(
      color: helperColor,
      fontSize: fontSizeXXXXS,
    );

    final InputBorder focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(color: focusedBorderColor, width: 2.0),
      borderRadius: borderRadius,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: TextFormField(
            key: textFormFieldKey,
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.bottom,
            obscureText: obscureText ?? false,
            enabled: enabled,
            initialValue: initialValue,
            controller: textEditingController,
            cursorColor: focusedBorderColor,
            textAlign: textAlign,
            style: TextStyle(
              color: errorText != null
                  ? ThemeColors.colorLightTintsRed
                  : colorBrandPrimaryDarkest,
              fontSize: fontSizeXXS,
            ),
            decoration: InputDecoration(
              filled: true,
              label: labelText != null
                  ? Text(
                      labelText!,
                      style: TextStyle(
                        color: ThemeColors.colorLightLabelsTertiary,
                        fontSize: fontSizeXXS,
                      ),
                    )
                  : null,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              fillColor: ThemeColors.colorLightBackgroundsSecondary,
              prefixIcon: prefixIcon,
              prefixText: prefixText,
              prefixIconConstraints: prefixIconConstraints,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              suffix: suffix,
              hintText: hintText,
              hintStyle: TextStyle(color: hintColor, fontSize: fontSizeXXS),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(),
              ),
              enabledBorder: enabledBorder,
              focusedBorder: focusedBorder,
              focusedErrorBorder: focusedBorder,
              errorBorder: errorText != null ? errorBorder : enabledBorder,
              errorMaxLines: errorMaxLines,
              errorText: errorText ?? helperText,
              errorStyle: errorText != null ? errorTextStyle : helperTextStyle,
              suffixIcon: getSuffixIcon(),
              suffixIconConstraints: BoxConstraints(maxHeight: 24),
            ),
            keyboardType: keyboardType,
            inputFormatters: textInputFormatterList,
            onChanged: onChangedFunction,
          ),
        ),
      ],
    );
  }

  Widget? getSuffixIcon() {
    if (isInputValid == true) {
      return Padding(
        padding: EdgeInsets.only(
          right: 10,
        ),
        child: SvgPicture.asset(
          GlobalAssets.validSvg,
        ),
      );
    }

    if (errorText != null) {
      return Padding(
        padding: EdgeInsets.only(
          right: 10,
        ),
        child: SvgPicture.asset(
          GlobalAssets.errorSvg,
        ),
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return defaultInput;
  }
}
