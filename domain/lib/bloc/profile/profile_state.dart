import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/models/profile.dart';

part 'profile_state.g.dart';

abstract class ProfileState {
  const ProfileState();
}

abstract class ProfileUninitialized extends ProfileState
    implements Built<ProfileUninitialized, ProfileUninitializedBuilder> {
  ProfileUninitialized._();
  factory ProfileUninitialized([void Function(ProfileUninitializedBuilder) updates]) = _$ProfileUninitialized;
}

abstract class ProfileLoading extends ProfileState implements Built<ProfileLoading, ProfileLoadingBuilder> {
  ProfileLoading._();
  factory ProfileLoading([void Function(ProfileLoadingBuilder) updates]) = _$ProfileLoading;
}

abstract class ProfileLoaded extends ProfileState implements Built<ProfileLoaded, ProfileLoadedBuilder> {
  ProfileLoaded._();

  Profile get profile;

  factory ProfileLoaded([void Function(ProfileLoadedBuilder) updates]) = _$ProfileLoaded;
}

abstract class ProfileUpdated extends ProfileState implements Built<ProfileUpdated, ProfileUpdatedBuilder> {
  ProfileUpdated._();

  factory ProfileUpdated([void Function(ProfileUpdatedBuilder) updates]) = _$ProfileUpdated;
}

abstract class UserUpdating extends ProfileState implements Built<UserUpdating, UserUpdatingBuilder> {
  UserUpdating._();

  factory UserUpdating([void Function(UserUpdatingBuilder) updates]) = _$UserUpdating;
}

abstract class ProfileLoadingFailed extends ProfileState
    implements Built<ProfileLoadingFailed, ProfileLoadingFailedBuilder> {
  ProfileLoadingFailed._();

  @nullable
  String get error;

  factory ProfileLoadingFailed([void Function(ProfileLoadingFailedBuilder) updates]) = _$ProfileLoadingFailed;
}

abstract class UserUpdateFailed extends ProfileState implements Built<UserUpdateFailed, UserUpdateFailedBuilder> {
  UserUpdateFailed._();

  @nullable
  String get error;

  factory UserUpdateFailed([void Function(UserUpdateFailedBuilder) updates]) = _$UserUpdateFailed;
}
