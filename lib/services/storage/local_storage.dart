import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = const FlutterSecureStorage();

  Future<bool> setValue({required String key, required String value}) async {
    await storage.write(key: key, value: value);
    return true;
  }

  Future<dynamic> readValue({required String key}) async {
    final val = await storage.read(key: key);
    return val;
  }

  Future<bool> clearValue({required String key}) async {
    await storage.delete(key: key);
    return true;
  }
}
