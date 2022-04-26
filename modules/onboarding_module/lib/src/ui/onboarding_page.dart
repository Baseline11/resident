import 'package:flutter/material.dart';
import 'package:onboarding_module/src/ui/widgets/carousel_widget.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Todo: Need to update this after theme is declared
    return Scaffold(
      body: Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
              child: Column(
            children: [
              CarouselWidget(),
            ],
          ))),
    );
  }
}
