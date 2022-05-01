import 'package:login_module/components/assets/assets.gen.dart';

import './ui/helpers/helpers.dart';

class LoginStep {
  final AssetGenImage image;
  final String imageText;
  final String title;
  final String desc;

  LoginStep({
    required this.image,
    required this.imageText,
    required this.title,
    required this.desc,
  });
}

List<LoginStep> get loginSteps {
  return [
    LoginStep(
        image: Assets.stepOne,
        imageText: "text 1",
        title: R.strings.step1Title,
        desc: ""),
    LoginStep(
        image: Assets.stepTwo,
        imageText: "text 2",
        title: R.strings.step2Title,
        desc: "Please Enter the 6-digit code sent to"),
  ];
}
