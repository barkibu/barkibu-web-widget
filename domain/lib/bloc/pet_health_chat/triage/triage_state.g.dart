// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'triage_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TriageInitial> _$triageInitialSerializer =
    new _$TriageInitialSerializer();
Serializer<TriagePetDefinitionHandOverSuccess>
    _$triagePetDefinitionHandOverSuccessSerializer =
    new _$TriagePetDefinitionHandOverSuccessSerializer();
Serializer<TriageSymptomDefinitionSkippedSuccess>
    _$triageSymptomDefinitionSkippedSuccessSerializer =
    new _$TriageSymptomDefinitionSkippedSuccessSerializer();
Serializer<TriageDiagnoseSuccess> _$triageDiagnoseSuccessSerializer =
    new _$TriageDiagnoseSuccessSerializer();

class _$TriageInitialSerializer implements StructuredSerializer<TriageInitial> {
  @override
  final Iterable<Type> types = const [TriageInitial, _$TriageInitial];
  @override
  final String wireName = 'TriageInitial';

  @override
  Iterable<Object> serialize(Serializers serializers, TriageInitial object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'toHandOver',
      serializers.serialize(object.toHandOver,
          specifiedType: const FullType(bool)),
    ];
    if (object.userQuestion != null) {
      result
        ..add('userQuestion')
        ..add(serializers.serialize(object.userQuestion,
            specifiedType: const FullType(String)));
    }
    if (object.anamnesisResults != null) {
      result
        ..add('anamnesisResults')
        ..add(serializers.serialize(object.anamnesisResults,
            specifiedType: const FullType(Anamnesis)));
    }
    if (object.aiVetModel != null) {
      result
        ..add('aiVetModel')
        ..add(serializers.serialize(object.aiVetModel,
            specifiedType: const FullType(AiVetModel)));
    }
    if (object.viewModel != null) {
      result
        ..add('viewModel')
        ..add(serializers.serialize(object.viewModel,
            specifiedType: const FullType(ChatViewModel)));
    }
    if (object.flow != null) {
      result
        ..add('flow')
        ..add(serializers.serialize(object.flow,
            specifiedType: const FullType(TriageFlow)));
    }
    return result;
  }

  @override
  TriageInitial deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TriageInitialBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userQuestion':
          result.userQuestion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'anamnesisResults':
          result.anamnesisResults = serializers.deserialize(value,
              specifiedType: const FullType(Anamnesis)) as Anamnesis;
          break;
        case 'aiVetModel':
          result.aiVetModel = serializers.deserialize(value,
              specifiedType: const FullType(AiVetModel)) as AiVetModel;
          break;
        case 'viewModel':
          result.viewModel = serializers.deserialize(value,
              specifiedType: const FullType(ChatViewModel)) as ChatViewModel;
          break;
        case 'flow':
          result.flow = serializers.deserialize(value,
              specifiedType: const FullType(TriageFlow)) as TriageFlow;
          break;
        case 'toHandOver':
          result.toHandOver = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$TriagePetDefinitionHandOverSuccessSerializer
    implements StructuredSerializer<TriagePetDefinitionHandOverSuccess> {
  @override
  final Iterable<Type> types = const [
    TriagePetDefinitionHandOverSuccess,
    _$TriagePetDefinitionHandOverSuccess
  ];
  @override
  final String wireName = 'TriagePetDefinitionHandOverSuccess';

  @override
  Iterable<Object> serialize(
      Serializers serializers, TriagePetDefinitionHandOverSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'toHandOver',
      serializers.serialize(object.toHandOver,
          specifiedType: const FullType(bool)),
    ];
    if (object.userQuestion != null) {
      result
        ..add('userQuestion')
        ..add(serializers.serialize(object.userQuestion,
            specifiedType: const FullType(String)));
    }
    if (object.anamnesisResults != null) {
      result
        ..add('anamnesisResults')
        ..add(serializers.serialize(object.anamnesisResults,
            specifiedType: const FullType(Anamnesis)));
    }
    if (object.aiVetModel != null) {
      result
        ..add('aiVetModel')
        ..add(serializers.serialize(object.aiVetModel,
            specifiedType: const FullType(AiVetModel)));
    }
    if (object.viewModel != null) {
      result
        ..add('viewModel')
        ..add(serializers.serialize(object.viewModel,
            specifiedType: const FullType(ChatViewModel)));
    }
    if (object.flow != null) {
      result
        ..add('flow')
        ..add(serializers.serialize(object.flow,
            specifiedType: const FullType(TriageFlow)));
    }
    return result;
  }

  @override
  TriagePetDefinitionHandOverSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TriagePetDefinitionHandOverSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userQuestion':
          result.userQuestion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'anamnesisResults':
          result.anamnesisResults = serializers.deserialize(value,
              specifiedType: const FullType(Anamnesis)) as Anamnesis;
          break;
        case 'aiVetModel':
          result.aiVetModel = serializers.deserialize(value,
              specifiedType: const FullType(AiVetModel)) as AiVetModel;
          break;
        case 'viewModel':
          result.viewModel = serializers.deserialize(value,
              specifiedType: const FullType(ChatViewModel)) as ChatViewModel;
          break;
        case 'flow':
          result.flow = serializers.deserialize(value,
              specifiedType: const FullType(TriageFlow)) as TriageFlow;
          break;
        case 'toHandOver':
          result.toHandOver = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$TriageSymptomDefinitionSkippedSuccessSerializer
    implements StructuredSerializer<TriageSymptomDefinitionSkippedSuccess> {
  @override
  final Iterable<Type> types = const [
    TriageSymptomDefinitionSkippedSuccess,
    _$TriageSymptomDefinitionSkippedSuccess
  ];
  @override
  final String wireName = 'TriageSymptomDefinitionSkippedSuccess';

  @override
  Iterable<Object> serialize(
      Serializers serializers, TriageSymptomDefinitionSkippedSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'toHandOver',
      serializers.serialize(object.toHandOver,
          specifiedType: const FullType(bool)),
    ];
    if (object.userQuestion != null) {
      result
        ..add('userQuestion')
        ..add(serializers.serialize(object.userQuestion,
            specifiedType: const FullType(String)));
    }
    if (object.anamnesisResults != null) {
      result
        ..add('anamnesisResults')
        ..add(serializers.serialize(object.anamnesisResults,
            specifiedType: const FullType(Anamnesis)));
    }
    if (object.aiVetModel != null) {
      result
        ..add('aiVetModel')
        ..add(serializers.serialize(object.aiVetModel,
            specifiedType: const FullType(AiVetModel)));
    }
    if (object.viewModel != null) {
      result
        ..add('viewModel')
        ..add(serializers.serialize(object.viewModel,
            specifiedType: const FullType(ChatViewModel)));
    }
    if (object.flow != null) {
      result
        ..add('flow')
        ..add(serializers.serialize(object.flow,
            specifiedType: const FullType(TriageFlow)));
    }
    return result;
  }

  @override
  TriageSymptomDefinitionSkippedSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TriageSymptomDefinitionSkippedSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userQuestion':
          result.userQuestion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'anamnesisResults':
          result.anamnesisResults = serializers.deserialize(value,
              specifiedType: const FullType(Anamnesis)) as Anamnesis;
          break;
        case 'aiVetModel':
          result.aiVetModel = serializers.deserialize(value,
              specifiedType: const FullType(AiVetModel)) as AiVetModel;
          break;
        case 'viewModel':
          result.viewModel = serializers.deserialize(value,
              specifiedType: const FullType(ChatViewModel)) as ChatViewModel;
          break;
        case 'flow':
          result.flow = serializers.deserialize(value,
              specifiedType: const FullType(TriageFlow)) as TriageFlow;
          break;
        case 'toHandOver':
          result.toHandOver = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$TriageDiagnoseSuccessSerializer
    implements StructuredSerializer<TriageDiagnoseSuccess> {
  @override
  final Iterable<Type> types = const [
    TriageDiagnoseSuccess,
    _$TriageDiagnoseSuccess
  ];
  @override
  final String wireName = 'TriageDiagnoseSuccess';

  @override
  Iterable<Object> serialize(
      Serializers serializers, TriageDiagnoseSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'toHandOver',
      serializers.serialize(object.toHandOver,
          specifiedType: const FullType(bool)),
    ];
    if (object.userQuestion != null) {
      result
        ..add('userQuestion')
        ..add(serializers.serialize(object.userQuestion,
            specifiedType: const FullType(String)));
    }
    if (object.anamnesisResults != null) {
      result
        ..add('anamnesisResults')
        ..add(serializers.serialize(object.anamnesisResults,
            specifiedType: const FullType(Anamnesis)));
    }
    if (object.aiVetModel != null) {
      result
        ..add('aiVetModel')
        ..add(serializers.serialize(object.aiVetModel,
            specifiedType: const FullType(AiVetModel)));
    }
    if (object.viewModel != null) {
      result
        ..add('viewModel')
        ..add(serializers.serialize(object.viewModel,
            specifiedType: const FullType(ChatViewModel)));
    }
    if (object.flow != null) {
      result
        ..add('flow')
        ..add(serializers.serialize(object.flow,
            specifiedType: const FullType(TriageFlow)));
    }
    return result;
  }

  @override
  TriageDiagnoseSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TriageDiagnoseSuccessBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'userQuestion':
          result.userQuestion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'anamnesisResults':
          result.anamnesisResults = serializers.deserialize(value,
              specifiedType: const FullType(Anamnesis)) as Anamnesis;
          break;
        case 'aiVetModel':
          result.aiVetModel = serializers.deserialize(value,
              specifiedType: const FullType(AiVetModel)) as AiVetModel;
          break;
        case 'viewModel':
          result.viewModel = serializers.deserialize(value,
              specifiedType: const FullType(ChatViewModel)) as ChatViewModel;
          break;
        case 'flow':
          result.flow = serializers.deserialize(value,
              specifiedType: const FullType(TriageFlow)) as TriageFlow;
          break;
        case 'toHandOver':
          result.toHandOver = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$TriageInitial extends TriageInitial {
  @override
  final String userQuestion;
  @override
  final Anamnesis anamnesisResults;
  @override
  final AiVetModel aiVetModel;
  @override
  final ChatViewModel viewModel;
  @override
  final TriageFlow flow;
  @override
  final bool toHandOver;

  factory _$TriageInitial([void Function(TriageInitialBuilder) updates]) =>
      (new TriageInitialBuilder()..update(updates)).build();

  _$TriageInitial._(
      {this.userQuestion,
      this.anamnesisResults,
      this.aiVetModel,
      this.viewModel,
      this.flow,
      this.toHandOver})
      : super._() {
    if (toHandOver == null) {
      throw new BuiltValueNullFieldError('TriageInitial', 'toHandOver');
    }
  }

  @override
  TriageInitial rebuild(void Function(TriageInitialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TriageInitialBuilder toBuilder() => new TriageInitialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TriageInitial &&
        userQuestion == other.userQuestion &&
        anamnesisResults == other.anamnesisResults &&
        aiVetModel == other.aiVetModel &&
        viewModel == other.viewModel &&
        flow == other.flow &&
        toHandOver == other.toHandOver;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc(0, userQuestion.hashCode),
                        anamnesisResults.hashCode),
                    aiVetModel.hashCode),
                viewModel.hashCode),
            flow.hashCode),
        toHandOver.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TriageInitial')
          ..add('userQuestion', userQuestion)
          ..add('anamnesisResults', anamnesisResults)
          ..add('aiVetModel', aiVetModel)
          ..add('viewModel', viewModel)
          ..add('flow', flow)
          ..add('toHandOver', toHandOver))
        .toString();
  }
}

