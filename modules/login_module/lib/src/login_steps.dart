import 'package:login_module/components/assets/assets.gen.dart';

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
        title: "To start, please validate your mobile phone number.",
        desc: ""),
    LoginStep(
        image: Assets.stepTwo,
        imageText: "text 2",
        title: "Enter Verification Code",
        desc: ""),
  ];
}
