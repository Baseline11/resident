import 'package:firebase_auth/firebase_auth.dart';

import './../domain/entities/entities.dart';

import './user_authentication_service.dart';

class FirebaseUserAuthenticationService implements UserAuthenticationService {
  final FirebaseAuth auth;

  FirebaseUserAuthenticationService({required this.auth});

  @override
  Future<UserAuthEntity> login({required AuthenticationParams params}) async {
    try {
      final FirebaseAuthenticationParams firebaseParams =
          FirebaseAuthenticationParams.fromDomain(params);

      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: firebaseParams.email,
        password: firebaseParams.password,
      );

      if (userCredential.user != null) {
        return UserAuthEntity(
          token: userCredential.user!.uid,
          email: firebaseParams.email,
        );
      } else {
        throw Exception();
      }
    } catch (e) {
      // TODO: map the type of exception I should throw
      rethrow;
    }
  }
}

class FirebaseAuthenticationParams {
  final String email;
  final String password;

  FirebaseAuthenticationParams({
    required this.email,
    required this.password,
  });

  factory FirebaseAuthenticationParams.fromDomain(
          AuthenticationParams params) =>
      FirebaseAuthenticationParams(
        email: params.email,
        password: params.secret,
      );
}
