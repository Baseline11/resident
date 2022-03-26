import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import './../helpers/helpers.dart';

import './theme/theme.dart';
import './assets/assets.dart';

import './primary_button.dart';

class ReloadScreen extends StatelessWidget {
  final String error;
  final Future<void> Function() reload;

  ReloadScreen({
    required this.error,
    required this.reload,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final totalWidth = mediaQuery.size.width;
    final totalHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom -
        mediaQuery.viewInsets.bottom;

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: SvgPicture.asset(
                SurveysAssets.bugSvg,
                height: totalHeight * 0.3,
              ),
            ),
          ),
          Text(
            error,
            style: TextStyle(
              color: colorBrandPrimaryDarkest,
              fontSize: fontSizeXS,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          PrimaryButton(
            onPressed: reload,
            buttonText: R.strings.reload.toUpperCase(),
            overlayColor: colorBrandPrimaryDarkest,
            backgroundColor: colorBrandPrimaryDark,
            backgroundDisabledColor: colorBrandPrimaryLight,
            totalWidth: totalWidth,
          ),
        ],
      ),
    );
  }
}
