import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:resident_flutter/enums/firebase_env_enum.dart';

import '../firebase_options.dart';

Future<void> initializeFirebase({required FirebaseEnv env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: env.fileName);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(dotenv.env),
  );
  return;
}
