import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:web_widget/src/bloc/chat/info_bloc.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/profile/pets/pet_form_component.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/symptom_info/has_info_screen.dart';
import 'package:web_widget/src/symptom_info/info_screen_component.dart';

PetProfileBloc petProfileBlocFactory() => ServiceLocator.container<PetProfileBloc>();

@Component(selector: 'pet-create', templateUrl: 'pet_create_component.html', styleUrls: [
  'pet_create_component.css'
], directives: [
  coreDirectives,
  layoutDirectives,
  PetFormComponent,
  GoBackComponent,
  WidgetButtonComponent,
  InfoScreenComponent,
], providers: [
  FactoryProvider(PetProfileBloc, petProfileBlocFactory),
  ClassProvider(InfoBloc),
], exports: [
  RoutePaths
])
class PetCreateComponent extends HasInfoScreen implements OnDestroy {
  final PetProfileBloc petProfileBloc;
  final MessagesModel messages;
  final Router router;
  bool loading = false;
  Pet pet;

  @ViewChild(PetFormComponent)
  PetFormComponent formComponent;

  PetCreateComponent(this.petProfileBloc, this.messages, this.router, InfoBloc infoBloc) {
    pet = Pet();
    petProfileBloc.listen(petProfileBlocListener);
    setInfoBloc(infoBloc);
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
    petProfileBloc.add(PetProfilePetCreated((b) => b.pet = pet));
  }

  void petProfileBlocListener(PetProfileState state) async {
    if (state is PetProfilePetCreateSuccess) {
      await router.navigate(RoutePaths.myPets.toUrl());
    } else if (state is PetProfilePetCreateInProgress) {
      loading = true;
    } else if (state is PetProfilePetCreateFailure) {
      loading = false;
    }
  }
}
