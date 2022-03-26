import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:flutter_resident/domain/domain.dart';

import 'package:flutter_resident/data/usecases/usecases.dart';
import './../../mocks/mocks.dart';

void main() {
  late FirebaseLogOut sut;
  late AuthRepositorySpy authRepository;

  setUp(() {
    authRepository = AuthRepositorySpy();
    sut = FirebaseLogOut(authRepository: authRepository);
  });

  test('Should call logOut function from AuthRepository with correct values',
      () async {
    await sut.logOut();

    verify(
      () => authRepository.logOut(),
    );
  });

  test('Should throw UnexpectedError if DeleteSecureCacheStorage throws',
      () async {
    authRepository.mockLogOutError(Exception());

    final future = sut.logOut;

    expect(future, throwsA(DomainError.unexpected));
  });
}
