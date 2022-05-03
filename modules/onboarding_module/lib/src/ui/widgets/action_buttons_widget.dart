import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_module/riverflow/observable/onboarding_state_observable.dart';
import 'package:onboarding_module/riverflow/signal/onboarding_signal.dart';
import 'package:onboarding_module/src/onboarding_items.dart';
import 'package:shared_widgets/shared_widgets.dart';

class ActionButtonsWidget extends ConsumerWidget {
  final CarouselController controller;

  const ActionButtonsWidget(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isLastPage =
        ref.watch(onboardingStateObservableProvider).currentPage ==
            (onboardingItems.length - 1);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isLastPage)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: PrimaryActionButton(
                onPressed: () {
                  controller.nextPage();
                },
                buttonText: "Next"),
          ),
        if (!isLastPage)
          TextButton(
              onPressed: () {
                ref.watch(completeOnboardingSignalProvider).dispatch();
              },
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.white),
              )),
        if (isLastPage)
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 56),
            child: PrimaryActionButton(
              onPressed: () {
                ref.watch(completeOnboardingSignalProvider).dispatch();
              },
              buttonText: "Get Started",
              trailingWidget: const Icon(
                Icons.arrow_forward,
                color: Colors.blue,
              ),
            ),
          ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
