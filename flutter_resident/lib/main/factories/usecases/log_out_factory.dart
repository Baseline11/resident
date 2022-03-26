import 'package:flutter_resident/main/composites/composites.dart';

import './../../../data/usecases/usecases.dart';
import './../../../domain/domain.dart';

import './../factories.dart';

FirebaseLogOut makeFirebaseLogOut() {
  return FirebaseLogOut(
    authRepository: makeAuthRepository(),
  );
}

LocalLogOut makeLocalLogOut() {
  return LocalLogOut(
    deleteSecureCacheStorage: makeSecureStorageAdapter(),
  );
}

LogOut makeGlobalLogOut() {
  return GlobalLogOut(
    remote: makeFirebaseLogOut(),
    local: makeLocalLogOut(),
  );
}
