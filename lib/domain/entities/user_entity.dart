import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String token;

  @override
  List get props => [token];

  const UserEntity({required this.token});
}
