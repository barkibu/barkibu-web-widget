import 'package:common_barkibu_dart/datasources/storage/secure_storage/secure_storage.dart';
import 'package:web_widget/src/browser_storage/in_memory_storage.dart';
import 'package:web_widget/src/browser_storage/local_storage.dart';

class BrowserStorage {
  static Future<SecureStorage> storageFactory() async {
    try {
      var storageInstance = LocalStorage();
      await storageInstance.write('dummyKey', 'dummyValue');
      await storageInstance.delete('dummyKey');
      return storageInstance;
    } catch (error) {
      return InMemoryStorage();
    }
  }
}
