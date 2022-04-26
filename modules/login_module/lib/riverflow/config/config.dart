import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_module/riverflow/command/login_command.dart';
import 'package:riverflow/utils/signal_command_map.dart';

ProviderContainer configureLoginModule(ProviderContainer parent) {
  var providerContainer = ProviderContainer(overrides: [
    signalCommandMapProvider.overrideWithProvider(
        Provider((ref) => SignalCommandMap(ref.container)))
  ], parent: parent);
  mapCommands(providerContainer);

  return providerContainer;
}

void mapCommands(ProviderContainer container) {
  final signalCommandMap = container.read(signalCommandMapProvider);
  mapLoginCommand(signalCommandMap);
}
