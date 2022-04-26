import 'package:common_barkibu_dart/datasources/email/email_datasource.dart';
import 'package:common_barkibu_dart/models/email.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../mocks/api_mocks.dart';
import '../mocks/response_mocks.dart';

MockEmailApi mockEmailApi;
EmailDatasourceImpl emailDatasourceImpl;

void main() {
  setUp(() {
    mockEmailApi = MockEmailApi();
    emailDatasourceImpl = EmailDatasourceImpl(mockEmailApi);
  });
  group('Email datasource (unit)', () {
    test('should send email succesfully when request', () async {
      final emailFixture = Email(
        subject: 'Dummy mail sample',
        body: 'This is a dummy mail',
      );
      when(mockEmailApi.emailQuestions(any)).thenAnswer((_) async => MockEmailResponse());

      var response = await emailDatasourceImpl.sendEmail(emailFixture);
      expect(response, true);
    });
  });
}
