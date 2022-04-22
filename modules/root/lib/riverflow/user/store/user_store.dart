import 'package:riverflow/utils/store.dart';
import 'package:riverpod/src/framework.dart';
import 'package:riverpod/src/provider.dart';
import 'package:root/riverflow/user/observable/user_observable.dart';

final userStoreProvider = Provider((ref) => UserStore(ref.container));

class UserStore extends BaseStore {
  UserStore(ProviderContainer providerContainer) : super(providerContainer);

  UserObservable get userObservable => readObservable(userObservableProvider);

  void login({required bool isLoggedIn}) {
    writeObservable(
        userObservableProvider, UserObservable(isLoggedIn: isLoggedIn));
  }
}
