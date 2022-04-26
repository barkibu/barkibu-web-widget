import 'package:built_value/built_value.dart';

part 'twilio_member.g.dart';

abstract class TwilioUser implements Built<TwilioUser, TwilioUserBuilder> {
  String get identity;
  String get friendlyName;

  TwilioUser._();
  factory TwilioUser([void Function(TwilioUserBuilder) updates]) = _$TwilioUser;
}

abstract class TwilioMember implements Built<TwilioMember, TwilioMemberBuilder> {
  String get sid;
  String get identity;
  Future<TwilioUser> Function() get fetchUser;

  TwilioMember._();
  factory TwilioMember([void Function(TwilioMemberBuilder) updates]) = _$TwilioMember;
}
