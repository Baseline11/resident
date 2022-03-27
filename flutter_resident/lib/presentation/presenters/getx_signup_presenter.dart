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

  String? _username;
  String? _firstName;
  String? _lastName;
  String? _email;

  var _usernameError = Rx<UIError?>(null);
  var _firstNameError = Rx<UIError?>(null);
  var _lastNameError = Rx<UIError?>(null);
  var _emailError = Rx<UIError?>(null);

  Stream<UIError?> get usernameErrorStream => _usernameError.stream;
  Stream<UIError?> get firstNameErrorStream => _firstNameError.stream;
  Stream<UIError?> get lastNameErrorStream => _lastNameError.stream;
  Stream<UIError?> get emailErrorStream => _emailError.stream;

  GetxSignUpPresenter({
    required this.validation,
    required this.saveCurrentAccount,
    required this.addAccount,
  });

  void validateUsername(String username) {
    _username = username;
    _usernameError.value = _validateField('username');
    _validateForm();
  }

  void validateFirstName(String firstName) {
    _firstName = firstName;
    _firstNameError.value = _validateField('first_name');
    _validateForm();
  }

  void validateLastName(String lastName) {
    _lastName = lastName;
    _lastNameError.value = _validateField('last_name');
    _validateForm();
  }

  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField('email');
    _validateForm();
  }

  UIError? _validateField(String field) {
    final formData = {
      'username': _username,
      'first_name': _firstName,
      'last_name': _lastName,
      'email': _email,
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
    isFormValid = _usernameError.value == null &&
        _firstNameError.value == null &&
        _lastNameError.value == null &&
        _emailError.value == null &&
        _username != null &&
        _firstName != null &&
        _lastName != null &&
        _email != null;
  }

  Future<void> signUp() async {
    try {
      mainError = null;
      isLoading = true;
      final account = await addAccount.add(
        AddAccountParams(
          username: _username!,
          firstName: _firstName!,
          lastName: _lastName!,
          email: _email!,
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
