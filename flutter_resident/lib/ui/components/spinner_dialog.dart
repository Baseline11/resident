import 'package:flutter/material.dart';
import 'package:flutter_resident/ui/components/components.dart';

import './../helpers/helpers.dart';

Future<void> showLoading(BuildContext context) async {
  await Future.delayed(Duration.zero);
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => SimpleDialog(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                height: 20,
              ),
              Text(
                R.strings.pleaseWait,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colorBrandPrimaryDarkest,
                  fontSize: fontSizeSM,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Future<void> hideLoading(BuildContext context) async {
  await Future.delayed(Duration.zero);
  if (Navigator.canPop(context)) {
    Navigator.of(context).pop();
  }
}
