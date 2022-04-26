import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/pet_profile/pet_profile_event.dart';
import 'package:common_barkibu_dart/bloc/pet_profile/pet_profile_state.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/pet/create_pet_use_case.dart';
import 'package:common_barkibu_dart/domain/pet/delete_pet_use_case.dart';
import 'package:common_barkibu_dart/domain/pet/get_pets_use_case.dart';
import 'package:common_barkibu_dart/domain/pet/update_pet_use_case.dart';

export 'package:common_barkibu_dart/bloc/pet_profile/pet_profile_event.dart';
export 'package:common_barkibu_dart/bloc/pet_profile/pet_profile_state.dart';

class PetProfileBloc extends Bloc<PetProfileEvent, PetProfileState> {
  final GetPetsUseCase _getPetsUseCase;
  final CreatePetUseCase _createPetUseCase;
  final UpdatePetUseCase _updatePetUseCase;
  final DeletePetUseCase _deletePetUseCase;
  final AnalyticsService _analyticsService;
  final SetUserPropertiesUseCase _setUserPropertiesUseCase;

  PetProfileState currentState;

  PetProfileBloc(
    this._getPetsUseCase,
    this._createPetUseCase,
    this._updatePetUseCase,
    this._deletePetUseCase,
    this._analyticsService,
    this._setUserPropertiesUseCase,
  );

  @override
  PetProfileState get initialState => PetProfileInitial();

  @override
  Stream<PetProfileState> mapEventToState(PetProfileEvent event) async* {
    if (event is PetProfileStarted) {
      yield PetProfileLoadInProgress();
      if (event.petId != null) {
        final pet = await _getPetsUseCase.getPet(event.petId);
        yield PetProfileLoadSuccess((b) => b..pets = [pet]);
      } else {
        final pets = await _getPetsUseCase.getPets();
        yield PetProfileLoadSuccess((b) => b..pets = pets);
      }
    }

    if (event is PetProfilePetCreated) {
      yield PetProfilePetCreateInProgress((b) => b
        ..pets = state.pets
        ..pet = event.pet);
      final pet = await _createPetUseCase.createPet(event.pet);

      if (pet != null) {
        _analyticsService.event.aivet.logPetCreated(pet.species);
        yield PetProfilePetCreateSuccess((b) => b
          ..pets = (state.pets..add(pet))
          ..pet = pet);
        await _setUserPropertiesUseCase.setProperties();
      } else {
        yield PetProfilePetCreateFailure((b) => b
          ..pets = state.pets
          ..pet = event.pet);
      }
      yield PetProfileLoadSuccess((b) => b..pets = state.pets);
    }

    if (event is PetProfilePetUpdated) {
      yield PetProfilePetUpdateInProgress((b) => b
        ..pets = state.pets
        ..pet = event.pet);
      final updatePetRequest = await _updatePetUseCase.updatePet(event.pet);
      if (updatePetRequest) {
        yield PetProfilePetUpdateSuccess((b) => b
          ..pets = state.pets.replace(event.pet, (p) => p.id == event.pet.id)
          ..pet = event.pet);
        _analyticsService.event.myPets.logMyPetsPetEdit();
        await _setUserPropertiesUseCase.setProperties();
      } else {
        yield PetProfilePetUpdateFailure((b) => b
          ..pets = state.pets
          ..pet = event.pet);
      }
      yield PetProfileLoadSuccess((b) => b..pets = state.pets);
    }

    if (event is PetProfilePetDeleted) {
      yield PetProfilePetDeleteInProgress((b) => b
        ..pets = state.pets
        ..pet = event.pet);
      final deletePetRequest = await _deletePetUseCase.deletePet(event.pet.id);
      if (deletePetRequest) {
        yield PetProfilePetDeleteSuccess((b) => b..pets = (state.pets..removeWhere((p) => p.id == event.pet.id)));
        await _setUserPropertiesUseCase.setProperties();
      } else {
        yield PetProfilePetDeleteFailure((b) => b
          ..pets = state.pets
          ..pet = event.pet);
      }
    }
  }
}