class TriageInitialBuilder
    implements Builder<TriageInitial, TriageInitialBuilder> {
  _$TriageInitial _$v;

  String _userQuestion;
  String get userQuestion => _$this._userQuestion;
  set userQuestion(String userQuestion) => _$this._userQuestion = userQuestion;

  Anamnesis _anamnesisResults;
  Anamnesis get anamnesisResults => _$this._anamnesisResults;
  set anamnesisResults(Anamnesis anamnesisResults) =>
      _$this._anamnesisResults = anamnesisResults;

  AiVetModel _aiVetModel;
  AiVetModel get aiVetModel => _$this._aiVetModel;
  set aiVetModel(AiVetModel aiVetModel) => _$this._aiVetModel = aiVetModel;

  ChatViewModel _viewModel;
  ChatViewModel get viewModel => _$this._viewModel;
  set viewModel(ChatViewModel viewModel) => _$this._viewModel = viewModel;

  TriageFlow _flow;
  TriageFlow get flow => _$this._flow;
  set flow(TriageFlow flow) => _$this._flow = flow;

  bool _toHandOver;
  bool get toHandOver => _$this._toHandOver;
  set toHandOver(bool toHandOver) => _$this._toHandOver = toHandOver;

  TriageInitialBuilder() {
    TriageInitial._initializeBuilder(this);
  }

  TriageInitialBuilder get _$this {
    if (_$v != null) {
      _userQuestion = _$v.userQuestion;
      _anamnesisResults = _$v.anamnesisResults;
      _aiVetModel = _$v.aiVetModel;
      _viewModel = _$v.viewModel;
      _flow = _$v.flow;
      _toHandOver = _$v.toHandOver;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TriageInitial other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TriageInitial;
  }

  @override
  void update(void Function(TriageInitialBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TriageInitial build() {
    final _$result = _$v ??
        new _$TriageInitial._(
            userQuestion: userQuestion,
            anamnesisResults: anamnesisResults,
            aiVetModel: aiVetModel,
            viewModel: viewModel,
            flow: flow,
            toHandOver: toHandOver);
    replace(_$result);
    return _$result;
  }
}

class _$TriageInitSuccess extends TriageInitSuccess {
  @override
  final String userQuestion;
  @override
  final Anamnesis anamnesisResults;
  @override
  final AiVetModel aiVetModel;
  @override
  final ChatViewModel viewModel;
  @override
  final TriageFlow flow;
  @override
  final bool toHandOver;

  factory _$TriageInitSuccess(
          [void Function(TriageInitSuccessBuilder) updates]) =>
      (new TriageInitSuccessBuilder()..update(updates)).build();

  _$TriageInitSuccess._(
      {this.userQuestion,
      this.anamnesisResults,
      this.aiVetModel,
      this.viewModel,
      this.flow,
      this.toHandOver})
      : super._() {
    if (toHandOver == null) {
      throw new BuiltValueNullFieldError('TriageInitSuccess', 'toHandOver');
    }
  }

  @override
  TriageInitSuccess rebuild(void Function(TriageInitSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TriageInitSuccessBuilder toBuilder() =>
      new TriageInitSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TriageInitSuccess &&
        userQuestion == other.userQuestion &&
        anamnesisResults == other.anamnesisResults &&
        aiVetModel == other.aiVetModel &&
        viewModel == other.viewModel &&
        flow == other.flow &&
        toHandOver == other.toHandOver;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc(0, userQuestion.hashCode),
                        anamnesisResults.hashCode),
                    aiVetModel.hashCode),
                viewModel.hashCode),
            flow.hashCode),
        toHandOver.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TriageInitSuccess')
          ..add('userQuestion', userQuestion)
          ..add('anamnesisResults', anamnesisResults)
          ..add('aiVetModel', aiVetModel)
          ..add('viewModel', viewModel)
          ..add('flow', flow)
          ..add('toHandOver', toHandOver))
        .toString();
  }
}

