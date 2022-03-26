import './../../../domain/entities/entities.dart';
import './../../../domain/helpers/helpers.dart';
import './../../../domain/usecases/usecases.dart';

import './../../repositories/repositories.dart';

class FirebaseRemoteAuthentication implements Authentication {
  final AuthRepository authRepository;

  FirebaseRemoteAuthentication({
    required this.authRepository,
  });

  Future<AccountEntity> auth(AuthenticationParams params) async {
    try {
      final AccountEntity entity = await authRepository.login(params: params);

      return entity;
    } on RepositoryError catch (error) {
      error == RepositoryError.unauthorized
          ? throw DomainError.invalidCredentials
          : throw DomainError.unexpected;
    }
  }
}
