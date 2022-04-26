import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/bloc/chat/info_bloc.dart';
import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/pipes/pet_pipes.dart';
import 'package:web_widget/src/profile/pets/pet_form_component.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/spinner_overlay_component.dart';
import 'package:web_widget/src/symptom_info/has_info_screen.dart';
import 'package:web_widget/src/symptom_info/info_screen_component.dart';

PetProfileBloc petProfileBlocFactory() => ServiceLocator.container<PetProfileBloc>();

@Component(selector: 'pet-edit', templateUrl: 'pet_edit_component.html', styleUrls: [
  'pet_edit_component.css'
], directives: [
  coreDirectives,
  layoutDirectives,
  PetFormComponent,
  GoBackComponent,
  SpinnerOverlayComponent,
  WidgetButtonComponent,
  InfoScreenComponent,
], providers: [
  FactoryProvider(PetProfileBloc, petProfileBlocFactory),
  ClassProvider(InfoBloc),
], pipes: [
  PetTitlePipe
])
class PetEditComponent extends HasInfoScreen implements OnActivate, OnDestroy {
  final PetProfileBloc petProfileBloc;
  final MessagesModel messages;
  final Router router;
  int petId;
  bool loading = false;
  Pet pet;
  PetEditComponent(this.petProfileBloc, this.messages, this.router, InfoBloc infoBloc) {
    setInfoBloc(infoBloc);
    petProfileBloc.listen(petProfileBlocListener);
  }

  @ViewChild(PetFormComponent)
  PetFormComponent formComponent;

  @override
  void onActivate(_, RouterState current) async {
    petId = int.parse(current.parameters['id']);
    petProfileBloc.add(PetProfileStarted((b) => b.petId = petId));
  }

  @override
  void ngOnDestroy() {
    closeSymtomInfoBloc();
    petProfileBloc.close();
  }

  void onSaveClicked() {
    formComponent.onSubmit();
  }

  void onValidFormSubmitted(Pet pet) {
    petProfileBloc.add(PetProfilePetUpdated((b) => b.pet = pet));
  }

  void petProfileBlocListener(PetProfileState state) async {
    if (state is PetProfilePetUpdateSuccess) {
      await router.navigate(RoutePaths.myPets.toUrl());
    } else if (state is PetProfilePetUpdateInProgress) {
      loading = true;
    } else if (state is PetProfilePetUpdateFailure) {
      loading = false;
    } else if (state is PetProfileLoadSuccess) {
      pet = state.pets.first;
    }
  }

  String get petProfilePath {
    return RoutePaths.petProfile.toUrl(parameters: {'id': petId.toString()});
  }
}
