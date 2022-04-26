import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_viewmodel.dart';

part 'pet_definition_state.g.dart';

abstract class PetDefinitionState implements Built<PetDefinitionState, PetDefinitionStateBuilder> {
  static Serializer<PetDefinitionState> get serializer => _$petDefinitionStateSerializer;

  @nullable
  Pet get pet;

  @nullable
  ChatViewModel get viewModel;

  PetDefinitionState._();
  factory PetDefinitionState([Function(PetDefinitionStateBuilder builder) updates]) = _$PetDefinitionState;
}
