import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../riverflow/signal/onboarding_signal.dart';
import '../../onboarding_items.dart';

class CarouselWidget extends HookWidget {
  final CarouselController controller;

  const CarouselWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentIndex = useState(0);
    return Consumer(
      builder: (_, ref, __) {
        return CarouselSlider.builder(
          carouselController: controller,
          itemCount: onboardingItems.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            final item = onboardingItems.elementAt(itemIndex);
            return Opacity(
              opacity: currentIndex.value != itemIndex ? 0.7 : 1,
              child: item.image.image(),
            );
          },
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 2,
              initialPage: 0,
              viewportFraction: 0.60,
              enableInfiniteScroll: false,
              autoPlay: false,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, _) {
                currentIndex.value = index;
                ref.watch(updateCurrentPageSignalProvider).dispatch(index);
              }),
        );
      },
    );
  }
}
