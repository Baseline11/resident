// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'onboarding_state_observable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingStateObservable {
  int get currentPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnboardingStateObservableCopyWith<OnboardingStateObservable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateObservableCopyWith<$Res> {
  factory $OnboardingStateObservableCopyWith(OnboardingStateObservable value,
          $Res Function(OnboardingStateObservable) then) =
      _$OnboardingStateObservableCopyWithImpl<$Res>;
  $Res call({int currentPage});
}

/// @nodoc
class _$OnboardingStateObservableCopyWithImpl<$Res>
    implements $OnboardingStateObservableCopyWith<$Res> {
  _$OnboardingStateObservableCopyWithImpl(this._value, this._then);

  final OnboardingStateObservable _value;
  // ignore: unused_field
  final $Res Function(OnboardingStateObservable) _then;

  @override
  $Res call({
    Object? currentPage = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$OnboardingStateObservableCopyWith<$Res>
    implements $OnboardingStateObservableCopyWith<$Res> {
  factory _$OnboardingStateObservableCopyWith(_OnboardingStateObservable value,
          $Res Function(_OnboardingStateObservable) then) =
      __$OnboardingStateObservableCopyWithImpl<$Res>;
  @override
  $Res call({int currentPage});
}

/// @nodoc
class __$OnboardingStateObservableCopyWithImpl<$Res>
    extends _$OnboardingStateObservableCopyWithImpl<$Res>
    implements _$OnboardingStateObservableCopyWith<$Res> {
  __$OnboardingStateObservableCopyWithImpl(_OnboardingStateObservable _value,
      $Res Function(_OnboardingStateObservable) _then)
      : super(_value, (v) => _then(v as _OnboardingStateObservable));

  @override
  _OnboardingStateObservable get _value =>
      super._value as _OnboardingStateObservable;

  @override
  $Res call({
    Object? currentPage = freezed,
  }) {
    return _then(_OnboardingStateObservable(
      currentPage: currentPage == freezed
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OnboardingStateObservable implements _OnboardingStateObservable {
  _$_OnboardingStateObservable({this.currentPage = 0});

  @override
  @JsonKey()
  final int currentPage;

  @override
  String toString() {
    return 'OnboardingStateObservable(currentPage: $currentPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OnboardingStateObservable &&
            const DeepCollectionEquality()
                .equals(other.currentPage, currentPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentPage));

  @JsonKey(ignore: true)
  @override
  _$OnboardingStateObservableCopyWith<_OnboardingStateObservable>
      get copyWith =>
          __$OnboardingStateObservableCopyWithImpl<_OnboardingStateObservable>(
              this, _$identity);
}

abstract class _OnboardingStateObservable implements OnboardingStateObservable {
  factory _OnboardingStateObservable({final int currentPage}) =
      _$_OnboardingStateObservable;

  @override
  int get currentPage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OnboardingStateObservableCopyWith<_OnboardingStateObservable>
      get copyWith => throw _privateConstructorUsedError;
}
