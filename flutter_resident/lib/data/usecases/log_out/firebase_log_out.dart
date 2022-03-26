import './../../../domain/helpers/helpers.dart';
import './../../../domain/usecases/usecases.dart';

import './../../repositories/repositories.dart';

class FirebaseLogOut implements LogOut {
  final AuthRepository authRepository;

  FirebaseLogOut({
    required this.authRepository,
  });

  Future<void> logOut() async {
    try {
      await authRepository.logOut();
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
