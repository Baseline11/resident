import 'package:login_module/riverflow/observable/login_flow_state_observable.dart';
import 'package:login_module/riverflow/services/auth_service.dart';
import 'package:login_module/riverflow/store/login_flow_store.dart';
import 'package:riverflow/utils/command.dart';
import 'package:riverflow/utils/signal_command_map.dart';
import 'package:riverpod/src/framework.dart';
import 'package:root/riverflow/user/store/user_store.dart';

import '../payload/login_payload.dart';
import '../signal/login_signal.dart';

void mapLoginCommand(SignalCommandMap signalCommandMap) {
  signalCommandMap.map1(loginUserSignalProvider,
      (providerContainer) => LoginCommand(providerContainer));

  signalCommandMap.map0(verifyNumberSignalProvider,
      (providerContainer) => VerifyNumberCommand(providerContainer));
}

class LoginCommand extends Command1<LoginUserPayload> {
  LoginCommand(ProviderContainer container) : super(container);

  @override
  void execute(LoginUserPayload payload) {
    //Todo: Add call to auth service here and update login state

    readStore(userStoreProvider).updateUserLoginState(isLoggedIn: true);
  }
}

class VerifyNumberCommand extends Command0 {
  VerifyNumberCommand(ProviderContainer container) : super(container);

  @override
  void execute() async {
    // Todo: @matej add read service on command level as well
    LoginFlowStateObservable observable =
        providerContainer.read(loginFlowStateObservableProvider);
    final response = await readService(authServiceProvider)
        .verifyPhoneNumber(phoneNumber: observable.phoneNumber);

    //Todo: Check if true send code method is called

    readStore(loginFlowStoreProvider).codeSent();
  }
}
