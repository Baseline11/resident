import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_module/riverflow/payload/login_flow_state_payload.dart';
import 'package:login_module/riverflow/signal/login_flow_state_signal.dart';
import 'package:riverflow/utils/command.dart';
import 'package:riverflow/utils/signal_command_map.dart';

void mapLoginFlowStateCommands(SignalCommandMap signalCommandMap) {
  signalCommandMap.map1(updateCountrySignalProvider,
      (providerContainer) => UpdateCountryCommand(providerContainer));

  signalCommandMap.map1(updateNumberSignalProvider,
      (providerContainer) => UpdateNumberCommand(providerContainer));

  signalCommandMap.map1(updateCurrentPageSignalProvider,
      (providerContainer) => UpdateCurrentPageCommand(providerContainer));
}

class UpdateCountryCommand extends Command1<UpdateCountryPayload> {
  UpdateCountryCommand(ProviderContainer container) : super(container);

  @override
  void execute(UpdateCountryPayload payload) {}
}

class UpdateNumberCommand extends Command1<UpdateNumberPayload> {
  UpdateNumberCommand(ProviderContainer container) : super(container);

  @override
  void execute(UpdateNumberPayload payload) {}
}

class UpdateCurrentPageCommand extends Command1<UpdateCurrentPagePayload> {
  UpdateCurrentPageCommand(ProviderContainer container) : super(container);

  @override
  void execute(UpdateCurrentPagePayload payload) {}
}
