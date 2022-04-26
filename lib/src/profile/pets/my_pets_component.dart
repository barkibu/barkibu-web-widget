import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

import 'package:web_widget/src/widget_configuration.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/spinner_overlay_component.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/profile/pets/pet_card_component.dart';
import 'package:web_widget/src/icons/icon_component.dart';
import 'package:web_widget/src/widget_window/parent_window_service.dart';

PetProfileBloc petProfileBlocFactory() => ServiceLocator.container<PetProfileBloc>();

@Component(selector: 'my-pets', templateUrl: 'my_pets_component.html', styleUrls: [
  'my_pets_component.css'
], directives: [
  coreDirectives,
  GoBackComponent,
  SpinnerOverlayComponent,
  WidgetButtonComponent,
  PetCardComponent,
  IconComponent,
  layoutDirectives
], providers: [
  FactoryProvider(PetProfileBloc, petProfileBlocFactory)
], exports: [
  RoutePaths
])
class MyPetsComponent implements OnActivate, OnDestroy {
  final PetProfileBloc petProfileBloc;
  final MessagesModel messages;
  final WidgetConfiguration config;
  final ParentWindowService parentWindow;
  final Router router;
  final AnalyticsService _analyticsService;

  List<Pet> pets;
  StreamSubscription petProfileBlocSubscription;

  MyPetsComponent(
      this.petProfileBloc, this.messages, this.config, this.parentWindow, this.router, this._analyticsService);

  @override
  void onActivate(_, __) {
    _analyticsService.screen.logMyPets();
    petProfileBloc.add(PetProfileStarted());
    petProfileBlocSubscription = petProfileBloc.listen(blocListener);
  }

  @override
  void ngOnDestroy() async {
    await petProfileBlocSubscription?.cancel();
  }

  void blocListener(PetProfileState state) {
    if (state is PetProfileLoadSuccess) {
      pets = state.pets;
    }
  }

  bool arePetsLoaded() {
    return pets != null;
  }

  bool get externalPetDataEnabled => config.externalPetDataEnabled;
  bool get addPetOptionEnabled => config.addPetOptionEnabled;
  void notifyAddPetRequested() =>
      parentWindow.notifyAddPetRequested(router.current.path, router.current.queryParameters);
}
