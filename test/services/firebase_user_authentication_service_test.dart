import 'package:test/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

import 'package:resident_flutter/services/services.dart';
import 'package:resident_flutter/domain/entities/entities.dart';

import './../mocks/mocks.dart';

void main() {
  late FirebaseUserAuthenticationService sut;
  late FirebaseAuthSpy auth;
  late MockUser mockUser;
  late UserCredentialSpy userCredential;

  setUp(() async {
    mockUser = MockUserFactory.makeUser();
    userCredential = UserCredentialSpy();
    auth = FirebaseAuthSpy();
    sut = FirebaseUserAuthenticationService(
      auth: auth,
    );
    auth.mockSignInWithEmailAndPassword(mockUser: mockUser);
    userCredential.mockUserCall(user: null);
  });

  test('Should return a valid UserEntity if authentication proceeds', () async {
    final UserEntity result =
        await sut.login(params: ParamsFactory.makeAuthentication());

    expect(result.token, mockUser.uid);
  });

  test('Should throw Exeption if authentication returns a null user', () async {
    auth.mockSignInWithEmailAndPassword2(userCredential: userCredential);
    final future = sut.login(params: ParamsFactory.makeAuthentication());

    expect(future, throwsException);
  });

  test(
      'Should throw Exeption if authentication throws any FirebaseAuthException',
      () async {
    auth.mockSignInWithEmailAndPasswordError(
      error: FirebaseAuthException(code: 'user-not-found'),
    );
    final future = sut.login(params: ParamsFactory.makeAuthentication());

    expect(future, throwsException);
  });
}
