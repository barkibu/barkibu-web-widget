export 'secure_storage/secure_storage.dart';
export 'secure_storage/cognito_secure_storage.dart';
export 'cache_storage/cache_storage.dart';

abstract class Storage {
  Future<void> write(String key, String value);

  Future<String> read(String key);

  Future<void> delete(String key);
}
