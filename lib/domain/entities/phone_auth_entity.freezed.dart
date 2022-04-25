// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'phone_auth_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PhoneAuthEntityTearOff {
  const _$PhoneAuthEntityTearOff();

  _PhoneAuthEntity call(
      {required String token, String? email, String? phoneNumber}) {
    return _PhoneAuthEntity(
      token: token,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
}

/// @nodoc
const $PhoneAuthEntity = _$PhoneAuthEntityTearOff();

/// @nodoc
mixin _$PhoneAuthEntity {
  String get token => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhoneAuthEntityCopyWith<PhoneAuthEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneAuthEntityCopyWith<$Res> {
  factory $PhoneAuthEntityCopyWith(
          PhoneAuthEntity value, $Res Function(PhoneAuthEntity) then) =
      _$PhoneAuthEntityCopyWithImpl<$Res>;
  $Res call({String token, String? email, String? phoneNumber});
}

/// @nodoc
class _$PhoneAuthEntityCopyWithImpl<$Res>
    implements $PhoneAuthEntityCopyWith<$Res> {
  _$PhoneAuthEntityCopyWithImpl(this._value, this._then);

  final PhoneAuthEntity _value;
  // ignore: unused_field
  final $Res Function(PhoneAuthEntity) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PhoneAuthEntityCopyWith<$Res>
    implements $PhoneAuthEntityCopyWith<$Res> {
  factory _$PhoneAuthEntityCopyWith(
          _PhoneAuthEntity value, $Res Function(_PhoneAuthEntity) then) =
      __$PhoneAuthEntityCopyWithImpl<$Res>;
  @override
  $Res call({String token, String? email, String? phoneNumber});
}

/// @nodoc
class __$PhoneAuthEntityCopyWithImpl<$Res>
    extends _$PhoneAuthEntityCopyWithImpl<$Res>
    implements _$PhoneAuthEntityCopyWith<$Res> {
  __$PhoneAuthEntityCopyWithImpl(
      _PhoneAuthEntity _value, $Res Function(_PhoneAuthEntity) _then)
      : super(_value, (v) => _then(v as _PhoneAuthEntity));

  @override
  _PhoneAuthEntity get _value => super._value as _PhoneAuthEntity;

  @override
  $Res call({
    Object? token = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_PhoneAuthEntity(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PhoneAuthEntity implements _PhoneAuthEntity {
  const _$_PhoneAuthEntity({required this.token, this.email, this.phoneNumber});

  @override
  final String token;
  @override
  final String? email;
  @override
  final String? phoneNumber;

  @override
  String toString() {
    return 'PhoneAuthEntity(token: $token, email: $email, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhoneAuthEntity &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phoneNumber));

  @JsonKey(ignore: true)
  @override
  _$PhoneAuthEntityCopyWith<_PhoneAuthEntity> get copyWith =>
      __$PhoneAuthEntityCopyWithImpl<_PhoneAuthEntity>(this, _$identity);
}

abstract class _PhoneAuthEntity implements PhoneAuthEntity {
  const factory _PhoneAuthEntity(
      {required String token,
      String? email,
      String? phoneNumber}) = _$_PhoneAuthEntity;

  @override
  String get token;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$PhoneAuthEntityCopyWith<_PhoneAuthEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
