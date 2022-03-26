import 'package:mocktail/mocktail.dart';

import 'package:flutter_resident/domain/domain.dart';

class AuthenticationSpy extends Mock implements Authentication {
  When mockAuthenticationCall() => when(() => this.auth(any()));
  void mockAuthentication(AccountEntity data) =>
      this.mockAuthenticationCall().thenAnswer((_) async => data);
  void mockAuthenticationError(DomainError error) =>
      this.mockAuthenticationCall().thenThrow(error);
}
