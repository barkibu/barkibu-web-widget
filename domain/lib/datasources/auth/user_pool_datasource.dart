import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:common_barkibu_dart/datasources/datasources.dart';

class UserPoolDatasource {
  final CognitoStorage storage;
  CognitoUserPool userPool;

  UserPoolDatasource({SecureStorage secureStorage, String userPoolId, String appClientId})
      : storage = CognitoSecureStorage(secureStorage) {
    userPool = CognitoUserPool(
      userPoolId,
      appClientId,
      storage: storage,
    );
  }
}
