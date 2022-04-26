// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concierge_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConciergeTurnSuccessful> _$conciergeTurnSuccessfulSerializer =
    new _$ConciergeTurnSuccessfulSerializer();
Serializer<ConciergeHandoverSuccessful<Object>>
    _$conciergeHandoverSuccessfulSerializer =
    new _$ConciergeHandoverSuccessfulSerializer();
Serializer<ConciergeConnectionFailure> _$conciergeConnectionFailureSerializer =
    new _$ConciergeConnectionFailureSerializer();

class _$ConciergeTurnSuccessfulSerializer
    implements StructuredSerializer<ConciergeTurnSuccessful> {
  @override
  final Iterable<Type> types = const [
    ConciergeTurnSuccessful,
    _$ConciergeTurnSuccessful
  ];
  @override
  final String wireName = 'ConciergeTurnSuccessful';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ConciergeTurnSuccessful object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.viewModel != null) {
      result
        ..add('viewModel')
        ..add(serializers.serialize(object.viewModel,
            specifiedType: const FullType(ChatViewModel)));
    }
    return result;
  }

  @override
  ConciergeTurnSuccessful deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConciergeTurnSuccessfulBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'viewModel':
          result.viewModel = serializers.deserialize(value,
              specifiedType: const FullType(ChatViewModel)) as ChatViewModel;
          break;
      }
    }

    return result.build();
  }
}

class _$ConciergeHandoverSuccessfulSerializer
    implements StructuredSerializer<ConciergeHandoverSuccessful<Object>> {
  @override
  final Iterable<Type> types = const [
    ConciergeHandoverSuccessful,
    _$ConciergeHandoverSuccessful
  ];
  @override
  final String wireName = 'ConciergeHandoverSuccessful';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ConciergeHandoverSuccessful<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(HandoverType)),
    ];
    if (object.payload != null) {
      result
        ..add('payload')
        ..add(serializers.serialize(object.payload, specifiedType: parameterT));
    }
    if (object.viewModel != null) {
      result
        ..add('viewModel')
        ..add(serializers.serialize(object.viewModel,
            specifiedType: const FullType(ChatViewModel)));
    }
    return result;
  }

  @override
  ConciergeHandoverSuccessful<Object> deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new ConciergeHandoverSuccessfulBuilder<Object>()
        : serializers.newBuilder(specifiedType)
            as ConciergeHandoverSuccessfulBuilder;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(HandoverType)) as HandoverType;
          break;
        case 'payload':
          result.payload =
              serializers.deserialize(value, specifiedType: parameterT);
          break;
        case 'viewModel':
          result.viewModel = serializers.deserialize(value,
              specifiedType: const FullType(ChatViewModel)) as ChatViewModel;
          break;
      }
    }

    return result.build();
  }
}

class _$ConciergeConnectionFailureSerializer
    implements StructuredSerializer<ConciergeConnectionFailure> {
  @override
  final Iterable<Type> types = const [
    ConciergeConnectionFailure,
    _$ConciergeConnectionFailure
  ];
  @override
  final String wireName = 'ConciergeConnectionFailure';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ConciergeConnectionFailure object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.viewModel != null) {
      result
        ..add('viewModel')
        ..add(serializers.serialize(object.viewModel,
            specifiedType: const FullType(ChatViewModel)));
    }
    return result;
  }

  @override
  ConciergeConnectionFailure deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConciergeConnectionFailureBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'viewModel':
          result.viewModel = serializers.deserialize(value,
              specifiedType: const FullType(ChatViewModel)) as ChatViewModel;
          break;
      }
    }

    return result.build();
  }
}

class _$ConciergeTurnSuccessful extends ConciergeTurnSuccessful {
  @override
  final ChatViewModel viewModel;

  factory _$ConciergeTurnSuccessful(
          [void Function(ConciergeTurnSuccessfulBuilder) updates]) =>
      (new ConciergeTurnSuccessfulBuilder()..update(updates)).build();

  _$ConciergeTurnSuccessful._({this.viewModel}) : super._();

