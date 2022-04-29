import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/service.dart';

import './../domain/entities/entities.dart';

abstract class UserAuthenticationService extends BaseService {
  UserAuthenticationService(ProviderContainer providerContainer)
      : super(providerContainer);

  Future<UserAuthEntity> emailLogin({required AuthenticationParams params});
  Future<bool> verifyPhoneNumber({
    required String phoneNumber,
    bool forceResend,
  });
  Future<UserAuthEntity> verifyCode({required String code});
}

class AuthenticationParams {
  final String email;
  final String secret;

  const AuthenticationParams({
    required this.email,
    required this.secret,
  });
}
