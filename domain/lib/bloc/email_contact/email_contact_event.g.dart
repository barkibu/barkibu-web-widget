// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_contact_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EmailContactMessageSent extends EmailContactMessageSent {
  @override
  final Email emailForVet;

  factory _$EmailContactMessageSent(
          [void Function(EmailContactMessageSentBuilder) updates]) =>
      (new EmailContactMessageSentBuilder()..update(updates)).build();

  _$EmailContactMessageSent._({this.emailForVet}) : super._() {
    if (emailForVet == null) {
      throw new BuiltValueNullFieldError(
          'EmailContactMessageSent', 'emailForVet');
    }
  }

  @override
  EmailContactMessageSent rebuild(
          void Function(EmailContactMessageSentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmailContactMessageSentBuilder toBuilder() =>
      new EmailContactMessageSentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EmailContactMessageSent && emailForVet == other.emailForVet;
  }

  @override
  int get hashCode {
    return $jf($jc(0, emailForVet.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EmailContactMessageSent')
          ..add('emailForVet', emailForVet))
        .toString();
  }
}

class EmailContactMessageSentBuilder
    implements
        Builder<EmailContactMessageSent, EmailContactMessageSentBuilder> {
  _$EmailContactMessageSent _$v;

  Email _emailForVet;
  Email get emailForVet => _$this._emailForVet;
  set emailForVet(Email emailForVet) => _$this._emailForVet = emailForVet;

  EmailContactMessageSentBuilder();

  EmailContactMessageSentBuilder get _$this {
    if (_$v != null) {
      _emailForVet = _$v.emailForVet;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EmailContactMessageSent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EmailContactMessageSent;
  }

  @override
  void update(void Function(EmailContactMessageSentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EmailContactMessageSent build() {
    final _$result =
        _$v ?? new _$EmailContactMessageSent._(emailForVet: emailForVet);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
