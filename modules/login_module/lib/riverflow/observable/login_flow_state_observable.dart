import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'login_flow_state_observable.freezed.dart';

final loginFlowStateObservableProvider =
    StateProvider((ref) => LoginFlowStateObservable());

@freezed
class LoginFlowStateObservable with _$LoginFlowStateObservable {
  factory LoginFlowStateObservable({
    @Default(0) int currentPage,
    @Default("") String countryCode,
    @Default("") String phoneNumber,
    @Default("") String code,
  }) = _LoginFlowStateObservable;
}
