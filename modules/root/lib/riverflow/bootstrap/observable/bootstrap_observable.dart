import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'bootstrap_observable.freezed.dart';

final bootstrapObservableProvider =
    StateProvider((ref) => BootstrapObservable());

@freezed
class BootstrapObservable with _$BootstrapObservable {
  factory BootstrapObservable({@Default(false) bool bootstrapComplete}) =
      _BootstrapObservable;
}
