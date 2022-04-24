import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/widgets/module_widget.dart';
import 'package:root/riverflow/user/observable/user_observable.dart';

class RootModule extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ModuleWidget(
      configure: () => providerContainer,
      builder: (_) => Consumer(builder: (_, ref, __) {
        final isLoggedIn = ref.watch(userObservableProvider).isLoggedIn;
        return isLoggedIn ? loggedInNavigator : loggedOutNavigator;
      }),
    );
  }
}
