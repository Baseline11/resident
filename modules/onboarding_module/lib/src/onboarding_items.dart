import 'package:onboarding_module/components/assets/assets.gen.dart';

class OnboardingItem {
  final AssetGenImage image;
  final String title;
  final String desc;

  OnboardingItem(
      {required this.image, required this.title, required this.desc});
}

List<OnboardingItem> get onboardingItems {
  return [
    OnboardingItem(image: Assets.onboarding1, title: "title 1", desc: "desc 1"),
    OnboardingItem(image: Assets.onboarding2, title: "title 1", desc: "desc 1"),
    OnboardingItem(image: Assets.onboarding3, title: "title 1", desc: "desc 1"),
    OnboardingItem(image: Assets.onboarding4, title: "title 1", desc: "desc 1"),
  ];
}
