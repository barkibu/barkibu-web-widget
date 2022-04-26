// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_definition_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PetDefinitionState> _$petDefinitionStateSerializer =
    new _$PetDefinitionStateSerializer();

class _$PetDefinitionStateSerializer
    implements StructuredSerializer<PetDefinitionState> {
  @override
  final Iterable<Type> types = const [PetDefinitionState, _$PetDefinitionState];
  @override
  final String wireName = 'PetDefinitionState';

  @override
  Iterable<Object> serialize(Serializers serializers, PetDefinitionState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
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
    return result;
  }

  @override
  PetDefinitionState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PetDefinitionStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'pet':
          result.pet = serializers.deserialize(value,
              specifiedType: const FullType(Pet)) as Pet;
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

class _$PetDefinitionState extends PetDefinitionState {
  @override
  final Pet pet;
  @override
  final ChatViewModel viewModel;

  factory _$PetDefinitionState(
          [void Function(PetDefinitionStateBuilder) updates]) =>
      (new PetDefinitionStateBuilder()..update(updates)).build();

  _$PetDefinitionState._({this.pet, this.viewModel}) : super._();

  @override
  PetDefinitionState rebuild(
          void Function(PetDefinitionStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PetDefinitionStateBuilder toBuilder() =>
      new PetDefinitionStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PetDefinitionState &&
        pet == other.pet &&
        viewModel == other.viewModel;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, pet.hashCode), viewModel.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PetDefinitionState')
          ..add('pet', pet)
          ..add('viewModel', viewModel))
        .toString();
  }
}

class PetDefinitionStateBuilder
    implements Builder<PetDefinitionState, PetDefinitionStateBuilder> {
  _$PetDefinitionState _$v;

  Pet _pet;
  Pet get pet => _$this._pet;
  set pet(Pet pet) => _$this._pet = pet;

  ChatViewModel _viewModel;
  ChatViewModel get viewModel => _$this._viewModel;
  set viewModel(ChatViewModel viewModel) => _$this._viewModel = viewModel;

  PetDefinitionStateBuilder();

  PetDefinitionStateBuilder get _$this {
    if (_$v != null) {
      _pet = _$v.pet;
      _viewModel = _$v.viewModel;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PetDefinitionState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PetDefinitionState;
  }

  @override
  void update(void Function(PetDefinitionStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PetDefinitionState build() {
    final _$result =
        _$v ?? new _$PetDefinitionState._(pet: pet, viewModel: viewModel);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
