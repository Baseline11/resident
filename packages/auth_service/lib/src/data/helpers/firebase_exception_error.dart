enum FirebaseExceptionError {
  userNotFound,
  wrongPassword,
  emailInUse,
  invalidVerificationCode
}

extension FirebaseExceptionErrorExtension on FirebaseExceptionError {
  String get toCode {
    switch (this) {
      case FirebaseExceptionError.userNotFound:
        return 'user-not-found';
      case FirebaseExceptionError.wrongPassword:
        return 'wrong-password';
      case FirebaseExceptionError.emailInUse:
        return 'email-already-in-use';
      case FirebaseExceptionError.invalidVerificationCode:
        return 'invalid-verification-code';
      default:
        return '';
    }
  }
}
