enum FirebaseExceptionError {
  notFound,
  wrongPassword,
  emailInUse,
}

extension FirebaseExceptionErrorExtension on FirebaseExceptionError {
  String get toCode {
    switch (this) {
      case FirebaseExceptionError.notFound:
        return 'user-not-found';
      case FirebaseExceptionError.wrongPassword:
        return 'wrong-password';
      case FirebaseExceptionError.emailInUse:
        return 'email-already-in-use';
      default:
        return '';
    }
  }
}
