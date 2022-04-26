import 'dart:html';

import 'package:common_barkibu_dart/datasources/storage/secure_storage/secure_storage.dart';

class LocalStorage implements SecureStorage {
  @override
  Future<void> write(String key, String value) async {
    window.localStorage[key] = value;
  }

  @override
  Future<String> read(String key) async {
    return window.localStorage[key];
  }

  @override
  Future<void> delete(String key) async {
    window.localStorage.remove(key);
  }
}
