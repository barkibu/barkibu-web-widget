import 'package:common_barkibu_dart/models/health_plan.dart';

abstract class HealthPlansState {}

class HealthPlansLoadInProgress extends HealthPlansState {}

class HealthPlansLoadSuccess extends HealthPlansState {
  final List<HealthPlan> healthPlans;

  HealthPlansLoadSuccess(this.healthPlans);
}

class HealthPlanLoadSuccess extends HealthPlansState {
  final HealthPlan healthPlan;
  final int petId;

  HealthPlanLoadSuccess(this.healthPlan, this.petId);
}

class HealthPlansLoadFailure extends HealthPlansState {}
