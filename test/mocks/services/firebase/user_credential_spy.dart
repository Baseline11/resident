import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';

class UserCredentialSpy extends Mock implements UserCredential {
  When mockUser() => when(() => user);
  void mockUserCall({
    User? user,
  }) =>
      mockUser().thenAnswer((_) => user);
}
