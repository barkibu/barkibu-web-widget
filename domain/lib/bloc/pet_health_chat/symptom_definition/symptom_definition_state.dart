import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_viewmodel.dart';

part 'symptom_definition_state.g.dart';

abstract class SymptomDefinitionState implements Built<SymptomDefinitionState, SymptomDefinitionStateBuilder> {
  static Serializer<SymptomDefinitionState> get serializer => _$symptomDefinitionStateSerializer;

  /// The symptom object
  Symptom get symptom;

  /// The symptom definition (name, key and wheter duration and frequency are required)
  @nullable
  SymptomFound get symptomFound;

  /// Pet considered for the symptom search
  @nullable
  Pet get pet;

  /// ViewModel to add to the chat UI
  @nullable
  ChatViewModel get viewModel;

  /// Text that user entered in the symtom search input
  @nullable
  String get symptomQuery;

  /// List of queries that didn't produce any results(no symptoms were matched)
  List<String> get unknownSymptoms;

  /// Flag to indicate if symptom definition process was skipped
  bool get skipped;

  static void _initializeBuilder(SymptomDefinitionStateBuilder builder) => builder
    ..symptom = Symptom()
    ..unknownSymptoms = []
    ..skipped = false;

  SymptomDefinitionState._();
  factory SymptomDefinitionState([Function(SymptomDefinitionStateBuilder builder) updates]) = _$SymptomDefinitionState;
}
