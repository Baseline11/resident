import 'package:equatable/equatable.dart';

import './../domain/entities/entities.dart';

abstract class UserAuthenticationService {
  Future<UserAuthEntity> login({required AuthenticationParams params});
  Future<UserAuthEntity> verifyPhoneNumber({
    required String phoneNumber,
    // once this is called, the SMS code has ben sent
    required Future<void> Function() codeHasBeenSentFunction,
    // waiting for the user to provide the SMS
    required Future<String> Function() getCodeFunction,
  });
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
