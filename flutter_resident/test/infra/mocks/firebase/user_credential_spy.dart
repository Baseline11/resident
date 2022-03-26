import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';

class UserCredentialSpy extends Mock implements UserCredential {
  When mockUser() => when(() => this.user);
  void mockUserCall({
    required User? user,
  }) =>
      this.mockUser().thenAnswer((_) => user);
}
