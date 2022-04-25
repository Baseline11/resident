import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../firebase_options.dart';

Future<void> initializeFirebase({required String env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  var fileName = ".env";
  if (kDebugMode) {
    fileName = env;
  }
  await dotenv.load(fileName: env);

  final options = DefaultFirebaseOptions.currentPlatform(dotenv.env);

  await Firebase.initializeApp(
    options: options,
  );
  return;
}
