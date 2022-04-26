import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/viewmodels/auth/auth_data.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import '../../service_locator.dart' as test_service_locator;

void main() {
  test_service_locator.ServiceLocator.setup();
  final configuration = ServiceLocator.container<Configuration>();

  group('passwordIsInvalid', () {
    test('empty password is invalid', () {
      expect(AuthData().passwordIsInvalid(), isTrue);
    });

    test('non-empty password is valid', () {
      expect(AuthData(password: 'a').passwordIsInvalid(), isFalse);
    });
  });

  group('isSignupValid', () {
    group('when fields are set as optional in config', () {
      setUp(() {
        when(configuration.firstNameRequired).thenReturn(false);
        when(configuration.lastNameRequired).thenReturn(false);
      });

      tearDown(() {
        when(configuration.firstNameRequired).thenReturn(true);
        when(configuration.lastNameRequired).thenReturn(false);
      });
      test('minimal valid sign up', () {
        final authData = AuthData(password: 'a', email: 'email@example.com', checkboxValue: true);
        expect(authData.isSignupValid(), isTrue);
      });
    });

    group('when fields are set as required in config', () {
      setUp(() {
        when(configuration.firstNameRequired).thenReturn(true);
        when(configuration.lastNameRequired).thenReturn(true);
      });

      tearDown(() {
        when(configuration.firstNameRequired).thenReturn(true);
        when(configuration.lastNameRequired).thenReturn(false);
      });

      test('minimal valid sign up', () {
        final authData =
            AuthData(firstName: 'bro', lastName: 'bro', password: 'a', email: 'email@example.com', checkboxValue: true);
        expect(authData.isSignupValid(), isTrue);
      });

      test('not minimal valid sign up', () {
        final authData = AuthData(password: 'a', email: 'email@example.com', checkboxValue: true);
        expect(authData.isSignupValid(), isFalse);
      });
    });
  });
}
