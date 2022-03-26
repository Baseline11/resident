import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './../../../data/repositories/repositories.dart';
import './../../../data/models/models.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseFirestore firebasInstance;
  static final String collectionName = 'users';

  FirebaseUserRepository({
    required this.firebasInstance,
  });

  Future<void> setUser({required FirebaseUserModel userModel}) async {
    try {
      await firebasInstance.collection(collectionName).doc(userModel.uid).set(
            userModel.toJson(),
          );
    } on FirebaseAuthException {
      throw RepositoryError.forbidden;
    } catch (error) {
      throw RepositoryError.badRequest;
    }
  }
}
