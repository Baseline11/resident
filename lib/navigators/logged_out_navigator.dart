import 'package:flutter/material.dart';
import 'package:login_module/login_module.dart';

MaterialApp loggedOutNavigator() {
  return MaterialApp(
      home: Navigator(
    pages: const [
      MaterialPage(
        child: LoginModule(),
      ),
    ],
    onPopPage: (route, result) {
      return route.didPop(result);
    },
  ));
}
