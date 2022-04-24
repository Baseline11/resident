import 'package:flutter/material.dart';
import 'package:resident_home_module/resident_home_module.dart';

MaterialApp loggedInNavigator() {
  return MaterialApp(
      home: Navigator(
    pages: const [
      MaterialPage(
        child: ResidentHomeModule(),
      ),
    ],
    onPopPage: (route, result) {
      return route.didPop(result);
    },
  ));
}
