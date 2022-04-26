import 'package:onboarding_module/riverflow/signal/onboarding_signal.dart';
import 'package:riverflow/utils/command.dart';
import 'package:riverflow/utils/signal_command_map.dart';
import 'package:riverpod/src/framework.dart';
import 'package:root/riverflow/bootstrap/store/bootstrap_store.dart';
import 'package:root/riverflow/services/local_storage/local_storage_service.dart';
import 'package:root/riverflow/services/services.dart';

import '../store/onboarding_store.dart';

void mapOnboardingCommands(SignalCommandMap signalCommandMap) {
  signalCommandMap.map1(updateCurrentPageSignalProvider,
      (providerContainer) => UpdateCurrentPageCommand(providerContainer));

  signalCommandMap.map0(completeOnboardingSignalProvider,
      (providerContainer) => CompleteOnboardingCommand(providerContainer));
}

class UpdateCurrentPageCommand extends Command1<int> {
  UpdateCurrentPageCommand(ProviderContainer container) : super(container);

  @override
  void execute(int payload) {
    //Updates store
    readStore(onboardingStoreProvider).updateCurrentPage(payload);
  }
}

class CompleteOnboardingCommand extends Command0 {
  CompleteOnboardingCommand(ProviderContainer container) : super(container);

  @override
  void execute() {
    //Writes to local storage service
    readService(localStorageServiceProvider)
        .write(key: LocalStorageKeys.onBoardingCompleted, value: true);
    readStore(bootstrapStoreProvider).completeOnboarding();
  }
}
