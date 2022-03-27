import './signup/signup.dart';

abstract class Translations {
  SignUpTranslation signUp = EnCaSignUp();

  String get msgEmailInUse;
  String get msgInvalidCredentials;
  String get msgInvalidField;
  String get msgRequiredField;
  String get msgUnexpected;

  String get addAccount;
  String get alreadyHaveAnAccount;
  String get confirmPassword;
  String get dontHaveAnAccount;
  String get email;
  String get enter;
  String get joinUs;
  String get login;
  String get firstName;
  String get lastName;
  String get password;
  String get pleaseWait;
  String get username;
  String get reload;
  String get welcomeBack;
}
