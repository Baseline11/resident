// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginUserPayload {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginUserPayloadCopyWith<LoginUserPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginUserPayloadCopyWith<$Res> {
  factory $LoginUserPayloadCopyWith(
          LoginUserPayload value, $Res Function(LoginUserPayload) then) =
      _$LoginUserPayloadCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginUserPayloadCopyWithImpl<$Res>
    implements $LoginUserPayloadCopyWith<$Res> {
  _$LoginUserPayloadCopyWithImpl(this._value, this._then);

  final LoginUserPayload _value;
  // ignore: unused_field
  final $Res Function(LoginUserPayload) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginUserPayloadCopyWith<$Res>
    implements $LoginUserPayloadCopyWith<$Res> {
  factory _$LoginUserPayloadCopyWith(
          _LoginUserPayload value, $Res Function(_LoginUserPayload) then) =
      __$LoginUserPayloadCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class __$LoginUserPayloadCopyWithImpl<$Res>
    extends _$LoginUserPayloadCopyWithImpl<$Res>
    implements _$LoginUserPayloadCopyWith<$Res> {
  __$LoginUserPayloadCopyWithImpl(
      _LoginUserPayload _value, $Res Function(_LoginUserPayload) _then)
      : super(_value, (v) => _then(v as _LoginUserPayload));

  @override
  _LoginUserPayload get _value => super._value as _LoginUserPayload;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_LoginUserPayload(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginUserPayload implements _LoginUserPayload {
  _$_LoginUserPayload({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginUserPayload(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginUserPayload &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$LoginUserPayloadCopyWith<_LoginUserPayload> get copyWith =>
      __$LoginUserPayloadCopyWithImpl<_LoginUserPayload>(this, _$identity);
}

abstract class _LoginUserPayload implements LoginUserPayload {
  factory _LoginUserPayload(
      {required final String email,
      required final String password}) = _$_LoginUserPayload;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoginUserPayloadCopyWith<_LoginUserPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
