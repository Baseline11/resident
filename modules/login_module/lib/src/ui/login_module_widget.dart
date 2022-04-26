import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_module/riverflow/config/config.dart';
import 'package:riverflow/widgets/module_widget.dart';
import 'package:root/riverflow/user/observable/user_observable.dart';

import '../../riverflow/payload/login_payload.dart';
import '../../riverflow/signal/login_signal.dart';

class LoginModule extends StatelessWidget {
  const LoginModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: ModuleWidget(
              configure: () =>
                  configureLoginModule(ProviderScope.containerOf(context)),
              builder: (_) => Scaffold(
                    body: SafeArea(
                      child: Column(
                        children: [
                          Consumer(
                              builder: (context, ref, _) => Text(
                                  'Login module ${ref.watch(userObservableProvider).isLoggedIn}')),
                          Consumer(
                            builder: (context, ref, _) => MaterialButton(
                              onPressed: () {
                                ref.watch(loginUserSignalProvider).dispatch(
                                    LoginUserPayload(
                                        email: "email", password: "password"));
                              },
                              child: const Text('Login'),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
        ),
      ],
      onPopPage: (route, result) {
        return route.didPop(result);
      },
    );
  }
}
