import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_auth_entity.freezed.dart';

@freezed
class PhoneAuthEntity with _$PhoneAuthEntity {
  const factory PhoneAuthEntity({
    required String token,
    String? email,
    String? phoneNumber,
  }) = _PhoneAuthEntity;
}
