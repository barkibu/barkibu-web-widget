import 'package:common_barkibu_dart/models/user.dart';
import 'package:test/test.dart';

void main() {
  group('User model', () {
    group('fullName', () {
      test('for user with firstName', () {
        var userModel = User(firstName: 'Bob', lastName: 'Tables', email: 'email');
        expect(userModel.fullName, 'Bob Tables');
      });

      test('for user with firstName as Guest', () {
        var userModel = User(firstName: 'Guest', lastName: 'Anything', email: 'email');
        expect(userModel.fullName, isEmpty);
      });
    });

    group('fullPhoneNumber', () {
      test('concatenates number and prefix', () {
        // ignore: missing_required_param
        var userModel = User(phoneNumber: '123123', phoneNumberPrefix: '+12');
        expect(userModel.fullPhoneNumber, '+12 123123');
      });
    });
  });
}
