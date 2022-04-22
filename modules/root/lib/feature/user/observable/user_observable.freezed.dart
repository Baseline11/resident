// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_observable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserObservable {
  bool get isLoggedIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserObservableCopyWith<UserObservable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserObservableCopyWith<$Res> {
  factory $UserObservableCopyWith(
          UserObservable value, $Res Function(UserObservable) then) =
      _$UserObservableCopyWithImpl<$Res>;
  $Res call({bool isLoggedIn});
}

/// @nodoc
class _$UserObservableCopyWithImpl<$Res>
    implements $UserObservableCopyWith<$Res> {
  _$UserObservableCopyWithImpl(this._value, this._then);

  final UserObservable _value;
  // ignore: unused_field
  final $Res Function(UserObservable) _then;

  @override
  $Res call({
    Object? isLoggedIn = freezed,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserObservableCopyWith<$Res>
    implements $UserObservableCopyWith<$Res> {
  factory _$UserObservableCopyWith(
          _UserObservable value, $Res Function(_UserObservable) then) =
      __$UserObservableCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoggedIn});
}

/// @nodoc
class __$UserObservableCopyWithImpl<$Res>
    extends _$UserObservableCopyWithImpl<$Res>
    implements _$UserObservableCopyWith<$Res> {
  __$UserObservableCopyWithImpl(
      _UserObservable _value, $Res Function(_UserObservable) _then)
      : super(_value, (v) => _then(v as _UserObservable));

  @override
  _UserObservable get _value => super._value as _UserObservable;

  @override
  $Res call({
    Object? isLoggedIn = freezed,
  }) {
    return _then(_UserObservable(
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UserObservable implements _UserObservable {
  _$_UserObservable({this.isLoggedIn = false});

  @override
  @JsonKey()
  final bool isLoggedIn;

  @override
  String toString() {
    return 'UserObservable(isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserObservable &&
            const DeepCollectionEquality()
                .equals(other.isLoggedIn, isLoggedIn));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isLoggedIn));

  @JsonKey(ignore: true)
  @override
  _$UserObservableCopyWith<_UserObservable> get copyWith =>
      __$UserObservableCopyWithImpl<_UserObservable>(this, _$identity);
}

abstract class _UserObservable implements UserObservable {
  factory _UserObservable({final bool isLoggedIn}) = _$_UserObservable;

  @override
  bool get isLoggedIn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserObservableCopyWith<_UserObservable> get copyWith =>
      throw _privateConstructorUsedError;
}
