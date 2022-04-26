import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/models/user.dart';

part 'profile_event.g.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

abstract class ProfileRequested extends ProfileEvent implements Built<ProfileRequested, ProfileRequestedBuilder> {
  ProfileRequested._();
  factory ProfileRequested([void Function(ProfileRequestedBuilder) updates]) = _$ProfileRequested;
}

abstract class UserUpdateRequested extends ProfileEvent
    implements Built<UserUpdateRequested, UserUpdateRequestedBuilder> {
  User get user;

  UserUpdateRequested._();
  factory UserUpdateRequested([void Function(UserUpdateRequestedBuilder) updates]) = _$UserUpdateRequested;
}
