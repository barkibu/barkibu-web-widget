import 'package:meta/meta.dart';
import 'package:common_barkibu_dart/extensions/string_extensions.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String country;
  String phoneNumberPrefix;
  String phoneNumber;
  final String avatarUrl;
  final String twilioIdentity;

  User({
    this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    this.country,
    this.twilioIdentity,
    this.phoneNumberPrefix = '',
    this.phoneNumber = '',
    String phone,
    this.avatarUrl,
  });

  User copyWith({
    String firstName,
    String lastName,
    String email,
    String country,
  }) {
    return User(
        id: id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phoneNumber: phoneNumber,
        phoneNumberPrefix: phoneNumberPrefix,
        email: email ?? this.email,
        country: country ?? this.country);
  }

  String get fullName => firstName != 'Guest' ? '${firstName ?? ''} ${lastName ?? ''}' : '';
  String get fullPhoneNumber => '${phoneNumberPrefix ?? ''} ${phoneNumber ?? ''}';
  bool get isPhoneNumberValid => !phoneNumber.isNullEmptyOrWhitespace;
}
