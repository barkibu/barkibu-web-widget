import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/bloc/clinics_finder/clinics_finder_bloc.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/clinics/clinic_card_component.dart';
import 'package:web_widget/src/icons/icon_component.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/auth_guard.dart';
import 'package:web_widget/src/navigation/spinner_overlay_component.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/profile/snackbar_component.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/widget_configuration.dart';

ClinicsFinderBloc clinicsFinderBlocFactory() => ServiceLocator.container<ClinicsFinderBloc>();

@Component(
  selector: 'clinics_finder',
  templateUrl: 'clinics_finder_component.html',
  styleUrls: ['clinics_finder_component.css'],
  directives: [
    coreDirectives,
    formDirectives,
    GoBackComponent,
    SpinnerOverlayComponent,
    WidgetButtonComponent,
    SnackbarComponent,
    ClinicCardComponent,
    IconComponent,
    layoutDirectives,
  ],
  providers: [
    FactoryProvider(ClinicsFinderBloc, clinicsFinderBlocFactory),
  ],
  exports: [RoutePaths],
  pipes: [BlocPipe],
)
class ClinicsFinderComponent extends AuthGuard implements OnActivate, OnDestroy {
  final ClinicsFinderBloc clinicsFinderBloc;
  final WidgetConfiguration _configuration;
  final MessagesModel messages;
  @override
  final Router router;

  String stateErrorMessage;
  String get errorMessage => stateErrorMessage?.capitalize();
  final AnalyticsService _analyticsService;

  ClinicsFinderComponent(
    this.clinicsFinderBloc,
    this._configuration,
    this.messages,
    this.router,
    this._analyticsService,
      AuthBloc authBloc,
  ) : super(authBloc, router) {
    state = clinicsFinderBloc.initialState;
    clinicsFinderBloc.listen(clinicsBlocListener);
  }
  bool get findAClinicAddressApiEnabled => _configuration.findAClinicAddressApiEnabled;
  ClinicsFinderState state;
  String searchAddress = '';

  @override
  void ngOnDestroy() {
    clinicsFinderBloc.close();
  }

  @override
  void onActivate(RouterState previous, RouterState current) {
    getCurrentGeoposition();
  }

  bool get areClinicsLoaded => state is ClinicsFinderLoadedSuccess;
  bool get isSearchingClinics => state is ClinicsFinderLoading;

  void getCurrentGeoposition() {
    window.navigator.geolocation
        .getCurrentPosition()
        .then((value) => {
              clinicsFinderBloc.add(ClinicsFinderPositionStarted((c) => c
                ..latitude = value.coords.latitude.toString()
                ..longitude = value.coords.longitude.toString()))
            })
        .catchError((error) => {clinicsFinderBloc.add(ClinicsFinderGeolocationRefused())});
  }

  void getClinicsFromAddress() {
    clinicsFinderBloc.add(ClinicsFinderAddressStarted((c) => c.address = searchAddress));
  }

  void clinicsBlocListener(ClinicsFinderState newState) {
    state = newState;
  }
}
