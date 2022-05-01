import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_module/riverflow/payload/login_flow_state_payload.dart';
import 'package:login_module/riverflow/signal/login_flow_state_signal.dart';
import 'package:login_module/riverflow/store/login_flow_store.dart';
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
  void execute(UpdateCountryPayload payload) {
    readStore(loginFlowStoreProvider).updateCountry(payload);
  }
}

class UpdateNumberCommand extends Command1<UpdateNumberPayload> {
  UpdateNumberCommand(ProviderContainer container) : super(container);

  @override
  void execute(UpdateNumberPayload payload) {
    readStore(loginFlowStoreProvider).updatePhoneNumber(payload);
  }
}

class UpdateIsLoadingStep1Command
    extends Command1<UpdateIsLoadingStep1Payload> {
  UpdateIsLoadingStep1Command(ProviderContainer container) : super(container);

  @override
  void execute(UpdateIsLoadingStep1Payload payload) {
    readStore(loginFlowStoreProvider).updateIsLoadingStep1(payload);
  }
}

class UpdateIsLoadingStep2Command
    extends Command1<UpdateIsLoadingStep2Payload> {
  UpdateIsLoadingStep2Command(ProviderContainer container) : super(container);

  @override
  void execute(UpdateIsLoadingStep2Payload payload) {
    readStore(loginFlowStoreProvider).updateIsLoadingStep2(payload);
  }
}

class UpdateCurrentPageCommand extends Command1<UpdateCurrentPagePayload> {
  UpdateCurrentPageCommand(ProviderContainer container) : super(container);

  @override
  void execute(UpdateCurrentPagePayload payload) {
    readStore(loginFlowStoreProvider).updatePageNumber(payload);
  }
}
