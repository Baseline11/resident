import 'package:faker/faker.dart';
import 'package:flutter_resident/domain/domain.dart';

class ParamsFactory {
  static AddAccountParams makeAddAccount() => AddAccountParams(
        username: faker.internet.userName(),
        firstName: faker.person.firstName(),
        lastName: faker.person.lastName(),
        email: faker.internet.email(),
      );

  static AuthenticationParams makeAuthentication() => AuthenticationParams(
        email: faker.internet.email(),
        secret: faker.internet.password(),
      );
}
