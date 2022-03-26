import 'package:test/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

import 'package:flutter_resident/data/models/models.dart';
import 'package:flutter_resident/data/repositories/repositories.dart';
import 'package:flutter_resident/infra/repositories/repositories.dart';

import '../../../../domain/mocks/mocks.dart';
import '../../../mocks/firebase/firebase.dart';

void main() {
  // SignUp test
  late FirebaseAuthRepository sut;
  late FirebaseAuthSpy auth;
  late MockUser mockUser;
  late UserCredentialSpy userCredential;

  setUp(() async {
    mockUser = MockUserFactory.makeUser();
    userCredential = UserCredentialSpy();
    auth = FirebaseAuthSpy();
    sut = FirebaseAuthRepository(
      auth: auth,
    );
    auth.mockCreateUserWithEmailAndPassword(mockUser: mockUser);
    userCredential.mockUserCall(user: null);
  });

  test('Should return a valid AccountEntity if sign up proceeds', () async {
    final FirebaseUserModel result =
        await sut.signUp(params: ParamsFactory.makeAddAccount());

    expect(result.refreshToken, mockUser.refreshToken);
    expect(result.uid, isNotNull);
  });

  test('Should throw badRequest if sign up returns a null user', () async {
    auth.mockCreateUserWithEmailAndPassword2(userCredential: userCredential);
    final future = sut.signUp(params: ParamsFactory.makeAddAccount());

    expect(future, throwsA(RepositoryError.badRequest));
  });

  test(
      'Should throw RepositoryError notFound if sign up throws FirebaseAuthException notFound',
      () async {
    auth.mockCreateUserWithEmailAndPasswordError(
        error: FirebaseAuthException(
            code: FirebaseExceptionError.notFound.toCode));
    final future = sut.signUp(params: ParamsFactory.makeAddAccount());

    expect(future, throwsA(RepositoryError.notFound));
  });

  test(
      'Should throw RepositoryError forbidden if sign up throws FirebaseAuthException emailInUse',
      () async {
    auth.mockCreateUserWithEmailAndPasswordError(
        error: FirebaseAuthException(
            code: FirebaseExceptionError.emailInUse.toCode));
    final future = sut.signUp(params: ParamsFactory.makeAddAccount());

    expect(future, throwsA(RepositoryError.forbidden));
  });

  test(
      'Should throw RepositoryError badRequest if sign up throws any exception',
      () async {
    auth.mockCreateUserWithEmailAndPasswordError(
        error: Exception('any_exception'));
    final future = sut.signUp(params: ParamsFactory.makeAddAccount());

    expect(future, throwsA(RepositoryError.badRequest));
  });
}
