// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProfileRequested extends ProfileRequested {
  factory _$ProfileRequested(
          [void Function(ProfileRequestedBuilder) updates]) =>
      (new ProfileRequestedBuilder()..update(updates)).build();

  _$ProfileRequested._() : super._();

  @override
  ProfileRequested rebuild(void Function(ProfileRequestedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileRequestedBuilder toBuilder() =>
      new ProfileRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileRequested;
  }

  @override
  int get hashCode {
    return 791990897;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ProfileRequested').toString();
  }
}

class ProfileRequestedBuilder
    implements Builder<ProfileRequested, ProfileRequestedBuilder> {
  _$ProfileRequested _$v;

  ProfileRequestedBuilder();

  @override
  void replace(ProfileRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProfileRequested;
  }

  @override
  void update(void Function(ProfileRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfileRequested build() {
    final _$result = _$v ?? new _$ProfileRequested._();
    replace(_$result);
    return _$result;
  }
}

class _$UserUpdateRequested extends UserUpdateRequested {
  @override
  final User user;

  factory _$UserUpdateRequested(
          [void Function(UserUpdateRequestedBuilder) updates]) =>
      (new UserUpdateRequestedBuilder()..update(updates)).build();

  _$UserUpdateRequested._({this.user}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('UserUpdateRequested', 'user');
    }
  }

  @override
  UserUpdateRequested rebuild(
          void Function(UserUpdateRequestedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserUpdateRequestedBuilder toBuilder() =>
      new UserUpdateRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserUpdateRequested && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserUpdateRequested')
          ..add('user', user))
        .toString();
  }
}

class UserUpdateRequestedBuilder
    implements Builder<UserUpdateRequested, UserUpdateRequestedBuilder> {
  _$UserUpdateRequested _$v;

  User _user;
  User get user => _$this._user;
  set user(User user) => _$this._user = user;

  UserUpdateRequestedBuilder();

  UserUpdateRequestedBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserUpdateRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserUpdateRequested;
  }

  @override
  void update(void Function(UserUpdateRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserUpdateRequested build() {
    final _$result = _$v ?? new _$UserUpdateRequested._(user: user);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
