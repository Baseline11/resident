import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auth_service/auth_service.dart';

import 'package:login_module/riverflow/observable/login_flow_state_observable.dart';
import 'package:login_module/riverflow/services/auth_service.dart';
import 'package:login_module/riverflow/store/login_flow_store.dart';
import 'package:riverflow/utils/command.dart';
import 'package:riverflow/utils/signal_command_map.dart';
import 'package:root/riverflow/user/store/user_store.dart';

import './../payload/payload.dart';
import '../signal/login_signal.dart';

void mapLoginCommand(SignalCommandMap signalCommandMap) {
  signalCommandMap.map1(loginUserSignalProvider,
      (providerContainer) => LoginCommand(providerContainer));

  signalCommandMap.map0(verifyNumberSignalProvider,
      (providerContainer) => VerifyNumberCommand(providerContainer));

  signalCommandMap.map1(verifyCodeSignalProvider,
      (providerContainer) => VerifyCodeCommand(providerContainer));
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
    try {
      LoginFlowStateObservable observable =
          providerContainer.read(loginFlowStateObservableProvider);
      final bool hasCodeBeenSent = await readService(authServiceProvider)
          .verifyPhoneNumber(phoneNumber: observable.phoneNumber);

      if (hasCodeBeenSent == true) {
        readStore(loginFlowStoreProvider).codeSent();
      } else {
        // TODO: Action if we couldn't send the code
        // WE COULDNT SEND THE CODE... TRY AGAIN?
      }
    } catch (error) {
      // TODO: Action when exception
    }
  }
}

class VerifyCodeCommand extends Command1<AddCodePayload> {
  VerifyCodeCommand(ProviderContainer container) : super(container);

  @override
  void execute(AddCodePayload payload) async {
    try {
      final UserAuthEntity user =
          await readService(authServiceProvider).verifyCode(code: payload.code);

      // TODO: Action if the user entered a wrong or correct code
      if (user != null) {
        // AUTHENTICATED
      } else {
        // WRONG CODE
      }
    } catch (error) {
      // TODO: Action when exception
    }
  }
}
