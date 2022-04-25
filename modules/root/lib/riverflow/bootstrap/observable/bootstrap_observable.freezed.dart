// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bootstrap_observable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BootstrapObservable {
  bool get bootstrapComplete => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BootstrapObservableCopyWith<BootstrapObservable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BootstrapObservableCopyWith<$Res> {
  factory $BootstrapObservableCopyWith(
          BootstrapObservable value, $Res Function(BootstrapObservable) then) =
      _$BootstrapObservableCopyWithImpl<$Res>;
  $Res call({bool bootstrapComplete});
}

/// @nodoc
class _$BootstrapObservableCopyWithImpl<$Res>
    implements $BootstrapObservableCopyWith<$Res> {
  _$BootstrapObservableCopyWithImpl(this._value, this._then);

  final BootstrapObservable _value;
  // ignore: unused_field
  final $Res Function(BootstrapObservable) _then;

  @override
  $Res call({
    Object? bootstrapComplete = freezed,
  }) {
    return _then(_value.copyWith(
      bootstrapComplete: bootstrapComplete == freezed
          ? _value.bootstrapComplete
          : bootstrapComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$BootstrapObservableCopyWith<$Res>
    implements $BootstrapObservableCopyWith<$Res> {
  factory _$BootstrapObservableCopyWith(_BootstrapObservable value,
          $Res Function(_BootstrapObservable) then) =
      __$BootstrapObservableCopyWithImpl<$Res>;
  @override
  $Res call({bool bootstrapComplete});
}

/// @nodoc
class __$BootstrapObservableCopyWithImpl<$Res>
    extends _$BootstrapObservableCopyWithImpl<$Res>
    implements _$BootstrapObservableCopyWith<$Res> {
  __$BootstrapObservableCopyWithImpl(
      _BootstrapObservable _value, $Res Function(_BootstrapObservable) _then)
      : super(_value, (v) => _then(v as _BootstrapObservable));

  @override
  _BootstrapObservable get _value => super._value as _BootstrapObservable;

  @override
  $Res call({
    Object? bootstrapComplete = freezed,
  }) {
    return _then(_BootstrapObservable(
      bootstrapComplete: bootstrapComplete == freezed
          ? _value.bootstrapComplete
          : bootstrapComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BootstrapObservable implements _BootstrapObservable {
  _$_BootstrapObservable({this.bootstrapComplete = false});

  @override
  @JsonKey()
  final bool bootstrapComplete;

  @override
  String toString() {
    return 'BootstrapObservable(bootstrapComplete: $bootstrapComplete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BootstrapObservable &&
            const DeepCollectionEquality()
                .equals(other.bootstrapComplete, bootstrapComplete));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(bootstrapComplete));

  @JsonKey(ignore: true)
  @override
  _$BootstrapObservableCopyWith<_BootstrapObservable> get copyWith =>
      __$BootstrapObservableCopyWithImpl<_BootstrapObservable>(
          this, _$identity);
}

abstract class _BootstrapObservable implements BootstrapObservable {
  factory _BootstrapObservable({final bool bootstrapComplete}) =
      _$_BootstrapObservable;

  @override
  bool get bootstrapComplete => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BootstrapObservableCopyWith<_BootstrapObservable> get copyWith =>
      throw _privateConstructorUsedError;
}
