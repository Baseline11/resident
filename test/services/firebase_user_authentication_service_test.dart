import 'package:test/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

import 'package:resident_flutter/services/services.dart';
import 'package:resident_flutter/domain/entities/entities.dart';

import './../mocks/mocks.dart';

void main() {
  late FirebaseUserAuthenticationService sut;
  late FirebaseAuthSpy auth;
  late AuthenticationParams params;
  late MockUser mockUser;
  late UserCredentialSpy userCredential;

  setUp(() async {
    params = ParamsFactory.makeAuthentication();
    mockUser = MockUserFactory.makeUser(email: params.email);
    userCredential = UserCredentialSpy();
    auth = FirebaseAuthSpy();
    sut = FirebaseUserAuthenticationService(
      auth: auth,
    );
  });

  test('Should return a valid UserAuthEntity if authentication proceeds',
      () async {
    // Mocking a successful return
    auth.mockSignInWithEmailAndPassword(mockUser: mockUser);

    final UserAuthEntity result = await sut.login(params: params);

    expect(result.token, mockUser.uid);
    expect(result.email, mockUser.email);
  });

  test('Should throw Exeption if authentication returns a null user', () async {
    // Mocking a null user return
    auth.mockSignInWithEmailAndPassword2(userCredential: userCredential);

    final future = sut.login(params: params);

    expect(future, throwsException);
  });

  test(
      'Should throw Exeption if authentication throws any FirebaseAuthException',
      () async {
    // Mocking a FirebaseAuthException
    auth.mockSignInWithEmailAndPasswordError(
      error: FirebaseAuthException(code: 'user-not-found'),
    );

    final future = sut.login(params: params);

    expect(future, throwsException);
  });
}
