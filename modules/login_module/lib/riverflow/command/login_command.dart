import 'package:riverflow/utils/command.dart';
import 'package:riverflow/utils/signal_command_map.dart';
import 'package:riverpod/src/framework.dart';
import 'package:root/riverflow/user/store/user_store.dart';

import '../payload/login_payload.dart';
import '../signal/login_signal.dart';

void mapLoginCommand(SignalCommandMap signalCommandMap) {
  signalCommandMap.map1(loginUserSignalProvider,
      (providerContainer) => LoginCommand(providerContainer));
}

class LoginCommand extends Command1<LoginUserPayload> {
  LoginCommand(ProviderContainer container) : super(container);

  @override
  void execute(LoginUserPayload payload) {
    //Todo: Add call to auth service here and update login state
    readStore(userStoreProvider).updateUserLoginState(isLoggedIn: true);
  }
}
