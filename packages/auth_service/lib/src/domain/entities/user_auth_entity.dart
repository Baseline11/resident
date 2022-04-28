import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_auth_entity.freezed.dart';

@freezed
class UserAuthEntity with _$UserAuthEntity {
  const factory UserAuthEntity({
    required String token,
    String? email,
    String? phoneNumber,
  }) = _UserAuthEntity;
}
