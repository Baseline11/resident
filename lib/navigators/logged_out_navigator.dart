import 'package:flutter/material.dart';
import 'package:login_module/login_module.dart';

Navigator loggedOutNavigator() {
  return Navigator(
    pages: const [
      MaterialPage(
        child: LoginModule(),
      ),
    ],
    onPopPage: (route, result) {
      return route.didPop(result);
    },
  );
}
