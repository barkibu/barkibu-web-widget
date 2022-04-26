import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:common_barkibu_dart/datasources/datasources.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

import 'package:common_barkibu_dart/repositories/user/user_repository.dart';
import 'package:common_barkibu_dart/datasources/user/user_datasource.dart';
import 'package:common_barkibu_dart/datasources/api/user_api.dart';
import 'package:common_barkibu_dart/models/user.dart';
import '../service_locator.dart' as test_service_locator;

void main() {
  test_service_locator.ServiceLocator.setup();

  var apiResponse = {
    'id': 1,
    'email': 'user1586850131.2463164@example.com',
    'firstName': 'John',
    'lastName': 'Doe',
    'phoneNumber': '963852741',
    'jti': 'cf9531d3-231e-4339-a6fe-145dff8a6c3d',
    'createdAt': '2020-04-14T07:42:11.449Z',
    'updatedAt': '2020-04-14T07:42:11.449Z',
    'passwordResetCode': null,
    'country': 'ES',
    'passwordResetCodeExpiration': null,
    'phoneNumberPrefix': '+34',
    'twilioIdentity': 'user1586850131.2463164@example.com'
  };

  UserRepository initializeRepository(MockClientHandler handler) {
    var chopperClient = ChopperClient(
      converter: JsonConverter(),
      baseUrl: 'http://example.com/v1',
      client: MockClient(handler),
    );
    var userApi = UserApiImpl.create(chopperClient);
    var userDatasource = UserDatasourceImpl(userApi);
    return UserRepositoryImpl(userDatasource);
  }

  group('UserRepository#create', () {
    var userCreateRequest = {
      'firstName': 'John',
      'lastName': 'Doe',
      'email': 'email',
      'phoneNumber': '123123',
      'phoneNumberPrefix': '+34',
      'country': 'ES',
      'password': 'Password',
      'avatarUrl': null
    };

    var user = User(
        firstName: userCreateRequest['firstName'],
        lastName: userCreateRequest['lastName'],
        email: userCreateRequest['email'],
        phoneNumber: userCreateRequest['phoneNumber'],
        phoneNumberPrefix: userCreateRequest['phoneNumberPrefix'],
        country: userCreateRequest['country']);

    test('returns created user', () async {
      Future<http.Response> requestHandler(http.Request request) async {
        var body = json.encode({'user': apiResponse});
        expect(request.method, 'POST');
        expect(request.url.path, '/v1/user');
        expect(json.decode(request.body), {'user': userCreateRequest});
        return Future.value(http.Response(body, 200));
      }

      var userRepository = initializeRepository(requestHandler);
      var createdUser = await userRepository.create(user, 'Password');

      expect(createdUser.id, apiResponse['id']);
      expect(createdUser.email, apiResponse['email']);
      expect(createdUser.firstName, apiResponse['firstName']);
      expect(createdUser.lastName, apiResponse['lastName']);
      expect(createdUser.phoneNumber, apiResponse['phoneNumber']);
      expect(createdUser.phoneNumberPrefix, apiResponse['phoneNumberPrefix']);
      expect(createdUser.twilioIdentity, apiResponse['twilioIdentity']);
    });

    test('throw a UserSignUpException when request fails', () async {
      Future<http.Response> requestHandler(http.Request request) async {
        return Future.value(http.Response('{"errors":[]}', 500));
      }

      var userRepository = initializeRepository(requestHandler);

      expect(userRepository.create(user, 'Password'), throwsA(isA<UserSignUpException>()));
    });
  });

  group('UserRepository#update', () {
    var userUpdateRequest = {
      'firstName': 'John',
      'lastName': 'Doe',
      'email': 'email',
      'phoneNumber': '123123',
      'phoneNumberPrefix': '+34',
      'country': 'ES',
      'password': null,
      'avatarUrl': null
    };

    var user = User(
        firstName: userUpdateRequest['firstName'],
        lastName: userUpdateRequest['lastName'],
        email: userUpdateRequest['email'],
        phoneNumber: userUpdateRequest['phoneNumber'],
        phoneNumberPrefix: userUpdateRequest['phoneNumberPrefix'],
        country: userUpdateRequest['country']);

    test('returns updated user', () async {
      Future<http.Response> requestHandler(http.Request request) async {
        var body = json.encode({'user': apiResponse});
        expect(request.method, 'PUT');
        expect(request.url.path, '/v1/user');
        expect(json.decode(request.body), {'user': userUpdateRequest});
        return Future.value(http.Response(body, 200));
      }

      var userRepository = initializeRepository(requestHandler);
      var updatedUser = await userRepository.update(user);

      expect(updatedUser.id, apiResponse['id']);
      expect(updatedUser.email, apiResponse['email']);
      expect(updatedUser.firstName, apiResponse['firstName']);
      expect(updatedUser.lastName, apiResponse['lastName']);
      expect(updatedUser.phoneNumber, apiResponse['phoneNumber']);
      expect(updatedUser.phoneNumberPrefix, apiResponse['phoneNumberPrefix']);
      expect(updatedUser.twilioIdentity, apiResponse['twilioIdentity']);
    });

    test('throws a UserUpdateException when request fails', () async {
      final emailTakenError = {
        'email': ['has already been taken']
      };
      Matcher stringifyTo(String string) {
        return predicate((error) {
          return error.toString() == string;
        });
      }

      Future<http.Response> requestHandler(http.Request request) async {
        return Future.value(http.Response(json.encode(emailTakenError), 422));
      }

      var userRepository = initializeRepository(requestHandler);
      expect(userRepository.update(user),
          throwsA(allOf(isA<UserUpdateException>(), stringifyTo('email has already been taken'))));
    });
  });
}
