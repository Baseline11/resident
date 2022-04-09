import 'package:flutter/material.dart';

import './../../../presentation/mixins/mixins.dart';

import '../../helpers/errors/errors.dart';

abstract class SignUpPresenter implements Listenable {
  Stream<UIError?> get usernameErrorStream;
  Stream<UIError?> get firstNameErrorStream;
  Stream<UIError?> get lastNameErrorStream;
  Stream<UIError?> get emailErrorStream;
  Stream<UIError?> get mainErrorStream;
  Stream<NavigationState?> get navigateToStream;
  Stream<bool> get isFormValidStream;
  Stream<bool> get isLoadingStream;

  String? get username;
  String? get firstName;
  String? get lastName;
  String? get email;

  void validateUsername(String username);
  void validateFirstName(String firstName);
  void validateLastName(String lastName);
  void validateEmail(String email);
  Future<void> signUp();
  void goToLogin();
}
