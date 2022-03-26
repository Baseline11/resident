import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:flutter_resident/domain/domain.dart';

import 'package:flutter_resident/data/usecases/usecases.dart';
import './../../mocks/mocks.dart';

void main() {
  late LocalLogOut sut;
  late SecureCacheStorageSpy secureCacheStorage;

  setUp(() {
    secureCacheStorage = SecureCacheStorageSpy();
    sut = LocalLogOut(deleteSecureCacheStorage: secureCacheStorage);
  });

  test('Should call DeteleSecureCacheStorage with correct values', () async {
    await sut.logOut();

    verify(
      () => secureCacheStorage.delete('token'),
    );
  });

  test('Should throw UnexpectedError if DeleteSecureCacheStorage throws',
      () async {
    secureCacheStorage.mockDeleteError();

    final future = sut.logOut;

    expect(future, throwsA(DomainError.unexpected));
  });
}
