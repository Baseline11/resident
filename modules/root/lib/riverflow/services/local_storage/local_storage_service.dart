import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:root/riverflow/services/local_storage/hive_local_storage_service.dart';

final localStorageServiceProvider =
    Provider<LocalStorageService>((ref) => HiveLocalStorageService());

abstract class LocalStorageService {
  void write({required String key, required dynamic value});

  dynamic read({required String key});

  void delete({required String key});

  Future<void> init();
}
