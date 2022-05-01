import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/service.dart';

import './../domain/entities/entities.dart';

abstract class UserAuthenticationService extends BaseService {
  UserAuthenticationService(ProviderContainer providerContainer)
      : super(providerContainer);

  /*
    It returns:
    - UserAuthEntity if the user has been authenticated with the params
    - InvalidCredentials exeption if the credentials are invalid
    - throws Unexpected exeption if something goes wrong
  */
  Future<UserAuthEntity> emailLogin({required AuthenticationParams params});

  /*
    It returns:
    - true if the code has been sent to the phone number
    - false if the code has not been sent
    - throws Unexpected exeption if something goes wrong
  */
  Future<bool> verifyPhoneNumber({
    required String phoneNumber,
    bool forceResend,
  });

  /*
    It returns:
    - UserAuthEntity if the user has been authenticated with the provided code
    - throws InvalidVerificationCode exeption if the code is invalid
    - throws Unexpected exeption if something goes wrong
  */
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
