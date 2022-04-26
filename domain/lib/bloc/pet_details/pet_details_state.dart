import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:common_barkibu_dart/models/models.dart';

part 'pet_details_state.g.dart';

abstract class PetDetailsState {}

class PetDetailsInitial extends PetDetailsState {}

abstract class PetDetailsLoadInProgress
    implements Built<PetDetailsLoadInProgress, PetDetailsLoadInProgressBuilder>, PetDetailsState {
  static Serializer<PetDetailsLoadInProgress> get serializer => _$petDetailsLoadInProgressSerializer;

  int get petId;
  List<PetCounter> get counters;

  static void _initializeBuilder(PetDetailsLoadInProgressBuilder builder) =>
      builder..counters = PetCounterType.values.map<PetCounter>((t) => PetCounter(type: t)).toList();

  PetDetailsLoadInProgress._();
  factory PetDetailsLoadInProgress([Function(PetDetailsLoadInProgressBuilder builder) updates]) =
      _$PetDetailsLoadInProgress;
}

abstract class PetDetailsLoadSuccess
    implements Built<PetDetailsLoadSuccess, PetDetailsLoadSuccessBuilder>, PetDetailsState {
  static Serializer<PetDetailsLoadSuccess> get serializer => _$petDetailsLoadSuccessSerializer;

  int get petId;
  List<PetCounter> get counters;

  PetDetailsLoadSuccess._();
  factory PetDetailsLoadSuccess([Function(PetDetailsLoadSuccessBuilder builder) updates]) = _$PetDetailsLoadSuccess;
}
