import '../../../data/usecases/usecases.dart';
import '../../../domain/domain.dart';
import '../factories.dart';

AddAccount makeFirebaseRemoteAddAccount() {
  return FirebaseRemoteAddAccount(
    authRepository: makeAuthRepository(),
    userRepository: makeUserRepository(),
  );
}
