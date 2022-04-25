import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import './../domain/entities/entities.dart';

import './user_authentication_service.dart';

class FirebaseUserAuthenticationService implements UserAuthenticationService {
  final FirebaseAuth auth;

  FirebaseUserAuthenticationService({required this.auth});

  @override
  Future<UserAuthEntity> login({
    required AuthenticationParams params,
  }) async {
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

  @override
  Future<UserAuthEntity> verifityPhoneNumber({
    required String phoneNumber,
    required Future<String> Function() getCodeFunction,
    required Future<void> Function() codeHasBeenSentFunction,
  }) async {
    try {
      UserCredential? userCredential;
      final authenticationHasEnded = Completer<bool>();

      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          userCredential = await auth.signInWithCredential(credential);
          authenticationHasEnded.complete(true);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw e;
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Update the UI - wait for the user to enter the SMS code

          await codeHasBeenSentFunction(); // once this is called, the SMS code has ben sent
          final String smsCode =
              await getCodeFunction(); // waiting for the user to provide the SMS

          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: smsCode,
          );

          // Sign the user in (or link) with the credential
          userCredential = await auth.signInWithCredential(credential);
          authenticationHasEnded.complete(true);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          throw Exception();
        },
      );

      await authenticationHasEnded.future;

      if (userCredential?.user != null) {
        return UserAuthEntity(
          token: userCredential!.user!.uid,
          email: userCredential!.user!.email,
          phoneNumber: userCredential!.user!.phoneNumber,
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
