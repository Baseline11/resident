import 'package:flutter/material.dart';
import 'package:onboarding_module/src/ui/onboarding_page.dart';
import 'package:riverflow/widgets/module_widget.dart';

class OnboardingModule extends StatelessWidget {
  const OnboardingModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleWidget(builder: (_) => const OnboardingPage());
  }
}
