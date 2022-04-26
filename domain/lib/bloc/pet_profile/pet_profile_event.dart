import 'package:built_value/built_value.dart';
import 'package:common_barkibu_dart/models/pet.dart';

part 'pet_profile_event.g.dart';

abstract class PetProfileEvent {
  const PetProfileEvent();
}

abstract class PetProfileStarted implements Built<PetProfileStarted, PetProfileStartedBuilder>, PetProfileEvent {
  @nullable
  int get petId;

  PetProfileStarted._();
  factory PetProfileStarted([void Function(PetProfileStartedBuilder) updates]) = _$PetProfileStarted;
}

abstract class PetProfilePetUpdated
    implements Built<PetProfilePetUpdated, PetProfilePetUpdatedBuilder>, PetProfileEvent {
  Pet get pet;

  PetProfilePetUpdated._();
  factory PetProfilePetUpdated([void Function(PetProfilePetUpdatedBuilder) updates]) = _$PetProfilePetUpdated;
}

abstract class PetProfilePetCreated
    implements Built<PetProfilePetCreated, PetProfilePetCreatedBuilder>, PetProfileEvent {
  Pet get pet;

  PetProfilePetCreated._();
  factory PetProfilePetCreated([void Function(PetProfilePetCreatedBuilder) updates]) = _$PetProfilePetCreated;
}

abstract class PetProfilePetDeleted
    implements Built<PetProfilePetDeleted, PetProfilePetDeletedBuilder>, PetProfileEvent {
  Pet get pet;

  PetProfilePetDeleted._();
  factory PetProfilePetDeleted([void Function(PetProfilePetDeletedBuilder) updates]) = _$PetProfilePetDeleted;
}
