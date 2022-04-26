import 'package:common_barkibu_dart/datasources/storage/storage.dart';

abstract class SecureStorage extends Storage {}

class SecureStorageKeys {
  static const String accessToken = 'access_token';
}
