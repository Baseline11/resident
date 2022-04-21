import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:mocktail/mocktail.dart';

import './firebase.dart';

class FirebaseAuthSpy extends Mock implements FirebaseAuth {
  // SignInWithEmailAndPassword method
  When mockSignInWithEmailAndPasswordCall() =>
      when(() => this.signInWithEmailAndPassword(
          email: any(named: 'email'), password: any(named: 'password')));
  void mockSignInWithEmailAndPassword({
    required MockUser mockUser,
  }) =>
      this.mockSignInWithEmailAndPasswordCall().thenAnswer((_) async =>
          MockFirebaseAuth(mockUser: mockUser)
              .signInWithEmailAndPassword(email: '', password: ''));
  void mockSignInWithEmailAndPasswordError({required Exception error}) =>
      this.mockSignInWithEmailAndPasswordCall().thenThrow(error);
  void mockSignInWithEmailAndPassword2({
    required UserCredentialSpy userCredential,
  }) =>
      this
          .mockSignInWithEmailAndPasswordCall()
          .thenAnswer((_) async => userCredential);

  // CreateUserWithEmailAndPassword method
  When mockCreateUserWithEmailAndPasswordCall() =>
      when(() => this.createUserWithEmailAndPassword(
          email: any(named: 'email'), password: any(named: 'password')));
  void mockCreateUserWithEmailAndPassword({
    required MockUser mockUser,
  }) =>
      this.mockCreateUserWithEmailAndPasswordCall().thenAnswer((_) async =>
          MockFirebaseAuth(mockUser: mockUser)
              .signInWithEmailAndPassword(email: '', password: ''));
  void mockCreateUserWithEmailAndPasswordError({required Exception error}) =>
      this.mockCreateUserWithEmailAndPasswordCall().thenThrow(error);
  void mockCreateUserWithEmailAndPassword2({
    required UserCredentialSpy userCredential,
  }) =>
      this
          .mockCreateUserWithEmailAndPasswordCall()
          .thenAnswer((_) async => userCredential);
}
