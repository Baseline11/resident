import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/widgets/module_widget.dart';
import 'package:root/riverflow/user/observable/user_observable.dart';

class RootModule extends StatefulWidget {
  static Future<ProviderContainer> initRootModule() async {
    final container = ProviderContainer();
    return container;
  }

  final Widget loggedInNavigator;
  final Widget loggedOutNavigator;
  final ProviderContainer providerContainer;

  const RootModule(
      {Key? key,
      required this.loggedInNavigator,
      required this.loggedOutNavigator,
      required this.providerContainer})
      : super(key: key);

  @override
  State<RootModule> createState() => _RootModuleState();
}

class _RootModuleState extends State<RootModule> {
  @override
  Widget build(BuildContext context) {
    return ModuleWidget(
      configure: () => widget.providerContainer,
      builder: (_) => Consumer(builder: (_, ref, __) {
        final isLoggedIn = ref.watch(userObservableProvider).isLoggedIn;
        return MaterialApp(
          home:
              isLoggedIn ? widget.loggedInNavigator : widget.loggedOutNavigator,
        );
      }),
    );
  }
}
