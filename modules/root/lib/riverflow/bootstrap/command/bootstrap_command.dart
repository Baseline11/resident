import 'package:riverflow/utils/command.dart';
import 'package:riverflow/utils/signal_command_map.dart';
import 'package:riverpod/src/framework.dart';
import 'package:root/riverflow/bootstrap/signal/bootstrap_signal.dart';
import 'package:root/riverflow/bootstrap/store/bootstrap_store.dart';

void mapBootstrapCommand(SignalCommandMap signalCommandMap) {
  signalCommandMap.map0(bootstrapSignalProvider,
      (providerContainer) => BootstrapCommand(providerContainer));
}

class BootstrapCommand extends Command0 {
  BootstrapCommand(ProviderContainer container) : super(container);

  @override
  void execute() {
    //Todo: We will add a bootstrap service, initialize stuff and call auth service here to update userObservable
    Future.delayed(const Duration(seconds: 2), () {
      readStore(bootstrapStoreProvider)
          .updateBootstrapState(bootstrapComplete: true);
    });
  }
}