class TriageInitSuccessBuilder
    implements Builder<TriageInitSuccess, TriageInitSuccessBuilder> {
  _$TriageInitSuccess _$v;

  String _userQuestion;
  String get userQuestion => _$this._userQuestion;
  set userQuestion(String userQuestion) => _$this._userQuestion = userQuestion;

  Anamnesis _anamnesisResults;
  Anamnesis get anamnesisResults => _$this._anamnesisResults;
  set anamnesisResults(Anamnesis anamnesisResults) =>
      _$this._anamnesisResults = anamnesisResults;

  AiVetModel _aiVetModel;
  AiVetModel get aiVetModel => _$this._aiVetModel;
  set aiVetModel(AiVetModel aiVetModel) => _$this._aiVetModel = aiVetModel;

  ChatViewModel _viewModel;
  ChatViewModel get viewModel => _$this._viewModel;
  set viewModel(ChatViewModel viewModel) => _$this._viewModel = viewModel;

  TriageFlow _flow;
  TriageFlow get flow => _$this._flow;
  set flow(TriageFlow flow) => _$this._flow = flow;

  bool _toHandOver;
  bool get toHandOver => _$this._toHandOver;
  set toHandOver(bool toHandOver) => _$this._toHandOver = toHandOver;

  TriageInitSuccessBuilder() {
    TriageInitSuccess._initializeBuilder(this);
  }

  TriageInitSuccessBuilder get _$this {
    if (_$v != null) {
      _userQuestion = _$v.userQuestion;
      _anamnesisResults = _$v.anamnesisResults;
      _aiVetModel = _$v.aiVetModel;
      _viewModel = _$v.viewModel;
      _flow = _$v.flow;
      _toHandOver = _$v.toHandOver;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TriageInitSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TriageInitSuccess;
  }

  @override
  void update(void Function(TriageInitSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TriageInitSuccess build() {
    final _$result = _$v ??
        new _$TriageInitSuccess._(
            userQuestion: userQuestion,
            anamnesisResults: anamnesisResults,
            aiVetModel: aiVetModel,
            viewModel: viewModel,
            flow: flow,
            toHandOver: toHandOver);
    replace(_$result);
    return _$result;
  }
}

class _$TriagePetDefinitionHandOverSuccess
    extends TriagePetDefinitionHandOverSuccess {
  @override
  final String userQuestion;
  @override
  final Anamnesis anamnesisResults;
  @override
  final AiVetModel aiVetModel;
  @override
  final ChatViewModel viewModel;
  @override
  final TriageFlow flow;
  @override
  final bool toHandOver;

  factory _$TriagePetDefinitionHandOverSuccess(
          [void Function(TriagePetDefinitionHandOverSuccessBuilder) updates]) =>
      (new TriagePetDefinitionHandOverSuccessBuilder()..update(updates))
          .build();

  _$TriagePetDefinitionHandOverSuccess._(
      {this.userQuestion,
      this.anamnesisResults,
      this.aiVetModel,
      this.viewModel,
      this.flow,
      this.toHandOver})
      : super._() {
    if (toHandOver == null) {
      throw new BuiltValueNullFieldError(
          'TriagePetDefinitionHandOverSuccess', 'toHandOver');
    }
  }

  @override
  TriagePetDefinitionHandOverSuccess rebuild(
          void Function(TriagePetDefinitionHandOverSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TriagePetDefinitionHandOverSuccessBuilder toBuilder() =>
      new TriagePetDefinitionHandOverSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TriagePetDefinitionHandOverSuccess &&
        userQuestion == other.userQuestion &&
        anamnesisResults == other.anamnesisResults &&
        aiVetModel == other.aiVetModel &&
        viewModel == other.viewModel &&
        flow == other.flow &&
        toHandOver == other.toHandOver;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc(0, userQuestion.hashCode),
                        anamnesisResults.hashCode),
                    aiVetModel.hashCode),
                viewModel.hashCode),
            flow.hashCode),
        toHandOver.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TriagePetDefinitionHandOverSuccess')
          ..add('userQuestion', userQuestion)
          ..add('anamnesisResults', anamnesisResults)
          ..add('aiVetModel', aiVetModel)
          ..add('viewModel', viewModel)
          ..add('flow', flow)
          ..add('toHandOver', toHandOver))
        .toString();
  }
}

