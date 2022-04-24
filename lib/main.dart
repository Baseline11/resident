import 'package:flutter/material.dart';
import 'package:resident_flutter/navigators/logged_in_navigator.dart';
import 'package:resident_flutter/navigators/logged_out_navigator.dart';
import 'package:root/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final providerContainer = await RootModule.initRootModule();

  runApp(
    RootModule(
        loggedOutNavigator: loggedOutNavigator(),
        loggedInNavigator: loggedInNavigator(),
        providerContainer: providerContainer),
  );
}
