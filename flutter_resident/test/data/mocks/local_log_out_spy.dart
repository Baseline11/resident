import 'package:mocktail/mocktail.dart';

import 'package:flutter_resident/data/usecases/usecases.dart';
import 'package:flutter_resident/domain/domain.dart';

class LocalLogOutSpy extends Mock implements LocalLogOut {
  LocalLogOutSpy() {
    mockLogOut();
  }

  When mockLogOutCall() => when(() => this.logOut());
  void mockLogOut() => mockLogOutCall().thenAnswer((_) async => _);
  void mockLogOutError() => mockLogOutCall().thenThrow(DomainError.unexpected);
}
