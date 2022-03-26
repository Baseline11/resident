import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:flutter_resident/domain/domain.dart';
import 'package:flutter_resident/main/composites/composites.dart';

import './../../data/mocks/mocks.dart';

void main() {
  late GlobalLogOut sut;
  late FirebaseLogOutSpy remote;
  late LocalLogOutSpy local;

  setUp(() {
    remote = FirebaseLogOutSpy();
    local = LocalLogOutSpy();
    sut = GlobalLogOut(remote: remote, local: local);
  });
  test('Should call remote logOut', () async {
    await sut.logOut();

    verify(() => remote.logOut()).called(1);
  });

  test('Should call local logOut', () async {
    await sut.logOut();

    verify(() => local.logOut()).called(1);
  });

  test('Should rethrow if remote load throws', () async {
    remote.mockLogOutError();

    final future = sut.logOut();

    expect(future, throwsA(DomainError.unexpected));
  });

  test('Should rethrow if local load throws', () async {
    local.mockLogOutError();

    final future = sut.logOut();

    expect(future, throwsA(DomainError.unexpected));
  });
}
