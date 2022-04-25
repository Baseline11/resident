import 'package:equatable/equatable.dart';

import './../domain/entities/entities.dart';

abstract class UserAuthenticationService {
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
