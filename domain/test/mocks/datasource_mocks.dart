import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/datasources/aivet/aivet_datasource.dart';
import 'package:common_barkibu_dart/datasources/pet/breeds_datasource.dart';
import 'package:common_barkibu_dart/datasources/pet/pet_datasource.dart';
import 'package:mockito/mockito.dart';

class MockAiVetDatasource extends Mock implements AiVetDatasourceImpl {}

class MockPetDatasource extends Mock implements PetDatasourceImpl {}

class MockSecureStorage extends Mock implements SecureStorage {}

class MockCacheStorage extends Mock implements CacheStorage {}

class MockCognitoUser extends Mock implements CognitoUser {}

class MockCognitoUserPool extends Mock implements CognitoUserPool {}

class MockCognitoUserSession extends Mock implements CognitoUserSession {}

class MockCognitoAccessToken extends Mock implements CognitoAccessToken {}

class MockBreedsDatasource extends Mock implements BreedDatasource {}
