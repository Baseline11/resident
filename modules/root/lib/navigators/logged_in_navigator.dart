import 'package:flutter/material.dart';
import 'package:resident_home_module/resident_home_module.dart';

Navigator loggedInNavigator() {
  return Navigator(
    pages: const [
      MaterialPage(
        child: ResidentHomeModule(),
      ),
    ],
    onPopPage: (route, result) {
      return route.didPop(result);
    },
  );
}
