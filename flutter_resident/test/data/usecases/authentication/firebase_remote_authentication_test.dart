import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:flutter_resident/domain/domain.dart';

import 'package:flutter_resident/data/repositories/repositories.dart';
import 'package:flutter_resident/data/usecases/usecases.dart';

import './../../../domain/mocks/mocks.dart';
import './../../mocks/mocks.dart';

void main() {
  late FirebaseRemoteAuthentication sut;
  late AuthRepositorySpy userRepository;
  late AuthenticationParams params;
  late AccountEntity accountEntity;

  setUp(() {
    userRepository = AuthRepositorySpy();
    params = ParamsFactory.makeAuthentication();
    accountEntity = EntityFactory.makeAccount();
    userRepository.mockLogin(accountEntity);
    sut = FirebaseRemoteAuthentication(authRepository: userRepository);
  });

  setUpAll(() {
    registerFallbackValue(ParamsFactory.makeAuthentication());
  });

  test('Should call AuthRepository with corret values', () async {
    await sut.auth(params);

    verify(
      () => userRepository.login(
        params: params,
      ),
    );
  });

  test('Should throw UnexpectedError if AuthRepository throws badRequest',
      () async {
    userRepository.mockLoginError(RepositoryError.badRequest);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if AuthRepository throws notFound',
      () async {
    userRepository.mockLoginError(RepositoryError.notFound);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should throw ServerError if AuthRepository throws serverError',
      () async {
    userRepository.mockLoginError(RepositoryError.serverError);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test(
      'Should throw InvalidCredentialsError if AuthRepository throws unauthorized',
      () async {
    userRepository.mockLoginError(RepositoryError.unauthorized);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.invalidCredentials));
  });

  test('Should return an Account if AuthRepository returns data', () async {
    final account = await sut.auth(params);

    expect(account.token, accountEntity.token);
  });
}
