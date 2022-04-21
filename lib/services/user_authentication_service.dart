import 'package:equatable/equatable.dart';

import './../domain/entities/entities.dart';

abstract class UserAuthenticationService {
  Future<UserEntity> login({required AuthenticationParams params});
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
