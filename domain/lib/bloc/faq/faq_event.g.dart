// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FaqViewRequested extends FaqViewRequested {
  @override
  final String filter;

  factory _$FaqViewRequested(
          [void Function(FaqViewRequestedBuilder) updates]) =>
      (new FaqViewRequestedBuilder()..update(updates)).build();

  _$FaqViewRequested._({this.filter}) : super._() {
    if (filter == null) {
      throw new BuiltValueNullFieldError('FaqViewRequested', 'filter');
    }
  }

  @override
  FaqViewRequested rebuild(void Function(FaqViewRequestedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FaqViewRequestedBuilder toBuilder() =>
      new FaqViewRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FaqViewRequested && filter == other.filter;
  }

  @override
  int get hashCode {
    return $jf($jc(0, filter.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FaqViewRequested')
          ..add('filter', filter))
        .toString();
  }
}

class FaqViewRequestedBuilder
    implements Builder<FaqViewRequested, FaqViewRequestedBuilder> {
  _$FaqViewRequested _$v;

  String _filter;
  String get filter => _$this._filter;
  set filter(String filter) => _$this._filter = filter;

  FaqViewRequestedBuilder();

  FaqViewRequestedBuilder get _$this {
    if (_$v != null) {
      _filter = _$v.filter;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FaqViewRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FaqViewRequested;
  }

  @override
  void update(void Function(FaqViewRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FaqViewRequested build() {
    final _$result = _$v ?? new _$FaqViewRequested._(filter: filter);
    replace(_$result);
    return _$result;
  }
}

class _$FaqContentExpanded extends FaqContentExpanded {
  @override
  final String faqId;
  @override
  final String planName;

  factory _$FaqContentExpanded(
          [void Function(FaqContentExpandedBuilder) updates]) =>
      (new FaqContentExpandedBuilder()..update(updates)).build();

  _$FaqContentExpanded._({this.faqId, this.planName}) : super._() {
    if (faqId == null) {
      throw new BuiltValueNullFieldError('FaqContentExpanded', 'faqId');
    }
    if (planName == null) {
      throw new BuiltValueNullFieldError('FaqContentExpanded', 'planName');
    }
  }

  @override
  FaqContentExpanded rebuild(
          void Function(FaqContentExpandedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FaqContentExpandedBuilder toBuilder() =>
      new FaqContentExpandedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FaqContentExpanded &&
        faqId == other.faqId &&
        planName == other.planName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, faqId.hashCode), planName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FaqContentExpanded')
          ..add('faqId', faqId)
          ..add('planName', planName))
        .toString();
  }
}

class FaqContentExpandedBuilder
    implements Builder<FaqContentExpanded, FaqContentExpandedBuilder> {
  _$FaqContentExpanded _$v;

  String _faqId;
  String get faqId => _$this._faqId;
  set faqId(String faqId) => _$this._faqId = faqId;

  String _planName;
  String get planName => _$this._planName;
  set planName(String planName) => _$this._planName = planName;

  FaqContentExpandedBuilder();

  FaqContentExpandedBuilder get _$this {
    if (_$v != null) {
      _faqId = _$v.faqId;
      _planName = _$v.planName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FaqContentExpanded other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FaqContentExpanded;
  }

  @override
  void update(void Function(FaqContentExpandedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FaqContentExpanded build() {
    final _$result =
        _$v ?? new _$FaqContentExpanded._(faqId: faqId, planName: planName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
