import 'package:mocktail/mocktail.dart';

import 'package:flutter_resident/domain/domain.dart';

class LogOutSpy extends Mock implements LogOut {
  LogOutSpy() {
    mockLogOut();
  }
  When mockLogOutCall() => when(() => this.logOut());
  void mockLogOut() => mockLogOutCall().thenAnswer((_) async => _);
  void mockLogOutError(DomainError error) => mockLogOutCall().thenThrow(error);
}
