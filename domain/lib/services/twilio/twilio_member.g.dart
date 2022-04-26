// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twilio_member.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TwilioUser extends TwilioUser {
  @override
  final String identity;
  @override
  final String friendlyName;

  factory _$TwilioUser([void Function(TwilioUserBuilder) updates]) =>
      (new TwilioUserBuilder()..update(updates)).build();

  _$TwilioUser._({this.identity, this.friendlyName}) : super._() {
    if (identity == null) {
      throw new BuiltValueNullFieldError('TwilioUser', 'identity');
    }
    if (friendlyName == null) {
      throw new BuiltValueNullFieldError('TwilioUser', 'friendlyName');
    }
  }

  @override
  TwilioUser rebuild(void Function(TwilioUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TwilioUserBuilder toBuilder() => new TwilioUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TwilioUser &&
        identity == other.identity &&
        friendlyName == other.friendlyName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, identity.hashCode), friendlyName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TwilioUser')
          ..add('identity', identity)
          ..add('friendlyName', friendlyName))
        .toString();
  }
}

class TwilioUserBuilder implements Builder<TwilioUser, TwilioUserBuilder> {
  _$TwilioUser _$v;

  String _identity;
  String get identity => _$this._identity;
  set identity(String identity) => _$this._identity = identity;

  String _friendlyName;
  String get friendlyName => _$this._friendlyName;
  set friendlyName(String friendlyName) => _$this._friendlyName = friendlyName;

  TwilioUserBuilder();

  TwilioUserBuilder get _$this {
    if (_$v != null) {
      _identity = _$v.identity;
      _friendlyName = _$v.friendlyName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TwilioUser other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TwilioUser;
  }

  @override
  void update(void Function(TwilioUserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TwilioUser build() {
    final _$result = _$v ??
        new _$TwilioUser._(identity: identity, friendlyName: friendlyName);
    replace(_$result);
    return _$result;
  }
}

class _$TwilioMember extends TwilioMember {
  @override
  final String sid;
  @override
  final String identity;
  @override
  final Future<TwilioUser> Function() fetchUser;

  factory _$TwilioMember([void Function(TwilioMemberBuilder) updates]) =>
      (new TwilioMemberBuilder()..update(updates)).build();

  _$TwilioMember._({this.sid, this.identity, this.fetchUser}) : super._() {
    if (sid == null) {
      throw new BuiltValueNullFieldError('TwilioMember', 'sid');
    }
    if (identity == null) {
      throw new BuiltValueNullFieldError('TwilioMember', 'identity');
    }
    if (fetchUser == null) {
      throw new BuiltValueNullFieldError('TwilioMember', 'fetchUser');
    }
  }

  @override
  TwilioMember rebuild(void Function(TwilioMemberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TwilioMemberBuilder toBuilder() => new TwilioMemberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is TwilioMember &&
        sid == other.sid &&
        identity == other.identity &&
        fetchUser == _$dynamicOther.fetchUser;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, sid.hashCode), identity.hashCode), fetchUser.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TwilioMember')
          ..add('sid', sid)
          ..add('identity', identity)
          ..add('fetchUser', fetchUser))
        .toString();
  }
}

class TwilioMemberBuilder
    implements Builder<TwilioMember, TwilioMemberBuilder> {
  _$TwilioMember _$v;

  String _sid;
  String get sid => _$this._sid;
  set sid(String sid) => _$this._sid = sid;

  String _identity;
  String get identity => _$this._identity;
  set identity(String identity) => _$this._identity = identity;

  Future<TwilioUser> Function() _fetchUser;
  Future<TwilioUser> Function() get fetchUser => _$this._fetchUser;
  set fetchUser(Future<TwilioUser> Function() fetchUser) =>
      _$this._fetchUser = fetchUser;

  TwilioMemberBuilder();

  TwilioMemberBuilder get _$this {
    if (_$v != null) {
      _sid = _$v.sid;
      _identity = _$v.identity;
      _fetchUser = _$v.fetchUser;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TwilioMember other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TwilioMember;
  }

  @override
  void update(void Function(TwilioMemberBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TwilioMember build() {
    final _$result = _$v ??
        new _$TwilioMember._(
            sid: sid, identity: identity, fetchUser: fetchUser);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
