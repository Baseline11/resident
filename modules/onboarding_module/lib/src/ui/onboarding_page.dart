import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:onboarding_module/src/ui/widgets/action_buttons_widget.dart';
import 'package:onboarding_module/src/ui/widgets/carousel_info_widget.dart';
import 'package:onboarding_module/src/ui/widgets/carousel_widget.dart';
import 'package:onboarding_module/src/ui/widgets/page_indicator_widget.dart';

class OnboardingPage extends HookWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carouselController = useState(CarouselController());

    // Todo: Need to update this after theme is declared
    return Scaffold(
      body: Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
              child: Column(
            children: [
              CarouselWidget(controller: carouselController.value),
              const CarouselInfoWidget(),
              const SizedBox(
                height: 40,
              ),
              const PageIndicatorWidget(),
              const Spacer(),
              ActionButtonsWidget(carouselController.value),
            ],
          ))),
    );
  }
}
