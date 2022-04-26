import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/bloc/clinics_finder/clinics_finder_event.dart';
import 'package:common_barkibu_dart/bloc/clinics_finder/clinics_finder_state.dart';
import 'package:common_barkibu_dart/domain/clinic/get_clinics_use_case.dart';

export 'package:common_barkibu_dart/bloc/clinics_finder/clinics_finder_event.dart';
export 'package:common_barkibu_dart/bloc/clinics_finder/clinics_finder_state.dart';

class ClinicsFinderBloc extends Bloc<ClinicsFinderEvent, ClinicsFinderState> {
  final GetClinicsUseCase _getClinicsUseCase;

  ClinicsFinderState currentState = ClinicsFinderInitial();

  ClinicsFinderBloc(this._getClinicsUseCase);

  @override
  ClinicsFinderState get initialState => ClinicsFinderInitial();

  @override
  Stream<ClinicsFinderState> mapEventToState(ClinicsFinderEvent event) async* {
    if (event is ClinicsFinderPositionStarted) {
      if (event.latitude != null && event.longitude != null) {
        yield ClinicsFinderLoading((c) => c..geolocationAllowed = currentState.geolocationAllowed);
        final clinic = await _getClinicsUseCase.getClinicsByPosition(event.latitude, event.longitude);
        yield ClinicsFinderLoadedSuccess((c) => c..clinics = clinic);
      }
    }
    else if (event is ClinicsFinderAddressStarted) {
      if (event.address != null) {
        yield ClinicsFinderLoading((c) => c..geolocationAllowed = currentState.geolocationAllowed);
        final clinic = await _getClinicsUseCase.getClinicsByAddress(event.address);
        yield ClinicsFinderLoadedSuccess((c) => c
          ..clinics = clinic
          ..geolocationAllowed = currentState.geolocationAllowed);
      }
    } else if (event is ClinicsFinderGeolocationRefused) {
      yield ClinicsFinderInitial((c) => c..geolocationAllowed = false);
    }
    currentState = state;
  }
}
