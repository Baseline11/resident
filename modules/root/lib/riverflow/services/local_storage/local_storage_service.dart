import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverflow/utils/service.dart';
import 'package:root/riverflow/services/local_storage/hive_local_storage_service.dart';

final localStorageServiceProvider = Provider<LocalStorageService>(
    (ref) => HiveLocalStorageService(ref.container));

abstract class LocalStorageService extends BaseService {
  LocalStorageService(ProviderContainer providerContainer)
      : super(providerContainer);

  void write({required String key, required dynamic value});

  dynamic read({required String key});

  void delete({required String key});

  Future<void> init();
}
