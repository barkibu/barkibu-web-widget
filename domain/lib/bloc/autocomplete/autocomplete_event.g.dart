// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AutoCompleteRequested extends AutoCompleteRequested {
  @override
  final String query;
  @override
  final Map<String, dynamic> params;

  factory _$AutoCompleteRequested(
          [void Function(AutoCompleteRequestedBuilder) updates]) =>
      (new AutoCompleteRequestedBuilder()..update(updates)).build();

  _$AutoCompleteRequested._({this.query, this.params}) : super._() {
    if (query == null) {
      throw new BuiltValueNullFieldError('AutoCompleteRequested', 'query');
    }
    if (params == null) {
      throw new BuiltValueNullFieldError('AutoCompleteRequested', 'params');
    }
  }

  @override
  AutoCompleteRequested rebuild(
          void Function(AutoCompleteRequestedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AutoCompleteRequestedBuilder toBuilder() =>
      new AutoCompleteRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AutoCompleteRequested &&
        query == other.query &&
        params == other.params;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, query.hashCode), params.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AutoCompleteRequested')
          ..add('query', query)
          ..add('params', params))
        .toString();
  }
}

class AutoCompleteRequestedBuilder
    implements Builder<AutoCompleteRequested, AutoCompleteRequestedBuilder> {
  _$AutoCompleteRequested _$v;

  String _query;
  String get query => _$this._query;
  set query(String query) => _$this._query = query;

  Map<String, dynamic> _params;
  Map<String, dynamic> get params => _$this._params;
  set params(Map<String, dynamic> params) => _$this._params = params;

  AutoCompleteRequestedBuilder();

  AutoCompleteRequestedBuilder get _$this {
    if (_$v != null) {
      _query = _$v.query;
      _params = _$v.params;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AutoCompleteRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AutoCompleteRequested;
  }

  @override
  void update(void Function(AutoCompleteRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AutoCompleteRequested build() {
    final _$result =
        _$v ?? new _$AutoCompleteRequested._(query: query, params: params);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
