import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:common_barkibu_dart/datasources/storage/storage.dart';

class CognitoSecureStorage implements CognitoStorage {
  final SecureStorage _secureStorage;

  CognitoSecureStorage(this._secureStorage);

  @override
  Future<void> clear() async {
    // On purpose not implemented because the SecureStorage is shared with other system
    // Anywaythe method clear is never called on CognitoStorage
    return;
  }

  @override
  Future getItem(String key) {
    return _secureStorage.read(key);
  }

  @override
  Future removeItem(String key) {
    return _secureStorage.delete(key);
  }

  @override
  Future setItem(String key, value) {
    return _secureStorage.write(key, value);
  }
}
