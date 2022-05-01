import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'login_flow_state_observable.freezed.dart';

final loginFlowStateObservableProvider =
    StateProvider((ref) => LoginFlowStateObservable());

@freezed
class LoginFlowStateObservable with _$LoginFlowStateObservable {
  const LoginFlowStateObservable._();

  factory LoginFlowStateObservable({
    @Default(0) int currentPage,
    @Default("Canada") String countryCode,
    @Default("") String phoneNumber,
    @Default(false) bool isLoadingStep1,
    @Default(false) bool isLoadingStep2,
  }) = _LoginFlowStateObservable;

  bool get isFormValidStep1 => phoneNumber.isNotEmpty && countryCode.isNotEmpty;
}
