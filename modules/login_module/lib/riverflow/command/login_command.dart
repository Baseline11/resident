import 'package:riverflow/utils/command.dart';
import 'package:riverpod/src/framework.dart';
import 'package:root/riverflow/user/store/user_store.dart';

import '../signal/login_signal.dart';

class LoginCommand extends Command1<LoginUserPayload> {
  LoginCommand(ProviderContainer container) : super(container);

  @override
  void execute(LoginUserPayload payload) {
    //Todo: Add call to auth service here and update login state
    readStore(userStoreProvider).login(isLoggedIn: true);
  }
}

// LoginModule separate ... will have the command and signal
