import './../../../data/usecases/usecases.dart';
import './../../../domain/domain.dart';
import './../factories.dart';

Authentication makeFirebaseRemoteAuthentication() {
  return FirebaseRemoteAuthentication(
    authRepository: makeAuthRepository(),
  );
}
