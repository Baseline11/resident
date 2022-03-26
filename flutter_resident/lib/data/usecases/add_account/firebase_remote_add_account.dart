import './../../../domain/entities/entities.dart';
import './../../../domain/helpers/helpers.dart';
import './../../../domain/usecases/usecases.dart';

import './../../repositories/repositories.dart';

import './../../models/models.dart';

class FirebaseRemoteAddAccount implements AddAccount {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  FirebaseRemoteAddAccount({
    required this.authRepository,
    required this.userRepository,
  });

  Future<AccountEntity> add(AddAccountParams params) async {
    try {
      FirebaseUserModel userModel = await authRepository.signUp(params: params);

      await userRepository.setUser(userModel: userModel);

      if (userModel.refreshToken == null) {
        throw DomainError.unexpected;
      }

      return userModel.toEntity()!;
    } on RepositoryError catch (error) {
      error == RepositoryError.forbidden
          ? throw DomainError.emailInUse
          : throw DomainError.unexpected;
    }
  }
}
