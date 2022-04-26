import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:common_barkibu_dart/models/interaction.dart';

part 'pet_interactions_state.g.dart';

abstract class PetInteractionsState {
  List<Interaction> get interactions;
  @nullable
  int get petId;
}

class PetInteractionsInitial extends PetInteractionsState {
  @override
  List<Interaction> get interactions => const [];

  @override
  int get petId => null;
}

abstract class PetInteractionsLoadInProgress
    implements Built<PetInteractionsLoadInProgress, PetInteractionsLoadInProgressBuilder>, PetInteractionsState {
  static Serializer<PetInteractionsLoadInProgress> get serializer => _$petInteractionsLoadInProgressSerializer;

  static void _initializeBuilder(PetInteractionsLoadInProgressBuilder builder) => builder..interactions = const [];

  PetInteractionsLoadInProgress._();
  factory PetInteractionsLoadInProgress([Function(PetInteractionsLoadInProgressBuilder builder) updates]) =
      _$PetInteractionsLoadInProgress;
}

abstract class PetInteractionsLoadSuccess
    implements Built<PetInteractionsLoadSuccess, PetInteractionsLoadSuccessBuilder>, PetInteractionsState {
  static Serializer<PetInteractionsLoadSuccess> get serializer => _$petInteractionsLoadSuccessSerializer;

  PetInteractionsLoadSuccess._();
  factory PetInteractionsLoadSuccess([Function(PetInteractionsLoadSuccessBuilder builder) updates]) =
      _$PetInteractionsLoadSuccess;
}
