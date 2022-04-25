import 'package:hive_flutter/hive_flutter.dart';
import 'package:root/riverflow/services/local_storage/local_storage_service.dart';

class HiveLocalStorageService implements LocalStorageService {
  final boxName = "resident_box";
  late Box? box;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox(boxName);
  }

  @override
  read({required String key}) {
    return box?.get(key);
  }

  @override
  void write({required String key, required value}) async {
    await box?.put(key, value);
  }

  @override
  void delete({required String key}) async {
    await box?.delete(key);
  }
}
