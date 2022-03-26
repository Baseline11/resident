import 'package:firebase_auth/firebase_auth.dart';

import './../../../domain/domain.dart';
import './../../../data/repositories/repositories.dart';
import './../../../data/models/models.dart';

import './../helpers/helpers.dart';

class FirebaseAuthRepository implements AuthRepository {
  final FirebaseAuth auth;

  FirebaseAuthRepository({required this.auth});

  Future<AccountEntity> login({required AuthenticationParams params}) async {
    try {
      final FirebaseAuthenticationParams firebaseParams =
          FirebaseAuthenticationParams.fromDomain(params);

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: firebaseParams.email, password: firebaseParams.password);

      if (userCredential.user != null) {
        return AccountEntity(token: userCredential.user!.uid);
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseExceptionError.notFound.toCode) {
        throw RepositoryError.notFound;
      } else if (e.code == FirebaseExceptionError.wrongPassword.toCode) {
        throw RepositoryError.forbidden;
      }

      throw Exception();
    } catch (error) {
      throw RepositoryError.badRequest;
    }
  }

  Future<FirebaseUserModel> signUp({required AddAccountParams params}) async {
    try {
      final FirebaseRemoteAddAccountParams firebaseParams =
          FirebaseRemoteAddAccountParams.fromDomain(params);

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: firebaseParams.email,
        password: firebaseParams.password,
      );

      if (userCredential.user?.refreshToken != null) {
        return FirebaseUserModel(
          refreshToken: userCredential.user!.refreshToken!,
          uid: userCredential.user!.uid,
          email: params.email,
          name: params.name,
        );
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseExceptionError.notFound.toCode) {
        throw RepositoryError.notFound;
      } else if (e.code == FirebaseExceptionError.emailInUse.toCode) {
        throw RepositoryError.forbidden;
      }

      throw Exception();
    } catch (error) {
      throw RepositoryError.badRequest;
    }
  }

  Future<void> logOut() async {
    try {
      await auth.signOut();
    } catch (error) {
      throw RepositoryError.badRequest;
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

class FirebaseRemoteAddAccountParams {
  final String name;
  final String email;
  final String password;

  FirebaseRemoteAddAccountParams({
    required this.name,
    required this.email,
    required this.password,
  });

  factory FirebaseRemoteAddAccountParams.fromDomain(AddAccountParams params) =>
      FirebaseRemoteAddAccountParams(
        name: params.name,
        email: params.email,
        password: params.password,
      );
}
