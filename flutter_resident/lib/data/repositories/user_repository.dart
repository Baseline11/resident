import './../models/models.dart';

abstract class UserRepository {
  Future<void> setUser({required FirebaseUserModel userModel});
}
