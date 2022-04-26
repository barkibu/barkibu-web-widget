import 'package:common_barkibu_dart/models/user.dart';

class ProfileFormModel {
  String firstName;
  String lastName;
  String email;
  String phoneNumberPrefix;
  String phoneNumber;

  ProfileFormModel(User user) {
    firstName = user.firstName;
    lastName = user.lastName;
    email = user.email;
    phoneNumberPrefix = user.phoneNumberPrefix;
    phoneNumber = user.phoneNumber;
  }

  User get user => (User(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      phoneNumberPrefix: phoneNumberPrefix));
}
