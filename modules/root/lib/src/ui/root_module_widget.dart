import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/signal_command_map.dart';
import 'package:riverflow/widgets/module_widget.dart';
import 'package:root/navigators/logged_in_navigator.dart';
import 'package:root/navigators/logged_out_navigator.dart';
import 'package:root/riverflow/bootstrap/command/bootstrap_command.dart';
import 'package:root/riverflow/bootstrap/observable/bootstrap_observable.dart';
import 'package:root/riverflow/user/observable/user_observable.dart';
import 'package:root/src/ui/splash/splash_page.dart';

class RootModule extends StatelessWidget {
  static Future<ProviderContainer> initRootModule() async {
    final container = ProviderContainer();

    final signalCommandMap = container.read(signalCommandMapProvider);
    mapBootstrapCommand(signalCommandMap);

    return container;
  }

  final ProviderContainer providerContainer;

  const RootModule({Key? key, required this.providerContainer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleWidget(
      configure: () => providerContainer,
      builder: (_) => Consumer(builder: (_, ref, __) {
        final bootstrapComplete =
            ref.watch(bootstrapObservableProvider).bootstrapComplete;
        final isLoggedIn = ref.watch(userObservableProvider).isLoggedIn;

        return MaterialApp(
          home: bootstrapComplete
              ? (isLoggedIn ? loggedInNavigator() : loggedOutNavigator(ref))
              : const SplashPage(),
        );
      }),
    );
  }
}
