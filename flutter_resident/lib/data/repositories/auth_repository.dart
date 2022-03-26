import './../../domain/domain.dart';

import './../models/models.dart';

abstract class AuthRepository {
  Future<AccountEntity> login({required AuthenticationParams params});

  Future<FirebaseUserModel> signUp({required AddAccountParams params});

  Future<void> logOut();
}
