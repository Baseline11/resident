import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class AddAccount {
  Future<AccountEntity> add(AddAccountParams params);
}

class AddAccountParams extends Equatable {
  final String username;
  final String firstName;
  final String lastName;
  final String email;

  @override
  List get props => [username, firstName, lastName, email];

  AddAccountParams({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
  });
}
