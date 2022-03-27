import './strings.dart';

class EnCa implements Translations {
  SignUpTranslation signUp = EnCaSignUp();

  String get msgEmailInUse => 'The email is in use';
  String get msgInvalidCredentials => 'Invalid Credentials';
  String get msgInvalidField => 'Invalid Field';
  String get msgRequiredField => 'Required Field';
  String get msgUnexpected => 'Something went wrong. Try again later.';

  String get addAccount => 'Add Account';
  String get alreadyHaveAnAccount => 'Already have an account?';
  String get confirmPassword => 'Confirm password';
  String get dontHaveAnAccount => 'Don\'t have an account?';
  String get email => 'Email';
  String get firstName => 'First name';
  String get joinUs => 'Join Us!';
  String get enter => 'Enter';
  String get lastName => 'Last name';
  String get login => 'Login';
  String get password => 'Password';
  String get pleaseWait => 'Please wait...';
  String get username => 'Username';
  String get reload => 'Reload';
  String get welcomeBack => 'Welcome Back';
}
