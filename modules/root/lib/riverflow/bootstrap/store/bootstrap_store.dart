import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/store.dart';
import 'package:root/riverflow/bootstrap/observable/bootstrap_observable.dart';

final bootstrapStoreProvider = Provider((ref) => BootstrapStore(ref.container));

class BootstrapStore extends BaseStore {
  BootstrapStore(ProviderContainer providerContainer)
      : super(providerContainer);

  void updateBootstrapState(
      {required bool bootstrapComplete, required bool onBoardingComplete}) {
    writeObservable(
        bootstrapObservableProvider,
        BootstrapObservable(
            bootstrapComplete: bootstrapComplete,
            onBoardingComplete: onBoardingComplete));
  }

  void completeOnboarding() {
    var bootStrap = readObservable(bootstrapObservableProvider);
    writeObservable(bootstrapObservableProvider,
        bootStrap.copyWith(onBoardingComplete: true));
  }
}
