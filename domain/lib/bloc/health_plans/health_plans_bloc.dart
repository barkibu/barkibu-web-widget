import 'package:bloc/bloc.dart';
import 'package:common_barkibu_dart/domain/health_plans/get_health_plans_use_case.dart';
import 'package:common_barkibu_dart/models/health_plan.dart';
import 'package:common_barkibu_dart/services/analytics_service.dart';

import 'health_plans_event.dart';
import 'health_plans_state.dart';

class HealthPlansBloc extends Bloc<HealthPlansEvent, HealthPlansState> {
  final AnalyticsService _analyticsService;
  final GetHealthPlansUseCase _getHealthPlansUseCase;

  HealthPlansBloc(this._analyticsService, this._getHealthPlansUseCase);

  @override
  HealthPlansState get initialState {
    return HealthPlansLoadInProgress();
  }

  @override
  Stream<HealthPlansState> mapEventToState(HealthPlansEvent event) async* {
    if (event is HealthPlansRequested) {
      yield HealthPlansLoadInProgress();
      yield await _fetchPlans(event.petId);
    }

    if (event is HealthPlanViewRequested) {
      yield HealthPlansLoadInProgress();
      yield await _fetchPlan(event.healthPlanKey, event.petId);
    }

    if (event is BenefitsInformationRequested) {
      _analyticsService.event.plans.logBenefitsInformation(event.planName);
    }

    if (event is HealthPlansBarkibuInformationRequested) {
      _analyticsService.event.plans.logHealthPlansBarkibuInformation();
    }

    if (event is BuyHealthPlanRequested) {
      _analyticsService.event.plans.logBuyHealthPlan(event.planName);
    }

    if (event is FAQHealthPlanRequested) {
      _analyticsService.event.plans.logFaqHealthPlan(event.planName);
    }
  }

  Future<HealthPlansState> _fetchPlans(int petId) async {
    var plans = await _getHealthPlansUseCase.getHealthPlans(petId);
    if (plans.isEmpty) {
      return HealthPlansLoadFailure();
    } else {
      return HealthPlansLoadSuccess(plans);
    }
  }

  Future<HealthPlansState> _fetchPlan(String planKey, int petId) async {
    var plans = await _getHealthPlansUseCase.getHealthPlans(petId);
    var currentPlan = plans.firstWhere((HealthPlan plan) => plan.key == planKey, orElse: () => null);
    if (currentPlan == null || plans.isEmpty) {
      return HealthPlansLoadFailure();
    } else {
      return HealthPlanLoadSuccess(currentPlan, petId);
    }
  }
}
