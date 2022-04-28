import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_service/keyboard_service.dart';
import 'package:login_module/riverflow/signal/login_signal.dart';
import 'package:login_module/src/ui/pages/login/widgets/login_step_one.dart';
import 'package:login_module/src/ui/pages/login/widgets/login_step_two.dart';
import 'package:login_module/src/ui/pages/login/widgets/steps_carousel_widget.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final carouselController = useState(CarouselController());
    final pageController = useState(PageController());

    final isKeyboardVisible = KeyboardService.isVisible(context);

    return KeyboardAutoDismiss(
      scaffold: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 32,
                ),
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 150),
                    child: isKeyboardVisible
                        ? Container()
                        : StepsCarouselWidget(carouselController.value)),
                Expanded(
                  child: PageView(
                    controller: pageController.value,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      LoginStepOne(
                        onNextPressed: () {
                          carouselController.value.nextPage();
                          pageController.value.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                          ref.watch(verifyNumberSignalProvider).dispatch();
                        },
                      ),
                      LoginStepTwo(onBackPressed: () {
                        carouselController.value.previousPage();
                        pageController.value.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
