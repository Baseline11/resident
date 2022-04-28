import 'package:auth_service/auth_service.dart';
import 'package:auth_service/src/domain/entities/user_auth_entity.dart';
import 'package:riverpod/src/framework.dart';

class MockedUserAuthService extends UserAuthenticationService {
  MockedUserAuthService(ProviderContainer providerContainer)
      : super(providerContainer);

  @override
  Future<UserAuthEntity> emailLogin(
      {required AuthenticationParams params}) async {
    return UserAuthEntity(token: "token");
  }

  @override
  Future<UserAuthEntity> verifyCode({required String code}) async {
    return UserAuthEntity(token: "token");
  }

  @override
  Future<bool> verifyPhoneNumber(
      {required String phoneNumber, bool forceResend = false}) async {
    return true;
  }
}
