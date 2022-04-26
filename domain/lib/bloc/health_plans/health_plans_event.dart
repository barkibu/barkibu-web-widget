import 'package:built_value/built_value.dart';

part 'health_plans_event.g.dart';

abstract class HealthPlansEvent {
  const HealthPlansEvent();
}

abstract class HealthPlansRequested extends HealthPlansEvent
    implements Built<HealthPlansRequested, HealthPlansRequestedBuilder> {
  int get petId;

  HealthPlansRequested._();
  factory HealthPlansRequested([void Function(HealthPlansRequestedBuilder) updates]) = _$HealthPlansRequested;
}

abstract class HealthPlanViewRequested extends HealthPlansEvent
    implements Built<HealthPlanViewRequested, HealthPlanViewRequestedBuilder> {
  String get healthPlanKey;
  int get petId;

  HealthPlanViewRequested._();
  factory HealthPlanViewRequested([void Function(HealthPlanViewRequestedBuilder) updates]) = _$HealthPlanViewRequested;
}

abstract class BenefitsInformationRequested extends HealthPlansEvent
    implements Built<BenefitsInformationRequested, BenefitsInformationRequestedBuilder> {
  String get planName;

  BenefitsInformationRequested._();

  factory BenefitsInformationRequested([void Function(BenefitsInformationRequestedBuilder) updates]) =
      _$BenefitsInformationRequested;
}

abstract class HealthPlansBarkibuInformationRequested extends HealthPlansEvent
    implements Built<HealthPlansBarkibuInformationRequested, HealthPlansBarkibuInformationRequestedBuilder> {
  HealthPlansBarkibuInformationRequested._();

  factory HealthPlansBarkibuInformationRequested(
          [void Function(HealthPlansBarkibuInformationRequestedBuilder) updates]) =
      _$HealthPlansBarkibuInformationRequested;
}

abstract class BuyHealthPlanRequested extends HealthPlansEvent
    implements Built<BuyHealthPlanRequested, BuyHealthPlanRequestedBuilder> {
  String get planName;

  BuyHealthPlanRequested._();

  factory BuyHealthPlanRequested([void Function(BuyHealthPlanRequestedBuilder) updates]) = _$BuyHealthPlanRequested;
}

abstract class FAQHealthPlanRequested extends HealthPlansEvent
    implements Built<FAQHealthPlanRequested, FAQHealthPlanRequestedBuilder> {
  String get planName;

  FAQHealthPlanRequested._();

  factory FAQHealthPlanRequested([void Function(FAQHealthPlanRequestedBuilder) updates]) = _$FAQHealthPlanRequested;
}