  @override
  ConciergeTurnSuccessful rebuild(
          void Function(ConciergeTurnSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConciergeTurnSuccessfulBuilder toBuilder() =>
      new ConciergeTurnSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConciergeTurnSuccessful && viewModel == other.viewModel;
  }

  @override
  int get hashCode {
    return $jf($jc(0, viewModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConciergeTurnSuccessful')
          ..add('viewModel', viewModel))
        .toString();
  }
}

class ConciergeTurnSuccessfulBuilder
    implements
        Builder<ConciergeTurnSuccessful, ConciergeTurnSuccessfulBuilder> {
  _$ConciergeTurnSuccessful _$v;

  ChatViewModel _viewModel;
  ChatViewModel get viewModel => _$this._viewModel;
  set viewModel(ChatViewModel viewModel) => _$this._viewModel = viewModel;

  ConciergeTurnSuccessfulBuilder();

  ConciergeTurnSuccessfulBuilder get _$this {
    if (_$v != null) {
      _viewModel = _$v.viewModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConciergeTurnSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConciergeTurnSuccessful;
  }

  @override
  void update(void Function(ConciergeTurnSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConciergeTurnSuccessful build() {
    final _$result =
        _$v ?? new _$ConciergeTurnSuccessful._(viewModel: viewModel);
    replace(_$result);
    return _$result;
  }
}

class _$ConciergeHandoverSuccessful<T> extends ConciergeHandoverSuccessful<T> {
  @override
  final HandoverType type;
  @override
  final T payload;
  @override
  final ChatViewModel viewModel;

  factory _$ConciergeHandoverSuccessful(
          [void Function(ConciergeHandoverSuccessfulBuilder<T>) updates]) =>
      (new ConciergeHandoverSuccessfulBuilder<T>()..update(updates)).build();

  _$ConciergeHandoverSuccessful._({this.type, this.payload, this.viewModel})
      : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('ConciergeHandoverSuccessful', 'type');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(
          'ConciergeHandoverSuccessful', 'T');
    }
  }

  @override
  ConciergeHandoverSuccessful<T> rebuild(
          void Function(ConciergeHandoverSuccessfulBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConciergeHandoverSuccessfulBuilder<T> toBuilder() =>
      new ConciergeHandoverSuccessfulBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConciergeHandoverSuccessful &&
        type == other.type &&
        payload == other.payload &&
        viewModel == other.viewModel;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, type.hashCode), payload.hashCode), viewModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConciergeHandoverSuccessful')
          ..add('type', type)
          ..add('payload', payload)
          ..add('viewModel', viewModel))
        .toString();
  }
}

class ConciergeHandoverSuccessfulBuilder<T>
    implements
        Builder<ConciergeHandoverSuccessful<T>,
            ConciergeHandoverSuccessfulBuilder<T>> {
  _$ConciergeHandoverSuccessful<T> _$v;

  HandoverType _type;
  HandoverType get type => _$this._type;
  set type(HandoverType type) => _$this._type = type;

  T _payload;
  T get payload => _$this._payload;
  set payload(T payload) => _$this._payload = payload;

  ChatViewModel _viewModel;
  ChatViewModel get viewModel => _$this._viewModel;
  set viewModel(ChatViewModel viewModel) => _$this._viewModel = viewModel;

  ConciergeHandoverSuccessfulBuilder();

  ConciergeHandoverSuccessfulBuilder<T> get _$this {
    if (_$v != null) {
      _type = _$v.type;
      _payload = _$v.payload;
      _viewModel = _$v.viewModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConciergeHandoverSuccessful<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConciergeHandoverSuccessful<T>;
  }

  @override
  void update(void Function(ConciergeHandoverSuccessfulBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConciergeHandoverSuccessful<T> build() {
    final _$result = _$v ??
        new _$ConciergeHandoverSuccessful<T>._(
            type: type, payload: payload, viewModel: viewModel);
    replace(_$result);
    return _$result;
  }
}

class _$ConciergeConnectionFailure extends ConciergeConnectionFailure {
  @override
  final ChatViewModel viewModel;

  factory _$ConciergeConnectionFailure(
          [void Function(ConciergeConnectionFailureBuilder) updates]) =>
      (new ConciergeConnectionFailureBuilder()..update(updates)).build();

  _$ConciergeConnectionFailure._({this.viewModel}) : super._();

  @override
  ConciergeConnectionFailure rebuild(
          void Function(ConciergeConnectionFailureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConciergeConnectionFailureBuilder toBuilder() =>
      new ConciergeConnectionFailureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConciergeConnectionFailure && viewModel == other.viewModel;
  }

  @override
  int get hashCode {
    return $jf($jc(0, viewModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConciergeConnectionFailure')
          ..add('viewModel', viewModel))
        .toString();
  }
}

class ConciergeConnectionFailureBuilder
    implements
        Builder<ConciergeConnectionFailure, ConciergeConnectionFailureBuilder> {
  _$ConciergeConnectionFailure _$v;

  ChatViewModel _viewModel;
  ChatViewModel get viewModel => _$this._viewModel;
  set viewModel(ChatViewModel viewModel) => _$this._viewModel = viewModel;

  ConciergeConnectionFailureBuilder();

  ConciergeConnectionFailureBuilder get _$this {
    if (_$v != null) {
      _viewModel = _$v.viewModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConciergeConnectionFailure other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConciergeConnectionFailure;
  }

  @override
  void update(void Function(ConciergeConnectionFailureBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConciergeConnectionFailure build() {
    final _$result =
        _$v ?? new _$ConciergeConnectionFailure._(viewModel: viewModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
