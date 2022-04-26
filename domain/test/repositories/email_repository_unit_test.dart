import 'package:common_barkibu_dart/datasources/email/email_datasource.dart';
import 'package:common_barkibu_dart/models/email.dart';
import 'package:common_barkibu_dart/repositories/email/email_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockEmailDatasource extends Mock implements EmailDatasource {}

EmailRepositoryImpl emailRepositoryImpl;
MockEmailDatasource mockEmailDatasource;

void main() {
  setUp(() {
    mockEmailDatasource = MockEmailDatasource();
    emailRepositoryImpl = EmailRepositoryImpl(mockEmailDatasource);
  });
  group('Email repository', () {
    test('should recieve ok response when calling datasource', () async {
      when(mockEmailDatasource.sendEmail(any)).thenAnswer((_) async => true);
      final emailFixture = Email(
        subject: 'Dummy mail sample',
        body: 'This is a dummy mail',
      );
      var response = await emailRepositoryImpl.emailQuestion(emailFixture);
      expect(response, true);
    });
  });
}
