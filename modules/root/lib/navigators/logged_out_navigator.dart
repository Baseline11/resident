import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_module/login_module.dart';
import 'package:onboarding_module/onboarding_module.dart';
import 'package:root/riverflow/bootstrap/observable/bootstrap_observable.dart';

Navigator loggedOutNavigator(WidgetRef ref) {
  var bootStrap = ref.watch(bootstrapObservableProvider);

  return Navigator(
    pages: [
      if (!bootStrap.onBoardingComplete)
        const MaterialPage(
          child: OnboardingModule(),
        ),
      const MaterialPage(child: LoginModule()),
    ],
    onPopPage: (route, result) {
      return route.didPop(result);
    },
  );
}
