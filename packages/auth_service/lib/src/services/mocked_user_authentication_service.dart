import 'package:auth_service/auth_service.dart';
import 'package:auth_service/src/domain/entities/user_auth_entity.dart';
import 'package:riverpod/src/framework.dart';

class MockedUserAuthService extends UserAuthenticationService {
  final Future<UserAuthEntity> Function()? emailLoginFunction;
  final Future<UserAuthEntity> Function()? verifyCodeFunction;
  final Future<bool> Function()? verifyPhoneNumberFunction;

  MockedUserAuthService(
    ProviderContainer providerContainer, {
    this.emailLoginFunction,
    this.verifyCodeFunction,
    this.verifyPhoneNumberFunction,
  }) : super(providerContainer);

  @override
  Future<UserAuthEntity> emailLogin(
      {required AuthenticationParams params}) async {
    return emailLoginFunction != null
        ? await emailLoginFunction!()
        : const UserAuthEntity(token: "token");
  }

  @override
  Future<UserAuthEntity> verifyCode({required String code}) async {
    return verifyCodeFunction != null
        ? await verifyCodeFunction!()
        : const UserAuthEntity(token: "token");
  }

  @override
  Future<bool> verifyPhoneNumber(
      {required String phoneNumber, bool forceResend = false}) async {
    return verifyPhoneNumberFunction != null
        ? await verifyPhoneNumberFunction!()
        : true;
  }
}