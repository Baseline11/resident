import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_payload.freezed.dart';

@freezed
class LoginUserPayload with _$LoginUserPayload {
  factory LoginUserPayload({required String email, required String password}) =
      _LoginUserPayload;
}
