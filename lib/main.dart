import 'package:flutter/material.dart';
import 'package:resident_flutter/navigators/logged_in_navigator.dart';
import 'package:resident_flutter/navigators/logged_out_navigator.dart';
import 'package:root/root.dart';
import 'package:resident_flutter/enums/firebase_env_enum.dart';
import 'package:resident_flutter/helpers/firebase_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase(env: FirebaseEnv.dev);

  final providerContainer = await RootModule.initRootModule();

  runApp(
    RootModule(
        loggedOutNavigator: loggedOutNavigator(),
        loggedInNavigator: loggedInNavigator(),
        providerContainer: providerContainer),
  );
}
