import 'package:faker/faker.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';

class MockUserFactory {
  static MockUser makeUser({String? email}) => MockUser(
        isAnonymous: false,
        uid: faker.guid.guid(),
        email: email ?? faker.internet.email(),
        displayName: faker.person.firstName(),
        refreshToken: faker.jwt.valid(),
      );
}
