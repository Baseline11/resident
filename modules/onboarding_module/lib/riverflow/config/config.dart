import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_module/riverflow/command/onboarding_command.dart';
import 'package:riverflow/utils/signal_command_map.dart';

ProviderContainer configureOnboardingModule(ProviderContainer parent) {
  var providerContainer = ProviderContainer(overrides: [
    signalCommandMapProvider.overrideWithProvider(
        Provider((ref) => SignalCommandMap(ref.container)))
  ], parent: parent);
  mapCommands(providerContainer);

  return providerContainer;
}

void mapCommands(ProviderContainer container) {
  final signalCommandMap = container.read(signalCommandMapProvider);
  mapOnboardingCommands(signalCommandMap);
}
