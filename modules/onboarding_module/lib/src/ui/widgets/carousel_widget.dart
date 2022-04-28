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
            final isCurrentItem = currentIndex.value == itemIndex;
            final isPreviousItem = pageViewIndex < currentIndex.value;

            return Transform.rotate(
              angle: isCurrentItem
                  ? 0
                  : (isPreviousItem)
                      ? -0.08
                      : 0.08,
              child: Opacity(
                opacity: isCurrentItem ? 1 : 0.7,
                child: item.image.image(
                    height: MediaQuery.of(context).size.height / 2, width: 274),
              ),
            );
          },
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 1.9,
              initialPage: 0,
              viewportFraction: 0.70,
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
