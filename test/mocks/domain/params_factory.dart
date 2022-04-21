import 'package:faker/faker.dart';

import 'package:resident_flutter/services/user_authentication_service.dart';

class ParamsFactory {
  static AuthenticationParams makeAuthentication() => AuthenticationParams(
        email: faker.internet.email(),
        secret: faker.internet.password(),
      );
}
