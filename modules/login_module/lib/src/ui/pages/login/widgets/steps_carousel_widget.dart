import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_module/riverflow/observable/login_flow_state_observable.dart';
import 'package:login_module/riverflow/payload/login_flow_state_payload.dart';
import 'package:login_module/riverflow/signal/login_flow_state_signal.dart';
import 'package:login_module/src/login_steps.dart';

class StepsCarouselWidget extends HookConsumerWidget {
  final CarouselController controller;

  const StepsCarouselWidget(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var currentIndex = ref.watch(loginFlowStateObservableProvider).currentPage;
    return CarouselSlider.builder(
      carouselController: controller,
      itemCount: loginSteps.length,
      itemBuilder: (_, index, pageIndex) {
        final item = loginSteps.elementAt(index);
        final isCurrentItem = currentIndex == pageIndex;
        final isPreviousItem = pageIndex < currentIndex;

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
        height: MediaQuery.of(context).size.height / 2.4,
        initialPage: currentIndex,
        viewportFraction: 0.65,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        enableInfiniteScroll: false,
        autoPlay: false,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, _) {
          ref
              .watch(updateCurrentPageSignalProvider)
              .dispatch(UpdateCurrentPagePayload(index: index));
        },
      ),
    );
  }
}
