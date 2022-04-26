import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_module/riverflow/observable/onboarding_state_observable.dart';
import 'package:riverflow/utils/store.dart';
import 'package:riverpod/src/framework.dart';

final onboardingStoreProvider = Provider((ref) => OnboardingStore(ref.container));

class OnboardingStore extends BaseStore {
  OnboardingStore(ProviderContainer providerContainer)
      : super(providerContainer);

  void updateCurrentPage(int index) {
    writeObservable(onboardingStateObservableProvider,
        OnboardingStateObservable(currentPage: index));
  }
}
