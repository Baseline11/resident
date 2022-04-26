import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_module/riverflow/observable/onboarding_state_observable.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../onboarding_items.dart';

class PageIndicatorWidget extends ConsumerWidget {
  const PageIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final index = ref.watch(onboardingStateObservableProvider).currentPage;
    return AnimatedSmoothIndicator(
      activeIndex: index,
      count: onboardingItems.length,
      effect: ScaleEffect(
        activeDotColor: Colors.white,
        dotColor: const Color(0xFFDCDCDD).withOpacity(0.3),
        dotWidth: 4,
        dotHeight: 4,
        scale: 2,
      ),
    );
  }
}
