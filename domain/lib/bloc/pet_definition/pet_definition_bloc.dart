import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/pet_definition/pet_definition.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/domain/domain.dart';
import 'package:common_barkibu_dart/models/models.dart';
import 'package:common_barkibu_dart/shared/chat/actions_chat.dart';
import 'package:pedantic/pedantic.dart';

class PetDefinitionBloc extends Bloc<PetDefinitionEvent, PetDefinitionState> {
  final PatientDefinitionNextStepUseCase _patientDefinitionNextStepUseCase;
  final CreatePetUseCase _createPetUseCase;
  final GetPetFeaturesUseCase _getPetFeaturesUseCase;
  final UpdatePetUseCase _updatePetUseCase;
  final AnalyticsService _analyticsService;
  final SetUserPropertiesUseCase _setUserPropertiesUseCase;

  ActionsChat actionsChat;
  PetDefinitionState currentState;

  final configuration = ServiceLocator.container<Configuration>();

  PetDefinitionBloc(
    this._patientDefinitionNextStepUseCase,
    this._createPetUseCase,
    this._getPetFeaturesUseCase,
    this._updatePetUseCase,
    this._analyticsService,
    this._setUserPropertiesUseCase,
  ) {
    actionsChat = ActionsChat<PetDefinitionChatFlow>();
  }

  @override
  PetDefinitionState get initialState => PetDefinitionState((b) => b..pet = Pet());

  @override
  Stream<PetDefinitionState> mapEventToState(PetDefinitionEvent event) async* {
    currentState = state;

    if (event is PetDefinitionStarted) {
      currentState = currentState.rebuild((builder) => builder..pet = event.pet);
      yield* _definePatient();
    }

    if (event is PetConfirmed) {
      yield _addChatViewModelToState(actionsChat.ownMessage(event.pet.name ?? _addPetTranslated));
      event.pet.features = await _getPetFeaturesUseCase.getFeatures(event.pet.id);
      if (event.pet.isValidForAiVet()) {
        add(PetDefinedAndPersisted((b) => b..pet = event.pet));
      } else {
        currentState = currentState.rebuild((b) => b..pet = event.pet);
        yield* _definePatient();
      }
    }

    if (event is PetDefinedAndPersisted) {
      yield currentState.rebuild((b) => b
        ..pet = event.pet
        ..viewModel = EmptyChatViewModel());
      unawaited(close());
    }

    if (event is PetNameConfirmed) {
      currentState = currentState.rebuild(
        (builder) => builder..pet.name = event.petName,
      );
      yield _addChatViewModelToState(actionsChat.ownMessage(event.petName));
      yield* _definePatient();
    }

    if (event is PetBreedConfirmed) {
      currentState = currentState.rebuild((builder) => builder
        ..pet.breed = event.petBreed
        ..pet.breedUuid = event.breedUuid
        ..pet.size = event.size);
      yield _addChatViewModelToState(actionsChat.ownMessage(event.petBreed));
      yield* _definePatient();
    }

    if (event is PetSpeciesConfirmed) {
      currentState = currentState.rebuild(
        (builder) => builder..pet.species = event.petSpecies,
      );
      yield _addChatViewModelToState(actionsChat
          .ownMessageType(event.petSpecies == 'dog' ? PetHealthChatMessageType.dog : PetHealthChatMessageType.cat));
      yield* _definePatient();
    }

    if (event is PetBirthdayConfirmed) {
      var yearsOld = Birthdate.getYearsOld(event.petBirthday);
      var monthOld = Birthdate.getMonthOld(event.petBirthday);
      _analyticsService.event.pets.logSelectsPetAge(event.petBirthday, 'AI Vet');
      currentState = currentState.rebuild((builder) => builder..pet.birthdate = event.petBirthday);
      if (configuration.petAgeSelectorEnabled) {
        yield _addChatViewModelToState(actionsChat.ownMessageType(PetHealthChatMessageType.age, data: {
          'years': yearsOld.toString(),
          'months': monthOld.toString(),
        }));
      } else {
        yield _addChatViewModelToState(actionsChat.ownMessageType(_mapBirthdateToAgeRange(event.petBirthday)));
      }
      yield* _definePatient();
    }

    if (event is PetSexConfirmed) {
      currentState = currentState.rebuild(
        (builder) => builder..pet.sex = event.petSex,
      );
      yield _addChatViewModelToState(actionsChat
          .ownMessageType(event.petSex == 'male' ? PetHealthChatMessageType.male : PetHealthChatMessageType.female));
      yield* _definePatient();
    }

    if (event is PetNeuteredConfirmed) {
      currentState = currentState.rebuild(
        (builder) => builder..pet.neutered = event.petNeutered,
      );
      yield _addChatViewModelToState(actionsChat
          .ownMessageType(event.petNeutered == true ? PetHealthChatMessageType.yes : PetHealthChatMessageType.no));
      yield* _definePatient();
    }
  }

  PetDefinitionState _addChatViewModelToState(ChatViewModel chatViewModel) {
    return currentState.rebuild((b) => b..viewModel = chatViewModel);
  }

