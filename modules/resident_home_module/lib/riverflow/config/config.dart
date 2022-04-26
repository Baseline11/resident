import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal_command_map.dart';

ProviderContainer configureResidentHomeModule() {
  var providerContainer = ProviderContainer(overrides: [
    signalCommandMapProvider.overrideWithProvider(
        Provider((ref) => SignalCommandMap(ref.container)))
  ]);
  mapCommands(providerContainer);

  return providerContainer;
}

void mapCommands(ProviderContainer container) {

}