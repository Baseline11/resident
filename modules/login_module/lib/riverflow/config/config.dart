import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_module/riverflow/command/login_command.dart';
import 'package:riverflow/utils/signal_command_map.dart';

ProviderContainer configureLoginModule() {
  var providerContainer = ProviderContainer(overrides: [
    signalCommandMapProvider.overrideWithProvider(
        Provider((ref) => SignalCommandMap(ref.container)))
  ]);
  mapCommands(providerContainer);

  return providerContainer;
}

void mapCommands(ProviderContainer container) {
  final signalCommandMap = container.read(signalCommandMapProvider);
  mapLoginCommand(signalCommandMap);
}
