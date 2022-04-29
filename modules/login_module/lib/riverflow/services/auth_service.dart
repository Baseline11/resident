import 'package:auth_service/auth_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var authServiceProvider = Provider(
  (ref) => getMockedService(
    ref,
    testCase: UserAuthServiceCasesEnum.successCase,
  ),
);

enum UserAuthServiceCasesEnum {
  successCase,
  failureCase1,
  failureCase2,
  failureCase3,
}

MockedUserAuthService getMockedService(
  ProviderRef<MockedUserAuthService> ref, {
  required UserAuthServiceCasesEnum testCase,
}) {
  switch (testCase) {
    case UserAuthServiceCasesEnum.successCase:
      return MockedUserAuthService(
        ref.container,
        verifyCodeFunction: () async => UserAuthEntityFactory.makeUser(),
        verifyPhoneNumberFunction: () async => true,
      );
    case UserAuthServiceCasesEnum.failureCase1:
      return MockedUserAuthService(
        ref.container,
        verifyPhoneNumberFunction: () async => false,
      );
    case UserAuthServiceCasesEnum.failureCase2:
      return MockedUserAuthService(
        ref.container,
        verifyPhoneNumberFunction: () async => throw Exception(),
      );
    case UserAuthServiceCasesEnum.failureCase3:
      return MockedUserAuthService(
        ref.container,
        verifyCodeFunction: () async => throw Exception(),
        verifyPhoneNumberFunction: () async => true,
      );
    default:
      return MockedUserAuthService(ref.container);
  }
}
