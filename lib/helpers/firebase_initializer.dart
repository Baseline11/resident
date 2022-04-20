import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:resident_flutter/enums/firebase_env_enum.dart';

import '../firebase_options.dart';

Future<void> initializeFirebase({required FirebaseEnv env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  var fileName = ".env";
  if (kDebugMode) {
    fileName = env.fileName;
  }
  await dotenv.load(fileName: env.fileName);

  final options = DefaultFirebaseOptions.currentPlatform(dotenv.env);

  await Firebase.initializeApp(
    options: options,
  );
  return;
}
