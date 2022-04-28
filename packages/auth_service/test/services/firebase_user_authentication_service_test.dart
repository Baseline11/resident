import 'dart:async';

import 'package:auth_service/auth_service.dart';
import 'package:auth_service/src/domain/entities/entities.dart';
import 'package:auth_service/src/services/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test/test.dart';

import './../mocks/mocks.dart';

void main() {
  group('login method', () {
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
          auth: auth, container: ProviderContainer());
    });

    test('Should return a valid UserAuthEntity if authentication proceeds',
        () async {
      // Mocking a successful return
      auth.mockSignInWithEmailAndPassword(mockUser: mockUser);

      final UserAuthEntity result = await sut.emailLogin(params: params);

      expect(result.token, mockUser.uid);
      expect(result.email, mockUser.email);
    });

    test('Should throw Exeption if authentication returns a null user',
        () async {
      // Mocking a null user return
      auth.mockSignInWithEmailAndPassword2(userCredential: userCredential);

      final future = sut.emailLogin(params: params);

      expect(future, throwsException);
    });

    test(
        'Should throw Exeption if authentication throws any FirebaseAuthException',
        () async {
      // Mocking a FirebaseAuthException
      auth.mockSignInWithEmailAndPasswordError(
        error: FirebaseAuthException(code: 'user-not-found'),
      );

      final future = sut.emailLogin(params: params);

      expect(future, throwsException);
    });
  });

  group('verifyPhoneNumber method', () {
    late FirebaseUserAuthenticationService sut;
    late MockFirebaseAuth auth;
    late MockUser mockUser;
    late String phoneNumber;

    setUp(() async {
      mockUser = MockUserFactory.makeUser();
      phoneNumber = mockUser.phoneNumber!;
      auth = MockFirebaseAuth(mockUser: mockUser);
      sut = FirebaseUserAuthenticationService(
        container: ProviderContainer(),
        auth: auth,
      );
    });

    test(
        'Should return a valid UserAuthEntity if authentication with phoneNumber proceeds',
        () async {
      final bool codeSent = await sut.verifyPhoneNumber(
        phoneNumber: phoneNumber,
      );

      expect(codeSent, true);

      final UserAuthEntity result = await sut.verifyCode(
        code: 'any_code',
      );

      expect(result.token, mockUser.uid);
      expect(result.phoneNumber, mockUser.phoneNumber);
      expect(result.email, mockUser.email);
    });
  });
}
