import 'package:firebase_auth/firebase_auth.dart';

import './../../../data/repositories/repositories.dart';
import './../../../infra/repositories/repositories.dart';

AuthRepository makeAuthRepository() {
  return FirebaseAuthRepository(auth: FirebaseAuth.instance);
}
