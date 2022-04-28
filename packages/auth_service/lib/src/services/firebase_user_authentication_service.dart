import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './../domain/entities/entities.dart';
import './auth_state.dart';
import './user_authentication_service.dart';

class FirebaseUserAuthenticationService extends UserAuthenticationService {
  final AuthState state = AuthState();
  late FirebaseAuth? auth;

  FirebaseUserAuthenticationService(
      {this.auth, required ProviderContainer container})
      : super(container) {
    auth ??= FirebaseAuth.instance;
  }

  @override
  Future<UserAuthEntity> emailLogin({
    required AuthenticationParams params,
  }) async {
    try {
      final FirebaseAuthenticationParams firebaseParams =
          FirebaseAuthenticationParams.fromDomain(params);

      final UserCredential userCredential =
          await auth!.signInWithEmailAndPassword(
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
  Future<bool> verifyPhoneNumber({
    required String phoneNumber,
    bool forceResend = false,
  }) async {
    try {
      UserCredential? userCredential;
      final authenticationHasEnded = Completer<bool>();

      await auth!.verifyPhoneNumber(
        forceResendingToken: forceResend == true ? state.resendToken : null,
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          throw e;
        },
        codeSent: (String verificationId, int? resendToken) async {
          state.verificationId = verificationId;
          state.resendToken = resendToken;
          authenticationHasEnded.complete(true);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          throw Exception();
        },
      );

      await authenticationHasEnded.future;

      if (state.verificationId != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // TODO: map the type of exception I should throw
      rethrow;
    }
  }

  @override
  Future<UserAuthEntity> verifyCode({
    required String code,
  }) async {
    try {
      if (state.verificationId == null) {
        throw Exception();
      }

      // Create a PhoneAuthCredential with the code
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: state.verificationId!,
        smsCode: code,
      );

      // Sign the user in (or link) with the credential
      final UserCredential userCredential =
          await auth!.signInWithCredential(credential);

      if (userCredential.user != null) {
        return UserAuthEntity(
          token: userCredential.user!.uid,
          email: userCredential.user!.email,
          phoneNumber: userCredential.user!.phoneNumber,
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
