import 'package:common_barkibu_dart/bloc/health_plans/health_plans.dart';
import 'package:common_barkibu_dart/domain/health_plans/get_health_plans_use_case.dart';
import 'package:common_barkibu_dart/models/health_plan.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks/service_mocks.dart';

class MockGetHealthPlansUseCase extends Mock implements GetHealthPlansUseCase {}

void main() {
  MockAnalyticsService mockAnalyticsService;
  GetHealthPlansUseCase getHealthPlansUseCase;
  HealthPlansBloc healthPlansBloc;

  setUp(() {
    mockAnalyticsService = MockAnalyticsService();
    getHealthPlansUseCase = MockGetHealthPlansUseCase();
    healthPlansBloc = HealthPlansBloc(mockAnalyticsService, getHealthPlansUseCase);
  });

  tearDown(() async {
    await healthPlansBloc?.close();
  });

  group('HealthPlansBloc', () {
    test('HealthPlanViewRequested returns the requested health plan when retrieved plans include it', () async {
      var healthPlan = HealthPlan(key: 'health');
      when(getHealthPlansUseCase.getHealthPlans(any)).thenAnswer((_) => Future.value([healthPlan]));
      healthPlansBloc.add(HealthPlanViewRequested((b) => b
        ..petId = 0
        ..healthPlanKey = 'health'));
      await healthPlansBloc.close();
      verify(getHealthPlansUseCase.getHealthPlans(0));
      await expectLater(
          healthPlansBloc,
          emitsInOrder([
            allOf(
                isA<HealthPlanLoadSuccess>(), predicate((state) => state.petId == 0 && state.healthPlan == healthPlan)),
          ]));
    });

    test('HealthPlanViewRequested returns error when the retrieved plans don\'t include it', () async {
      var healthPlan = HealthPlan(key: 'health');
      when(getHealthPlansUseCase.getHealthPlans(any)).thenAnswer((_) => Future.value([healthPlan]));
      healthPlansBloc.add(HealthPlanViewRequested((b) => b
        ..petId = 0
        ..healthPlanKey = 'gl'));
      await healthPlansBloc.close();
      verify(getHealthPlansUseCase.getHealthPlans(0));
      await expectLater(
          healthPlansBloc,
          emitsInOrder([
            isA<HealthPlansLoadFailure>(),
          ]));
    });

    test('HealthPlansRequested retrieved health plans success', () async {
      when(getHealthPlansUseCase.getHealthPlans(any)).thenAnswer((_) => Future.value([HealthPlan()]));
      healthPlansBloc.add(HealthPlansRequested((b) => b.petId = 0));
      await healthPlansBloc.close();
      verify(getHealthPlansUseCase.getHealthPlans(0));
      await expectLater(
          healthPlansBloc,
          emitsInOrder([
            isA<HealthPlansLoadSuccess>(),
          ]));
    });

    test('HealthPlansRequested retrieved health plans error', () async {
      when(getHealthPlansUseCase.getHealthPlans(any)).thenAnswer((_) => Future.value([]));
      healthPlansBloc.add(HealthPlansRequested((b) => b.petId = 0));
      await healthPlansBloc.close();
      verify(getHealthPlansUseCase.getHealthPlans(0));
      await expectLater(
          healthPlansBloc,
          emitsInOrder([
            isA<HealthPlansLoadFailure>(),
          ]));
    });

    test('MoreInfoBenefitsRequested launches logBenefitsInformation on analytics', () async {
      healthPlansBloc.add(BenefitsInformationRequested((b) => b.planName = 'Plan Name'));
      await healthPlansBloc.close();
      verify(mockAnalyticsService.event.plans.logBenefitsInformation('Plan Name'));
    });

    test('HealthPlansBarkibuInformationRequested launches logHealthPlansBarkibuInformation on analytics', () async {
      healthPlansBloc.add(HealthPlansBarkibuInformationRequested());
      await healthPlansBloc.close();
      verify(mockAnalyticsService.event.plans.logHealthPlansBarkibuInformation());
    });

    test('BuyHealthPlanRequested launches logBuyHealthPlan on analytics', () async {
      healthPlansBloc.add(BuyHealthPlanRequested((b) => b.planName = 'Plan Name'));
      await healthPlansBloc.close();
      verify(mockAnalyticsService.event.plans.logBuyHealthPlan('Plan Name'));
    });

    test('BuyHealthPlanRequested launches logFaqHealthPlan on analytics', () async {
      healthPlansBloc.add(FAQHealthPlanRequested((b) => b.planName = 'Plan Name'));
      await healthPlansBloc.close();
      verify(mockAnalyticsService.event.plans.logFaqHealthPlan('Plan Name'));
    });
  });
}
