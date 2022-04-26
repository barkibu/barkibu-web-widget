import 'package:bloc/bloc.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/chat/chat_control_events.dart';
import 'package:web_widget/src/widget_configuration.dart';
import 'package:web_widget/src/widget_window/parent_window_service.dart';

mixin PetDefinitionEventHandler {
  Router router;
  WidgetConfiguration config;
  ParentWindowService parentWindow;

  void handlePetDefinitionEvent(ChatControlEvent event, Bloc chatBloc) {
    if (event is SelectOptionConfirmed) {
      return _onOptionSelected(event, chatBloc);
    } else if (event is TextEntered) {
      return _onTextEntered(event, chatBloc);
    } else if (event is YesNoUnkownConfirmed) {
      return _onYesNoConfirmed(event, chatBloc);
    } else if (event is ChatAgeConfirmed) {
      return _onAgeConfirmed(event, chatBloc);
    } else if (event is ChatBreedConfirmed) {
      return _onBreedConfirmed(event, chatBloc);
    }
  }

  void _onOptionSelected(SelectOptionConfirmed event, Bloc chatBloc) {
    var flow = event.flow;
    if (flow is SelectPetPetDefinitionChatFlow) {
      if (config.externalPetDataEnabled && (event.selected.key as Pet).id == null) {
        parentWindow.notifyAddPetRequested(router.current.path, router.current.queryParameters);
      } else {
        chatBloc.add(PetConfirmed((b) => b..pet = event.selected.key));
      }
    } else if (flow is SelectSpeciesPetDefinitionChatFlow) {
      chatBloc.add(PetSpeciesConfirmed((b) => b..petSpecies = event.selected.description));
    } else if (flow is SelectSexPetDefinitionChatFlow) {
      chatBloc.add(PetSexConfirmed((b) => b..petSex = event.selected.description));
    } else if (flow is SelectAgeRangePetDefinitionChatFlow) {
      chatBloc.add(PetBirthdayConfirmed((b) => b..petBirthday = event.selected.description));
    }
  }

  void _onTextEntered(TextEntered event, Bloc chatBloc) {
    if (event.flow is InputPetNamePetDefinitionChatFlow) {
      chatBloc.add(PetNameConfirmed((b) => b..petName = event.text));
    }
  }

  void _onYesNoConfirmed(YesNoUnkownConfirmed event, Bloc chatBloc) {
    if (event.flow is SelectNeuteredPetDefinitionChatFlow) {
      chatBloc.add(PetNeuteredConfirmed((b) => b..petNeutered = event.answer));
    }
  }

  void _onAgeConfirmed(ChatAgeConfirmed event, Bloc chatBloc) {
    chatBloc.add(PetBirthdayConfirmed((b) => b..petBirthday = event.birthdate));
  }

  void _onBreedConfirmed(ChatBreedConfirmed event, Bloc chatBloc) {
    chatBloc.add(PetBreedConfirmed((b) => b
      ..petBreed = event.breed
      ..breedUuid = event.breedUuid
      ..size = event.size));
  }
}
