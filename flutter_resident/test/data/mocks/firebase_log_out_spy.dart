import 'package:mocktail/mocktail.dart';

import 'package:flutter_resident/data/usecases/usecases.dart';
import 'package:flutter_resident/domain/domain.dart';

class FirebaseLogOutSpy extends Mock implements FirebaseLogOut {
  FirebaseLogOutSpy() {
    mockLogOut();
  }

  When mockLogOutCall() => when(() => this.logOut());
  void mockLogOut() => mockLogOutCall().thenAnswer((_) async => _);
  void mockLogOutError() => mockLogOutCall().thenThrow(DomainError.unexpected);
}
