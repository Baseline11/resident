import 'dart:io';

import 'package:flutter/material.dart';

/// Widget that can be used as a helper to return the appropriate widget for each platform
class BaseWidget extends StatelessWidget {
  // iOS
  final Widget? cupertinoWidget;
  // Default
  final Widget widget;

  const BaseWidget({Key? key, this.cupertinoWidget, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCupertino = Platform.isIOS;
    final hasCupertinoWidget = cupertinoWidget != null;

    if (hasCupertinoWidget) {
      return isCupertino ? cupertinoWidget! : widget;
    }
    return widget;
  }
}
