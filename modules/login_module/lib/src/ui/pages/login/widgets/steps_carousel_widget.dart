import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_module/src/login_steps.dart';

class StepsCarouselWidget extends HookConsumerWidget {
  final CarouselController controller;

  const StepsCarouselWidget(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentIndex = useState(0);
    return CarouselSlider.builder(
      carouselController: controller,
      itemCount: loginSteps.length,
      itemBuilder: (_, index, pageIndex) {
        final item = loginSteps.elementAt(index);
        final isCurrentItem = currentIndex.value == pageIndex;
        final isPreviousItem = pageIndex < currentIndex.value;

        return Transform.rotate(
          angle: isCurrentItem
              ? 0
              : (isPreviousItem)
                  ? -0.08
                  : 0.08,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: isCurrentItem ? 1 : 0.7,
                  child: item.image.image(),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  item.imageText,
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        );
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height / 3.2,
        initialPage: 0,
        viewportFraction: 0.60,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        enableInfiniteScroll: false,
        autoPlay: false,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, _) {
          currentIndex.value = index;
        },
      ),
    );
  }
}