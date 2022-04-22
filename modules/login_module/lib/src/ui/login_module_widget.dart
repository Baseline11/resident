import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/widgets/module_widget.dart';

import '../../riverflow/signal/login_signal.dart';

class LoginModule extends StatelessWidget {
  const LoginModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleWidget(
        builder: (_) => Scaffold(
              body: Column(
                children: [
                  const Text('Login module'),
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
            ));
  }
}
