import '../../../data/usecases/usecases.dart';
import '../../../domain/domain.dart';

import '../factories.dart';

LoadCurrentAccount makeLocalLoadCurrentAccount() {
  return LocalLoadCurrentAccount(
    fetchSecureCacheStorage: makeSecureStorageAdapter(),
  );
}
