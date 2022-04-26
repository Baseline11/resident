import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'user_observable.freezed.dart';

final userObservableProvider = StateProvider((ref) => UserObservable());

@freezed
class UserObservable with _$UserObservable {
  factory UserObservable({@Default(false) bool isLoggedIn}) = _UserObservable;
}
