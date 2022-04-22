import 'package:equatable/equatable.dart';

class UserAuthEntity extends Equatable {
  final String token;
  final String email;

  @override
  List get props => [token, email];

  const UserAuthEntity({
    required this.token,
    required this.email,
  });
}
