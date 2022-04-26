import 'package:common_barkibu_dart/datasources/storage/secure_storage/secure_storage.dart';
export 'package:common_barkibu_dart/datasources/storage/secure_storage/secure_storage.dart';

class InMemoryStorage implements SecureStorage {
  final Map<String, String> _storage = {};

  @override
  Future<void> write(String key, String value) async {
    _storage[key] = value;
  }

  @override
  Future<String> read(String key) async {
    return _storage[key];
  }

  @override
  Future<void> delete(String key) async {
    _storage.remove(key);
  }
}
