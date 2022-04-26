import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_module/riverflow/observable/onboarding_state_observable.dart';
import 'package:onboarding_module/src/onboarding_items.dart';

class CarouselInfoWidget extends ConsumerWidget {
  const CarouselInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var index = ref.watch(onboardingStateObservableProvider).currentPage;
    final onboardingItem = onboardingItems[index];
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Todo: Should be coming from themes
        Text(
          onboardingItem.title,
          style: const TextStyle(
              fontSize: 28, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          onboardingItem.desc,
          style: const TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
