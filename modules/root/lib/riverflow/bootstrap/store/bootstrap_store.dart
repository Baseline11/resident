import 'package:riverflow/utils/store.dart';
import 'package:riverpod/src/framework.dart';
import 'package:riverpod/src/provider.dart';
import 'package:root/riverflow/bootstrap/observable/bootstrap_observable.dart';

final bootstrapStoreProvider = Provider((ref) => BootstrapStore(ref.container));

class BootstrapStore extends BaseStore {
  BootstrapStore(ProviderContainer providerContainer)
      : super(providerContainer);

  void updateBootstrapState({required bool bootstrapComplete}) {
    writeObservable(bootstrapObservableProvider,
        BootstrapObservable(bootstrapComplete: bootstrapComplete));
  }
}