class TriagePetDefinitionHandOverSuccessBuilder
    implements
        Builder<TriagePetDefinitionHandOverSuccess,
            TriagePetDefinitionHandOverSuccessBuilder> {
  _$TriagePetDefinitionHandOverSuccess _$v;

  String _userQuestion;
  String get userQuestion => _$this._userQuestion;
  set userQuestion(String userQuestion) => _$this._userQuestion = userQuestion;

  Anamnesis _anamnesisResults;
  Anamnesis get anamnesisResults => _$this._anamnesisResults;
  set anamnesisResults(Anamnesis anamnesisResults) =>
      _$this._anamnesisResults = anamnesisResults;

  AiVetModel _aiVetModel;
  AiVetModel get aiVetModel => _$this._aiVetModel;
  set aiVetModel(AiVetModel aiVetModel) => _$this._aiVetModel = aiVetModel;

  ChatViewModel _viewModel;
  ChatViewModel get viewModel => _$this._viewModel;
  set viewModel(ChatViewModel viewModel) => _$this._viewModel = viewModel;

  TriageFlow _flow;
  TriageFlow get flow => _$this._flow;
  set flow(TriageFlow flow) => _$this._flow = flow;

  bool _toHandOver;
  bool get toHandOver => _$this._toHandOver;
  set toHandOver(bool toHandOver) => _$this._toHandOver = toHandOver;

  TriagePetDefinitionHandOverSuccessBuilder();

  TriagePetDefinitionHandOverSuccessBuilder get _$this {
    if (_$v != null) {
      _userQuestion = _$v.userQuestion;
      _anamnesisResults = _$v.anamnesisResults;
      _aiVetModel = _$v.aiVetModel;
      _viewModel = _$v.viewModel;
      _flow = _$v.flow;
      _toHandOver = _$v.toHandOver;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TriagePetDefinitionHandOverSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TriagePetDefinitionHandOverSuccess;
  }

  @override
  void update(
      void Function(TriagePetDefinitionHandOverSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TriagePetDefinitionHandOverSuccess build() {
    final _$result = _$v ??
        new _$TriagePetDefinitionHandOverSuccess._(
            userQuestion: userQuestion,
            anamnesisResults: anamnesisResults,
            aiVetModel: aiVetModel,
            viewModel: viewModel,
            flow: flow,
            toHandOver: toHandOver);
    replace(_$result);
    return _$result;
  }
}

class _$TriageSymptomDefinitionSkippedSuccess
    extends TriageSymptomDefinitionSkippedSuccess {
  @override
  final String userQuestion;
  @override
  final Anamnesis anamnesisResults;
  @override
  final AiVetModel aiVetModel;
  @override
  final ChatViewModel viewModel;
  @override
  final TriageFlow flow;
  @override
  final bool toHandOver;

  factory _$TriageSymptomDefinitionSkippedSuccess(
          [void Function(TriageSymptomDefinitionSkippedSuccessBuilder)
              updates]) =>
      (new TriageSymptomDefinitionSkippedSuccessBuilder()..update(updates))
          .build();

  _$TriageSymptomDefinitionSkippedSuccess._(
      {this.userQuestion,
      this.anamnesisResults,
      this.aiVetModel,
      this.viewModel,
      this.flow,
      this.toHandOver})
      : super._() {
    if (toHandOver == null) {
      throw new BuiltValueNullFieldError(
          'TriageSymptomDefinitionSkippedSuccess', 'toHandOver');
    }
  }

  @override
  TriageSymptomDefinitionSkippedSuccess rebuild(
          void Function(TriageSymptomDefinitionSkippedSuccessBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TriageSymptomDefinitionSkippedSuccessBuilder toBuilder() =>
      new TriageSymptomDefinitionSkippedSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TriageSymptomDefinitionSkippedSuccess &&
        userQuestion == other.userQuestion &&
        anamnesisResults == other.anamnesisResults &&
        aiVetModel == other.aiVetModel &&
        viewModel == other.viewModel &&
        flow == other.flow &&
        toHandOver == other.toHandOver;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc(0, userQuestion.hashCode),
                        anamnesisResults.hashCode),
                    aiVetModel.hashCode),
                viewModel.hashCode),
            flow.hashCode),
        toHandOver.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TriageSymptomDefinitionSkippedSuccess')
          ..add('userQuestion', userQuestion)
          ..add('anamnesisResults', anamnesisResults)
          ..add('aiVetModel', aiVetModel)
          ..add('viewModel', viewModel)
          ..add('flow', flow)
          ..add('toHandOver', toHandOver))
        .toString();
  }
}

