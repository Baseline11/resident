import 'package:faker/faker.dart';

import './../../../domain/entities/entities.dart';

class UserAuthEntityFactory {
  static UserAuthEntity makeUser() => UserAuthEntity(
        token: faker.guid.guid(),
        email: faker.internet.email(),
        phoneNumber: faker.phoneNumber.toString(),
      );
}
