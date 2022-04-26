import 'package:common_barkibu_dart/datasources/storage/storage.dart';

abstract class CacheStorage extends Storage {
  Future<String> readUntilDuration(String key, Duration maxAge);
}

class DummyCacheStorage extends CacheStorage {
  @override
  Future<void> delete(String key) {
    return null;
  }

  @override
  Future<String> read(String key) {
    return null;
  }

  @override
  Future<String> readUntilDuration(String key, Duration maxAge) {
    return null;
  }

  @override
  Future<void> write(String key, String value) {
    return null;
  }
}
