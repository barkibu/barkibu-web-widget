import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/models/pet.dart';

part 'pet_profile_state.g.dart';

abstract class PetProfileState {
  List<Pet> get pets;
}

abstract class PetProfileInitial implements Built<PetProfileInitial, PetProfileInitialBuilder>, PetProfileState {
  static void _initializeBuilder(PetProfileInitialBuilder builder) => builder..pets = [];
  PetProfileInitial._();
  factory PetProfileInitial([void Function(PetProfileInitialBuilder) updates]) = _$PetProfileInitial;
}

abstract class PetProfileLoadInProgress
    implements Built<PetProfileLoadInProgress, PetProfileLoadInProgressBuilder>, PetProfileState {
  static void _initializeBuilder(PetProfileLoadInProgressBuilder builder) => builder..pets = [];
  PetProfileLoadInProgress._();
  factory PetProfileLoadInProgress([void Function(PetProfileLoadInProgressBuilder) updates]) =
      _$PetProfileLoadInProgress;
}

abstract class PetProfileInitSuccess implements PetProfileState {}

abstract class PetProfileLoadSuccess
    implements Built<PetProfileLoadSuccess, PetProfileLoadSuccessBuilder>, PetProfileInitSuccess {
  static void _initializeBuilder(PetProfileLoadSuccessBuilder builder) => builder..pets = [];

  PetProfileLoadSuccess._();
  factory PetProfileLoadSuccess([void Function(PetProfileLoadSuccessBuilder) updates]) = _$PetProfileLoadSuccess;
}

abstract class PetProfilePetCreateInProgress
    implements Built<PetProfilePetCreateInProgress, PetProfilePetCreateInProgressBuilder>, PetProfileInitSuccess {
  Pet get pet;

  static void _initializeBuilder(PetProfilePetCreateInProgressBuilder builder) => builder..pets = [];
  PetProfilePetCreateInProgress._();
  factory PetProfilePetCreateInProgress([void Function(PetProfilePetCreateInProgressBuilder) updates]) =
      _$PetProfilePetCreateInProgress;
}

abstract class PetProfilePetUpdateInProgress
    implements Built<PetProfilePetUpdateInProgress, PetProfilePetUpdateInProgressBuilder>, PetProfileInitSuccess {
  Pet get pet;

  static void _initializeBuilder(PetProfilePetUpdateInProgressBuilder builder) => builder..pets = [];
  PetProfilePetUpdateInProgress._();
  factory PetProfilePetUpdateInProgress([void Function(PetProfilePetUpdateInProgressBuilder) updates]) =
      _$PetProfilePetUpdateInProgress;
}

abstract class PetProfilePetDeleteInProgress
    implements Built<PetProfilePetDeleteInProgress, PetProfilePetDeleteInProgressBuilder>, PetProfileInitSuccess {
  Pet get pet;

  static void _initializeBuilder(PetProfilePetDeleteInProgressBuilder builder) => builder..pets = [];
  PetProfilePetDeleteInProgress._();
  factory PetProfilePetDeleteInProgress([void Function(PetProfilePetDeleteInProgressBuilder) updates]) =
      _$PetProfilePetDeleteInProgress;
}

abstract class PetProfilePetUpdateFailure
    implements Built<PetProfilePetUpdateFailure, PetProfilePetUpdateFailureBuilder>, PetProfileInitSuccess {
  Pet get pet;

  static void _initializeBuilder(PetProfilePetUpdateFailureBuilder builder) => builder..pets = [];
  PetProfilePetUpdateFailure._();
  factory PetProfilePetUpdateFailure([void Function(PetProfilePetUpdateFailureBuilder) updates]) =
      _$PetProfilePetUpdateFailure;
}

abstract class PetProfilePetDeleteFailure
    implements Built<PetProfilePetDeleteFailure, PetProfilePetDeleteFailureBuilder>, PetProfileInitSuccess {
  Pet get pet;

  static void _initializeBuilder(PetProfilePetDeleteFailureBuilder builder) => builder..pets = [];
  PetProfilePetDeleteFailure._();
  factory PetProfilePetDeleteFailure([void Function(PetProfilePetDeleteFailureBuilder) updates]) =
      _$PetProfilePetDeleteFailure;
}

abstract class PetProfilePetCreateFailure
    implements Built<PetProfilePetCreateFailure, PetProfilePetCreateFailureBuilder>, PetProfileInitSuccess {
  Pet get pet;

  static void _initializeBuilder(PetProfilePetCreateFailureBuilder builder) => builder..pets = [];
  PetProfilePetCreateFailure._();
  factory PetProfilePetCreateFailure([void Function(PetProfilePetCreateFailureBuilder) updates]) =
      _$PetProfilePetCreateFailure;
}

abstract class PetProfilePetUpdateSuccess
    implements Built<PetProfilePetUpdateSuccess, PetProfilePetUpdateSuccessBuilder>, PetProfileInitSuccess {
  Pet get pet;

  static void _initializeBuilder(PetProfilePetUpdateSuccessBuilder builder) => builder..pets = [];
  PetProfilePetUpdateSuccess._();
  factory PetProfilePetUpdateSuccess([void Function(PetProfilePetUpdateSuccessBuilder) updates]) =
      _$PetProfilePetUpdateSuccess;
}

abstract class PetProfilePetCreateSuccess
    implements Built<PetProfilePetCreateSuccess, PetProfilePetCreateSuccessBuilder>, PetProfileInitSuccess {
  Pet get pet;

  static void _initializeBuilder(PetProfilePetCreateSuccessBuilder builder) => builder..pets = [];
  PetProfilePetCreateSuccess._();
  factory PetProfilePetCreateSuccess([void Function(PetProfilePetCreateSuccessBuilder) updates]) =
      _$PetProfilePetCreateSuccess;
}

abstract class PetProfilePetDeleteSuccess
    implements Built<PetProfilePetDeleteSuccess, PetProfilePetDeleteSuccessBuilder>, PetProfileInitSuccess {
  static void _initializeBuilder(PetProfilePetDeleteSuccessBuilder builder) => builder..pets = [];
  PetProfilePetDeleteSuccess._();
  factory PetProfilePetDeleteSuccess([void Function(PetProfilePetDeleteSuccessBuilder) updates]) =
      _$PetProfilePetDeleteSuccess;
}
