import 'package:get/state_manager.dart';

import '../../ui/pages/pages.dart';
import '../../ui/helpers/errors/errors.dart';

import '../../domain/domain.dart';

import './../mixins/mixins.dart';
import '../protocols/protocols.dart';

class GetxSignUpPresenter extends GetxController
    with LoadingManager, NavigationManager, FormManager, UIErrorManager
    implements SignUpPresenter {
  final Validation validation;
  final SaveCurrentAccount saveCurrentAccount;
  final AddAccount addAccount;

  String? _name;
  String? _email;
  String? _password;

  var _nameError = Rx<UIError?>(null);
  var _emailError = Rx<UIError?>(null);
  var _passwordError = Rx<UIError?>(null);

  Stream<UIError?> get nameErrorStream => _nameError.stream;
  Stream<UIError?> get emailErrorStream => _emailError.stream;
  Stream<UIError?> get passwordErrorStream => _passwordError.stream;

  GetxSignUpPresenter({
    required this.validation,
    required this.saveCurrentAccount,
    required this.addAccount,
  });

  void validateName(String name) {
    _name = name;
    _nameError.value = _validateField('name');
    _validateForm();
  }

  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField('email');
    _validateForm();
  }

  void validatePassword(String password) {
    _password = password;
    _passwordError.value = _validateField('password');
    _validateForm();
  }

  UIError? _validateField(String field) {
    final formData = {
      'name': _name,
      'email': _email,
      'password': _password,
    };
    final error = validation.validate(field: field, input: formData);
    switch (error) {
      case ValidationError.invalidField:
        return UIError.invalidField;
      case ValidationError.requiredField:
        return UIError.requiredField;
      default:
        return null;
    }
  }

  void _validateForm() {
    isFormValid = _emailError.value == null &&
        _nameError.value == null &&
        _passwordError.value == null &&
        _name != null &&
        _email != null &&
        _password != null;
  }

  Future<void> signUp() async {
    try {
      mainError = null;
      isLoading = true;
      final account = await addAccount.add(
        AddAccountParams(
          name: _name!,
          email: _email!,
          password: _password!,
        ),
      );
      await saveCurrentAccount.save(account);
      navigateTo = NavigationState(route: '/home', clear: true);
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.emailInUse:
          mainError = UIError.emailInUse;
          break;
        default:
          mainError = UIError.unexpected;
          break;
      }
      isLoading = false;
    }
  }

  void goToLogin() {
    navigateTo = NavigationState(route: '/login', clear: true);
  }
}
