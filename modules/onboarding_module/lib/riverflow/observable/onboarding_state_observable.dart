import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'onboarding_state_observable.freezed.dart';

final onboardingStateObservableProvider =
    StateProvider((ref) => OnboardingStateObservable());

@freezed
class OnboardingStateObservable with _$OnboardingStateObservable {
  factory OnboardingStateObservable({@Default(0) int currentPage}) =
      _OnboardingStateObservable;
}
