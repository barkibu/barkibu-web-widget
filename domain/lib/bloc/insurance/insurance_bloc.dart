import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';

import 'insurance_event.dart';
import 'insurance_state.dart';

class InsuranceBloc extends Bloc<InsuranceEvent, InsuranceState> {
  final AnalyticsService _analyticsService;

  InsuranceBloc(this._analyticsService);

  @override
  InsuranceState get initialState {
    return InsuranceState();
  }

  @override
  Stream<InsuranceState> mapEventToState(InsuranceEvent event) async* {
    if (event is InsuranceViewRequested) {
      _analyticsService.event.insurance.logInsuranceView();
    }

    if (event is InsuranceQuoteRequested) {
      _analyticsService.event.insurance.logInsuranceQuote();
    }

    if (event is InsuranceClaimRequested) {
      _analyticsService.event.insurance.logInsuranceClaim();
    }

    if (event is InsuranceBarkibuInformationRequested) {
      _analyticsService.event.insurance.logInsuranceBarkibuInformation();
    }
  }
}
