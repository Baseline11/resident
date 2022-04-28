import 'package:equatable/equatable.dart';
import 'package:riverflow/utils/service.dart';
import 'package:riverpod/src/framework.dart';

import './../domain/entities/entities.dart';

abstract class UserAuthenticationService extends BaseService {
  UserAuthenticationService(ProviderContainer providerContainer)
      : super(providerContainer);

  Future<UserAuthEntity> emailLogin({required AuthenticationParams params});
  Future<UserAuthEntity> verifyPhoneNumber({
    required String phoneNumber,
    bool forceResend,
  });
  Future<UserAuthEntity> verifyCode({required String code});
}

class AuthenticationParams extends Equatable {
  final String email;
  final String secret;

  @override
  List get props => [email, secret];

  const AuthenticationParams({
    required this.email,
    required this.secret,
  });
}
