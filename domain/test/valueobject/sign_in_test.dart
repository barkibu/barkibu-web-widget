import 'package:common_barkibu_dart/datasources/valueobjects/auth/sign_in.dart';
import 'package:test/test.dart';

void main() {
  var signInResponse =
      SignInResponse(1, 'irrelevant', 'irrelevant', 'irrelevant', 'irrelevant', 'irrelevant', 'irrelevant');

  var signInJsonResponse = <String, dynamic>{
    'user': {
      'id': signInResponse.id,
      'firstName': signInResponse.firstName,
      'lastName': signInResponse.lastName,
      'email': signInResponse.email,
      'phoneNumber': signInResponse.phoneNumber,
      'phoneNumberPrefix': signInResponse.phoneNumberPrefix,
      'twilioIdentity': signInResponse.twilioIdentity
    }
  };

  group('SignInResponse', () {
    test('transform signInResponse to Json', () async {
      expect(signInResponse.toJson(), signInJsonResponse);
    });

    test('transform Json to signInResponse', () async {
      expect(SignInResponse.fromJson(signInJsonResponse).firstName, signInResponse.firstName);
    });
  });

  group('SignInResponse', () {
    var signInRequest = SignInRequest(
      'irrelevant',
      'irrelevant',
    );

    var signInJsonRequest = <String, dynamic>{
      'email': signInRequest.email,
      'password': signInRequest.password,
    };

    test('transform signInRequest to Json', () async {
      expect(signInRequest.toJson(), signInJsonRequest);
    });

    test('transform Json to signInRequest', () async {
      expect(SignInRequest.fromJson(signInJsonRequest).email, signInRequest.email);
    });
  });
}
