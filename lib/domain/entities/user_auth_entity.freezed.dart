// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_auth_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserAuthEntityTearOff {
  const _$UserAuthEntityTearOff();

  _UserAuthEntity call({required String token, required String email}) {
    return _UserAuthEntity(
      token: token,
      email: email,
    );
  }
}

/// @nodoc
const $UserAuthEntity = _$UserAuthEntityTearOff();

/// @nodoc
mixin _$UserAuthEntity {
  String get token => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserAuthEntityCopyWith<UserAuthEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAuthEntityCopyWith<$Res> {
  factory $UserAuthEntityCopyWith(
          UserAuthEntity value, $Res Function(UserAuthEntity) then) =
      _$UserAuthEntityCopyWithImpl<$Res>;
  $Res call({String token, String email});
}

/// @nodoc
class _$UserAuthEntityCopyWithImpl<$Res>
    implements $UserAuthEntityCopyWith<$Res> {
  _$UserAuthEntityCopyWithImpl(this._value, this._then);

  final UserAuthEntity _value;
  // ignore: unused_field
  final $Res Function(UserAuthEntity) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserAuthEntityCopyWith<$Res>
    implements $UserAuthEntityCopyWith<$Res> {
  factory _$UserAuthEntityCopyWith(
          _UserAuthEntity value, $Res Function(_UserAuthEntity) then) =
      __$UserAuthEntityCopyWithImpl<$Res>;
  @override
  $Res call({String token, String email});
}

/// @nodoc
class __$UserAuthEntityCopyWithImpl<$Res>
    extends _$UserAuthEntityCopyWithImpl<$Res>
    implements _$UserAuthEntityCopyWith<$Res> {
  __$UserAuthEntityCopyWithImpl(
      _UserAuthEntity _value, $Res Function(_UserAuthEntity) _then)
      : super(_value, (v) => _then(v as _UserAuthEntity));

  @override
  _UserAuthEntity get _value => super._value as _UserAuthEntity;

  @override
  $Res call({
    Object? token = freezed,
    Object? email = freezed,
  }) {
    return _then(_UserAuthEntity(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserAuthEntity implements _UserAuthEntity {
  const _$_UserAuthEntity({required this.token, required this.email});

  @override
  final String token;
  @override
  final String email;

  @override
  String toString() {
    return 'UserAuthEntity(token: $token, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAuthEntity &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$UserAuthEntityCopyWith<_UserAuthEntity> get copyWith =>
      __$UserAuthEntityCopyWithImpl<_UserAuthEntity>(this, _$identity);
}

abstract class _UserAuthEntity implements UserAuthEntity {
  const factory _UserAuthEntity(
      {required String token, required String email}) = _$_UserAuthEntity;

  @override
  String get token;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$UserAuthEntityCopyWith<_UserAuthEntity> get copyWith =>
      throw _privateConstructorUsedError;
}