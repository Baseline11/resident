import 'package:flutter/material.dart';
import 'package:root/root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final providerContainer = await RootModule.initRootModule();

  runApp(
    RootModule(providerContainer: providerContainer),
  );
}
