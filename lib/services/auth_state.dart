enum AuthStateNameEnum {
  blank,
  completed,
  failed,
  codeSent,
  codeResent,
}

class AuthState {
  AuthStateNameEnum name = AuthStateNameEnum.blank;
  int? resendToken;
  String? verificationId;
}
