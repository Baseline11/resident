import 'package:cloud_firestore/cloud_firestore.dart';

import './../../../data/repositories/repositories.dart';
import './../../../infra/repositories/repositories.dart';

UserRepository makeUserRepository() {
  return FirebaseUserRepository(
    firebasInstance: FirebaseFirestore.instance,
  );
}