  Stream<ChatViewModel> _mapActionToViewModel(AskPetDefinitionAction action) async* {
    if (action is AskPetNameAiVetAction) {
      yield* actionsChat.botMessageType(PetHealthChatMessageType.askPetName);
      yield actionsChat.textInputSimple(PetDefinitionChatFlow.inputPetName());
    } else if (action is AskPetSpeciesAiVetAction) {
      yield* actionsChat
          .botMessageType(PetHealthChatMessageType.selectSpecies, data: {'petName': currentState.pet.name});
      yield actionsChat.singleOptions(PetDefinitionChatFlow.selectSpecie(), _mapPetspeciesToViewModel());
    } else if (action is AskPetGenderAiVetAction) {
      yield* actionsChat.botMessageType(PetHealthChatMessageType.selectSex, data: {'petName': currentState.pet.name});
      yield actionsChat.singleOptions(PetDefinitionChatFlow.selectSex(), _mapPetsSexToViewModel());
    } else if (action is AskPetBirthdateAiVetAction) {
      if (configuration.petAgeSelectorEnabled) {
        yield* actionsChat.botMessageTypeWithHelp(
            type: PetHealthChatMessageType.selectAgeRange,
            data: {'petName': currentState.pet.name, 'species': currentState.pet.species});
        yield actionsChat.ageSelector(PetDefinitionChatFlow.selectAge());
      } else {
        yield* actionsChat
            .botMessageType(PetHealthChatMessageType.selectAgeRange, data: {'petName': currentState.pet.name});
        yield actionsChat.singleOptions(PetDefinitionChatFlow.selectAgeRange(), _mapPetAgeRangesToViewModel());
      }
    } else if (action is AskPetNeuteredAiVetAction) {
      yield* actionsChat.botMessageType(PetHealthChatMessageType.selectNeutered,
          data: {'petName': currentState.pet.name, 'sex': currentState.pet.sex});
      yield actionsChat.yesNo(PetDefinitionChatFlow.selectNeutered());
    } else if (action is AskPetBreedAiVetAction) {
      yield* actionsChat.botMessageType(PetHealthChatMessageType.askPetBreed);
      yield actionsChat.breedInput(PetDefinitionChatFlow.inputPetBreed(), data: {'species': currentState.pet.species});
    } else if (action is SelectPetAiVetAction) {
      yield* actionsChat.botMessageType(PetHealthChatMessageType.selectPet);
      yield actionsChat.singleOptions(PetDefinitionChatFlow.selectPet(), _mapPetsToViewModel(action.pets));
    } else if (action is StopPetDefinitionProcess) {
      final pet = await _createOrUpdatePet();
      await _setUserPropertiesUseCase.setProperties();
      _analyticsService.event.aivet.logPetCreated(pet.species);
      add(PetDefinedAndPersisted((b) => b..pet = pet));
    }
  }

  Future<Pet> _createOrUpdatePet() async {
    final pet = currentState.pet;
    if (pet.id != null) {
      await _updatePetUseCase.updatePet(pet);
      return pet;
    }
    return _createPetUseCase.createPet(pet);
  }

  List<OptionViewModel> _mapPetspeciesToViewModel() => List.of([
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..key = PetHealthChatMessageType.dog
          ..description = 'dog'),
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..key = PetHealthChatMessageType.cat
          ..description = 'cat'),
      ]);

  List<OptionViewModel> _mapPetsSexToViewModel() => List.of([
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..key = PetHealthChatMessageType.male
          ..description = 'male'),
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..key = PetHealthChatMessageType.female
          ..description = 'female'),
      ]);

  List<OptionViewModel> _mapPetsToViewModel(List<Pet> pets) {
    var optionsList = pets
        .map((pet) => OptionViewModel<Pet>((b) => b
          ..key = pet
          ..description = pet.name))
        .toList();

    if (configuration.addPetOptionEnabled) {
      optionsList.add(OptionViewModel<Pet>((b) => b
        ..key = Pet()
        ..description = _addPetTranslated));
    }

    return optionsList;
  }

  String get _addPetTranslated =>
      ServiceLocator.container<LocaleService>().messagesModel().chatMessages.botMessages.addPet;

  Stream<PetDefinitionState> _definePatient() async* {
    var action = await _patientDefinitionNextStepUseCase.nextStep(currentState.pet);
    yield* _addChatViewModelStream(_mapActionToViewModel(action));
  }

  Stream<PetDefinitionState> _addChatViewModelStream(Stream<ChatViewModel> chatViewModelStream) async* {
    await for (ChatViewModel chatViewModel in chatViewModelStream) {
      yield _addChatViewModelToState(chatViewModel);
    }
  }

  List<OptionViewModel> _mapPetAgeRangesToViewModel() => List.of([
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..key = PetHealthChatMessageType.junior
          ..description = '1-01-2020'),
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..key = PetHealthChatMessageType.young
          ..description = '1-01-2018'),
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..key = PetHealthChatMessageType.adult
          ..description = '1-01-2014'),
        OptionViewModel<PetHealthChatMessageType>((b) => b
          ..key = PetHealthChatMessageType.senior
          ..description = '1-01-2010'),
      ]);

  PetHealthChatMessageType _mapBirthdateToAgeRange(String birthdate) {
    switch (birthdate) {
      case '1-01-2020':
        return PetHealthChatMessageType.junior;
      case '1-01-2018':
        return PetHealthChatMessageType.young;
      case '1-01-2014':
        return PetHealthChatMessageType.adult;
      case '1-01-2010':
      default:
        return PetHealthChatMessageType.senior;
    }
  }
}
