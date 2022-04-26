import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/widget_configuration.dart';
import 'package:web_widget/src/profile/pets/pet_history_component.dart';
import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/layout/pet_title_component.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/spinner_overlay_component.dart';
import 'package:web_widget/src/icons/icon_component.dart';

PetProfileBloc petProfileBlocFactory() => ServiceLocator.container<PetProfileBloc>();

@Component(
  selector: 'pet-profile',
  templateUrl: 'pet_profile_component.html',
  styleUrls: ['pet_profile_component.css'],
  directives: [
    coreDirectives,
    layoutDirectives,
    routerDirectives,
    GoBackComponent,
    SpinnerOverlayComponent,
    WidgetButtonComponent,
    IconComponent,
    PetHistoryComponent,
    PetTitleComponent
  ],
  providers: [
    FactoryProvider(PetProfileBloc, petProfileBlocFactory),
  ],
  exports: [RoutePaths],
)
class PetProfileComponent implements OnActivate, OnDestroy {
  final PetProfileBloc petProfileBloc;
  final MessagesModel messages;
  final Router router;
  final WidgetConfiguration config;
  final AnalyticsService _analyticsService;
  Pet pet;
  int assessmentCount;

  PetProfileComponent(
    this.petProfileBloc,
    this.messages,
    this.router,
    this.config,
    this._analyticsService,
  ) {
    petProfileBloc.listen(petProfileBlocListener);
  }

  @override
  void onActivate(_, RouterState current) async {
    _analyticsService.screen.logPetProfile();
    final id = int.parse(current.parameters['id']);
    petProfileBloc.add(PetProfileStarted((b) => b.petId = id));
  }

  @override
  void ngOnDestroy() {
    petProfileBloc.close();
  }

  void petProfileBlocListener(PetProfileState state) async {
    if (state is PetProfileLoadSuccess) {
      pet = state.pets.first;
    }
  }

  String get petEditPath {
    return RoutePaths.petEdit.toUrl(parameters: {'id': pet.id.toString()});
  }

  bool get externalPetDataEnabled => config.externalPetDataEnabled;
}
