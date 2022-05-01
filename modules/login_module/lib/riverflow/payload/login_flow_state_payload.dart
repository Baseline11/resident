// country , number , current page

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_flow_state_payload.freezed.dart';

@freezed
class UpdateCountryPayload with _$UpdateCountryPayload {
  factory UpdateCountryPayload({required String country}) =
      _UpdateCountryPayload;
}

@freezed
class UpdateNumberPayload with _$UpdateNumberPayload {
  factory UpdateNumberPayload({required String number}) = _UpdateNumberPayload;
}

@freezed
class UpdateCurrentPagePayload with _$UpdateCurrentPagePayload {
  factory UpdateCurrentPagePayload({required int index}) =
      _UpdateCurrentPagePayload;
}

@freezed
class VerifyCodePayload with _$VerifyCodePayload {
  factory VerifyCodePayload({required String code}) = _VerifyCodePayload;
}