class TriageSymptomDefinitionSkippedSuccessBuilder
    implements
        Builder<TriageSymptomDefinitionSkippedSuccess,
            TriageSymptomDefinitionSkippedSuccessBuilder> {
  _$TriageSymptomDefinitionSkippedSuccess _$v;

  String _userQuestion;
  String get userQuestion => _$this._userQuestion;
  set userQuestion(String userQuestion) => _$this._userQuestion = userQuestion;

  Anamnesis _anamnesisResults;
  Anamnesis get anamnesisResults => _$this._anamnesisResults;
  set anamnesisResults(Anamnesis anamnesisResults) =>
      _$this._anamnesisResults = anamnesisResults;

  AiVetModel _aiVetModel;
  AiVetModel get aiVetModel => _$this._aiVetModel;
  set aiVetModel(AiVetModel aiVetModel) => _$this._aiVetModel = aiVetModel;

  ChatViewModel _viewModel;
  ChatViewModel get viewModel => _$this._viewModel;
  set viewModel(ChatViewModel viewModel) => _$this._viewModel = viewModel;

  TriageFlow _flow;
  TriageFlow get flow => _$this._flow;
  set flow(TriageFlow flow) => _$this._flow = flow;

  bool _toHandOver;
  bool get toHandOver => _$this._toHandOver;
  set toHandOver(bool toHandOver) => _$this._toHandOver = toHandOver;

  TriageSymptomDefinitionSkippedSuccessBuilder();

  TriageSymptomDefinitionSkippedSuccessBuilder get _$this {
    if (_$v != null) {
      _userQuestion = _$v.userQuestion;
      _anamnesisResults = _$v.anamnesisResults;
      _aiVetModel = _$v.aiVetModel;
      _viewModel = _$v.viewModel;
      _flow = _$v.flow;
      _toHandOver = _$v.toHandOver;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TriageSymptomDefinitionSkippedSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TriageSymptomDefinitionSkippedSuccess;
  }

  @override
  void update(
      void Function(TriageSymptomDefinitionSkippedSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TriageSymptomDefinitionSkippedSuccess build() {
    final _$result = _$v ??
        new _$TriageSymptomDefinitionSkippedSuccess._(
            userQuestion: userQuestion,
            anamnesisResults: anamnesisResults,
            aiVetModel: aiVetModel,
            viewModel: viewModel,
            flow: flow,
            toHandOver: toHandOver);
    replace(_$result);
    return _$result;
  }
}

class _$TriageDiagnoseSuccess extends TriageDiagnoseSuccess {
  @override
  final String userQuestion;
  @override
  final Anamnesis anamnesisResults;
  @override
  final AiVetModel aiVetModel;
  @override
  final ChatViewModel viewModel;
  @override
  final TriageFlow flow;
  @override
  final bool toHandOver;

  factory _$TriageDiagnoseSuccess(
          [void Function(TriageDiagnoseSuccessBuilder) updates]) =>
      (new TriageDiagnoseSuccessBuilder()..update(updates)).build();

  _$TriageDiagnoseSuccess._(
      {this.userQuestion,
      this.anamnesisResults,
      this.aiVetModel,
      this.viewModel,
      this.flow,
      this.toHandOver})
      : super._() {
    if (toHandOver == null) {
      throw new BuiltValueNullFieldError('TriageDiagnoseSuccess', 'toHandOver');
    }
  }

  @override
  TriageDiagnoseSuccess rebuild(
          void Function(TriageDiagnoseSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TriageDiagnoseSuccessBuilder toBuilder() =>
      new TriageDiagnoseSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TriageDiagnoseSuccess &&
        userQuestion == other.userQuestion &&
        anamnesisResults == other.anamnesisResults &&
        aiVetModel == other.aiVetModel &&
        viewModel == other.viewModel &&
        flow == other.flow &&
        toHandOver == other.toHandOver;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc(0, userQuestion.hashCode),
                        anamnesisResults.hashCode),
                    aiVetModel.hashCode),
                viewModel.hashCode),
            flow.hashCode),
        toHandOver.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TriageDiagnoseSuccess')
          ..add('userQuestion', userQuestion)
          ..add('anamnesisResults', anamnesisResults)
          ..add('aiVetModel', aiVetModel)
          ..add('viewModel', viewModel)
          ..add('flow', flow)
          ..add('toHandOver', toHandOver))
        .toString();
  }
}

