import 'package:flutter/material.dart';
import 'package:login_module/login_module.dart';
import 'package:onboarding_module/onboarding_module.dart';

Navigator loggedOutNavigator() {
  return Navigator(
    pages: const [
      MaterialPage(
        child: OnboardingModule(),
      ),
    ],
    onPopPage: (route, result) {
      return route.didPop(result);
    },
  );
}
