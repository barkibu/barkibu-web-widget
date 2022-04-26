// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_definition_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SymptomDefinitionState> _$symptomDefinitionStateSerializer =
    new _$SymptomDefinitionStateSerializer();

class _$SymptomDefinitionStateSerializer
    implements StructuredSerializer<SymptomDefinitionState> {
  @override
  final Iterable<Type> types = const [
    SymptomDefinitionState,
    _$SymptomDefinitionState
  ];
  @override
  final String wireName = 'SymptomDefinitionState';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SymptomDefinitionState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'symptom',
      serializers.serialize(object.symptom,
          specifiedType: const FullType(Symptom)),
      'unknownSymptoms',
      serializers.serialize(object.unknownSymptoms,
          specifiedType: const FullType(List, const [const FullType(String)])),
      'skipped',
      serializers.serialize(object.skipped,
          specifiedType: const FullType(bool)),
    ];
    if (object.symptomFound != null) {
      result
        ..add('symptomFound')
        ..add(serializers.serialize(object.symptomFound,
            specifiedType: const FullType(SymptomFound)));
    }
    if (object.pet != null) {
      result
        ..add('pet')
        ..add(serializers.serialize(object.pet,
            specifiedType: const FullType(Pet)));
    }
    if (object.viewModel != null) {
      result
        ..add('viewModel')
        ..add(serializers.serialize(object.viewModel,
            specifiedType: const FullType(ChatViewModel)));
    }
    if (object.symptomQuery != null) {
      result
        ..add('symptomQuery')
        ..add(serializers.serialize(object.symptomQuery,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SymptomDefinitionState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SymptomDefinitionStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'symptom':
          result.symptom = serializers.deserialize(value,
              specifiedType: const FullType(Symptom)) as Symptom;
          break;
        case 'symptomFound':
          result.symptomFound = serializers.deserialize(value,
              specifiedType: const FullType(SymptomFound)) as SymptomFound;
          break;
        case 'pet':
          result.pet = serializers.deserialize(value,
              specifiedType: const FullType(Pet)) as Pet;
          break;
        case 'viewModel':
          result.viewModel = serializers.deserialize(value,
              specifiedType: const FullType(ChatViewModel)) as ChatViewModel;
          break;
        case 'symptomQuery':
          result.symptomQuery = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'unknownSymptoms':
          result.unknownSymptoms = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(String)]))
              as List<String>;
          break;
        case 'skipped':
          result.skipped = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$SymptomDefinitionState extends SymptomDefinitionState {
  @override
  final Symptom symptom;
  @override
  final SymptomFound symptomFound;
  @override
  final Pet pet;
  @override
  final ChatViewModel viewModel;
  @override
  final String symptomQuery;
  @override
  final List<String> unknownSymptoms;
  @override
  final bool skipped;

  factory _$SymptomDefinitionState(
          [void Function(SymptomDefinitionStateBuilder) updates]) =>
      (new SymptomDefinitionStateBuilder()..update(updates)).build();

  _$SymptomDefinitionState._(
      {this.symptom,
      this.symptomFound,
      this.pet,
      this.viewModel,
      this.symptomQuery,
      this.unknownSymptoms,
      this.skipped})
      : super._() {
    if (symptom == null) {
      throw new BuiltValueNullFieldError('SymptomDefinitionState', 'symptom');
    }
    if (unknownSymptoms == null) {
      throw new BuiltValueNullFieldError(
          'SymptomDefinitionState', 'unknownSymptoms');
    }
    if (skipped == null) {
      throw new BuiltValueNullFieldError('SymptomDefinitionState', 'skipped');
    }
  }

  @override
  SymptomDefinitionState rebuild(
          void Function(SymptomDefinitionStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SymptomDefinitionStateBuilder toBuilder() =>
      new SymptomDefinitionStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SymptomDefinitionState &&
        symptom == other.symptom &&
        symptomFound == other.symptomFound &&
        pet == other.pet &&
        viewModel == other.viewModel &&
        symptomQuery == other.symptomQuery &&
        unknownSymptoms == other.unknownSymptoms &&
        skipped == other.skipped;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, symptom.hashCode), symptomFound.hashCode),
                        pet.hashCode),
                    viewModel.hashCode),
                symptomQuery.hashCode),
            unknownSymptoms.hashCode),
        skipped.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SymptomDefinitionState')
          ..add('symptom', symptom)
          ..add('symptomFound', symptomFound)
          ..add('pet', pet)
          ..add('viewModel', viewModel)
          ..add('symptomQuery', symptomQuery)
          ..add('unknownSymptoms', unknownSymptoms)
          ..add('skipped', skipped))
        .toString();
  }
}

class SymptomDefinitionStateBuilder
    implements Builder<SymptomDefinitionState, SymptomDefinitionStateBuilder> {
  _$SymptomDefinitionState _$v;

  Symptom _symptom;
  Symptom get symptom => _$this._symptom;
  set symptom(Symptom symptom) => _$this._symptom = symptom;

  SymptomFound _symptomFound;
  SymptomFound get symptomFound => _$this._symptomFound;
  set symptomFound(SymptomFound symptomFound) =>
      _$this._symptomFound = symptomFound;

  Pet _pet;
  Pet get pet => _$this._pet;
  set pet(Pet pet) => _$this._pet = pet;

  ChatViewModel _viewModel;
  ChatViewModel get viewModel => _$this._viewModel;
  set viewModel(ChatViewModel viewModel) => _$this._viewModel = viewModel;

  String _symptomQuery;
  String get symptomQuery => _$this._symptomQuery;
  set symptomQuery(String symptomQuery) => _$this._symptomQuery = symptomQuery;

  List<String> _unknownSymptoms;
  List<String> get unknownSymptoms => _$this._unknownSymptoms;
  set unknownSymptoms(List<String> unknownSymptoms) =>
      _$this._unknownSymptoms = unknownSymptoms;

  bool _skipped;
  bool get skipped => _$this._skipped;
  set skipped(bool skipped) => _$this._skipped = skipped;

  SymptomDefinitionStateBuilder() {
    SymptomDefinitionState._initializeBuilder(this);
  }

  SymptomDefinitionStateBuilder get _$this {
    if (_$v != null) {
      _symptom = _$v.symptom;
      _symptomFound = _$v.symptomFound;
      _pet = _$v.pet;
      _viewModel = _$v.viewModel;
      _symptomQuery = _$v.symptomQuery;
      _unknownSymptoms = _$v.unknownSymptoms;
      _skipped = _$v.skipped;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SymptomDefinitionState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SymptomDefinitionState;
  }

  @override
  void update(void Function(SymptomDefinitionStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SymptomDefinitionState build() {
    final _$result = _$v ??
        new _$SymptomDefinitionState._(
            symptom: symptom,
            symptomFound: symptomFound,
            pet: pet,
            viewModel: viewModel,
            symptomQuery: symptomQuery,
            unknownSymptoms: unknownSymptoms,
            skipped: skipped);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
