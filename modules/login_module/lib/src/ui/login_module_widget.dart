import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_module/riverflow/config/config.dart';
import 'package:login_module/src/ui/pages/login/login_page.dart';
import 'package:riverflow/widgets/module_widget.dart';

class LoginModule extends StatelessWidget {
  const LoginModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModuleWidget(
      configure: () => configureLoginModule(ProviderScope.containerOf(context)),
      builder: (_) => Navigator(
        pages: const [
          MaterialPage(child: LoginPage()),
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
