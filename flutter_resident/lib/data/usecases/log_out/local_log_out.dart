import './../../../domain/domain.dart';

import './../../cache/cache.dart';

class LocalLogOut implements LogOut {
  final DeleteSecureCacheStorage deleteSecureCacheStorage;

  LocalLogOut({
    required this.deleteSecureCacheStorage,
  });
  Future<void> logOut() async {
    try {
      await deleteSecureCacheStorage.delete('token');
    } catch (error) {
      throw DomainError.unexpected;
    }
  }
}
