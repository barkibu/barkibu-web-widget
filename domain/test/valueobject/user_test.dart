import 'package:common_barkibu_dart/datasources/valueobjects/user/user.dart';
import 'package:test/test.dart';

void main() {
  var userResponse = UserResponse(1, 'irrelevant', 'irrelevant', 'irrelevant', 'irrelevant', 'irrelevant', 'irrelevant',
      'irrelevant', 'irrelevant');

  var userJsonResponse = <String, dynamic>{
    'user': {
      'id': userResponse.id,
      'firstName': userResponse.firstName,
      'lastName': userResponse.lastName,
      'email': userResponse.email,
      'phoneNumber': userResponse.phoneNumber,
      'country': userResponse.country,
      'phoneNumberPrefix': userResponse.phoneNumberPrefix,
      'avatarUrl': userResponse.avatarUrl,
      'twilioIdentity': userResponse.twilioIdentity
    }
  };

  group('UserResponse', () {
    test('transform userResponse to Json', () async {
      expect(userResponse.toJson(), userJsonResponse);
    });

    test('transfor Json to userResponse', () async {
      expect(UserResponse.fromJson(userJsonResponse).firstName, userResponse.firstName);
    });
  });

  group('UserRequest', () {
    final userRequest = UserRequest(
      firstName: 'irrelevant',
      lastName: 'irrelevant',
      email: 'irrelevant',
      phoneNumber: 'irrelevant',
      country: 'irrelevant',
      phoneNumberPrefix: 'irrelevant',
      password: 'irrelevant',
      avatarUrl: 'irrelevant',
    );

    var userJsonRequest = <String, dynamic>{
      'user': {
        'firstName': userRequest.firstName,
        'lastName': userRequest.lastName,
        'email': userRequest.email,
        'phoneNumber': userRequest.phoneNumber,
        'country': userRequest.country,
        'phoneNumberPrefix': userRequest.phoneNumber,
        'password': userRequest.password,
        'avatarUrl': userRequest.avatarUrl,
      }
    };

    test('transform userRequest to Json', () async {
      expect(userRequest.toJson(), userJsonRequest);
    });

    test('transfor Json to userRequest', () async {
      expect(UserRequest.fromJson(userJsonRequest).firstName, userRequest.firstName);
    });
  });
}
