import 'package:auth_service/auth_service.dart';
import 'package:faker/faker.dart';

class ParamsFactory {
  static AuthenticationParams makeAuthentication() => AuthenticationParams(
        email: faker.internet.email(),
        secret: faker.internet.password(),
      );
}
