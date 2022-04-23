import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:login_module/login_module.dart';
import 'package:resident_home_module/resident_home_module.dart';
import 'package:root/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final providerContainer = await RootModule.initRootModule();

  runApp(
    RootModule(
        builder: (context) {
          return MaterialApp(
            home: Consumer(
              builder: (context, ref, _) {
                return Navigator(
                  pages: [
                    const MaterialPage(child: LoginModule()),
                    if (ref.watch(userObservableProvider).isLoggedIn)
                      const MaterialPage(child: ResidentHomeModule())
                  ],
                  onPopPage: (route, result) {
                    return route.didPop(result);
                  },
                );
              },
            ),
          );
        },
        providerContainer: providerContainer),
  );
}
