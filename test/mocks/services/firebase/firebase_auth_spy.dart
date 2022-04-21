import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:mocktail/mocktail.dart';

import './firebase.dart';

class FirebaseAuthSpy extends Mock implements FirebaseAuth {
  // SignInWithEmailAndPassword method
  When mockSignInWithEmailAndPasswordCall() =>
      when(() => signInWithEmailAndPassword(
          email: any(named: 'email'), password: any(named: 'password')));
  void mockSignInWithEmailAndPassword({
    required MockUser mockUser,
  }) =>
      mockSignInWithEmailAndPasswordCall().thenAnswer((_) async =>
          MockFirebaseAuth(mockUser: mockUser)
              .signInWithEmailAndPassword(email: '', password: ''));
  void mockSignInWithEmailAndPasswordError({required Exception error}) =>
      mockSignInWithEmailAndPasswordCall().thenThrow(error);
  void mockSignInWithEmailAndPassword2({
    required UserCredentialSpy userCredential,
  }) =>
      mockSignInWithEmailAndPasswordCall()
          .thenAnswer((_) async => userCredential);

  // CreateUserWithEmailAndPassword method
  When mockCreateUserWithEmailAndPasswordCall() =>
      when(() => createUserWithEmailAndPassword(
          email: any(named: 'email'), password: any(named: 'password')));
  void mockCreateUserWithEmailAndPassword({
    required MockUser mockUser,
  }) =>
      mockCreateUserWithEmailAndPasswordCall().thenAnswer((_) async =>
          MockFirebaseAuth(mockUser: mockUser)
              .signInWithEmailAndPassword(email: '', password: ''));
  void mockCreateUserWithEmailAndPasswordError({required Exception error}) =>
      mockCreateUserWithEmailAndPasswordCall().thenThrow(error);
  void mockCreateUserWithEmailAndPassword2({
    required UserCredentialSpy userCredential,
  }) =>
      mockCreateUserWithEmailAndPasswordCall()
          .thenAnswer((_) async => userCredential);
}