class TriageDiagnoseSuccessBuilder
    implements Builder<TriageDiagnoseSuccess, TriageDiagnoseSuccessBuilder> {
  _$TriageDiagnoseSuccess _$v;

  String _userQuestion;
  String get userQuestion => _$this._userQuestion;
  set userQuestion(String userQuestion) => _$this._userQuestion = userQuestion;

  Anamnesis _anamnesisResults;
  Anamnesis get anamnesisResults => _$this._anamnesisResults;
  set anamnesisResults(Anamnesis anamnesisResults) =>
      _$this._anamnesisResults = anamnesisResults;

  AiVetModel _aiVetModel;
  AiVetModel get aiVetModel => _$this._aiVetModel;
  set aiVetModel(AiVetModel aiVetModel) => _$this._aiVetModel = aiVetModel;

  ChatViewModel _viewModel;
  ChatViewModel get viewModel => _$this._viewModel;
  set viewModel(ChatViewModel viewModel) => _$this._viewModel = viewModel;

  TriageFlow _flow;
  TriageFlow get flow => _$this._flow;
  set flow(TriageFlow flow) => _$this._flow = flow;

  bool _toHandOver;
  bool get toHandOver => _$this._toHandOver;
  set toHandOver(bool toHandOver) => _$this._toHandOver = toHandOver;

  TriageDiagnoseSuccessBuilder();

  TriageDiagnoseSuccessBuilder get _$this {
    if (_$v != null) {
      _userQuestion = _$v.userQuestion;
      _anamnesisResults = _$v.anamnesisResults;
      _aiVetModel = _$v.aiVetModel;
      _viewModel = _$v.viewModel;
      _flow = _$v.flow;
      _toHandOver = _$v.toHandOver;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TriageDiagnoseSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TriageDiagnoseSuccess;
  }

  @override
  void update(void Function(TriageDiagnoseSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TriageDiagnoseSuccess build() {
    final _$result = _$v ??
        new _$TriageDiagnoseSuccess._(
            userQuestion: userQuestion,
            anamnesisResults: anamnesisResults,
            aiVetModel: aiVetModel,
            viewModel: viewModel,
            flow: flow,
            toHandOver: toHandOver);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
