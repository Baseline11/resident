import '../../../data/usecases/usecases.dart';
import '../../../domain/domain.dart';

import '../factories.dart';

SaveCurrentAccount makeLocalSaveCurrentAccount() {
  return LocalSaveCurrentAccount(
      saveSecureCacheStorage: makeSecureStorageAdapter());
}
