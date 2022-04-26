import 'package:common_barkibu_dart/models/aivet.dart';
import 'package:common_barkibu_dart/models/consultation_options.dart';

abstract class TriageAction {
  factory TriageAction.patientDefinition() = PatientDefinition;

  factory TriageAction.mainSymptom() = MainSymptomTriageAction;

  factory TriageAction.otherSymptom() = OtherSymptomTriageAction;

  factory TriageAction.mainSymptomDuration(List<SymptomDuration> durations) = MainSymptomDurationTriageAction;

  factory TriageAction.symptomsSecondCycle(Anamnesis anamnesis) => SymptomsSecondCycleTriageAction(anamnesis);

  factory TriageAction.bindConsultationId(String consultationId) => BindConsultationIdTriageAction(consultationId);

  factory TriageAction.unexpectedError() = UnexpectedErrorTriageAction;

  factory TriageAction.finishTriage() = FinishTriageAction;
}

class PatientDefinition implements TriageAction {}

class MainSymptomTriageAction implements TriageAction {}

class OtherSymptomTriageAction implements TriageAction {}

class MainSymptomDurationTriageAction implements TriageAction {
  final List<SymptomDuration> durations;

  MainSymptomDurationTriageAction(this.durations);
}

class SymptomsSecondCycleTriageAction implements TriageAction {
  final Anamnesis anamnesis;

  SymptomsSecondCycleTriageAction(this.anamnesis);
}

class BindConsultationIdTriageAction implements TriageAction {
  final String consultationId;

  BindConsultationIdTriageAction(this.consultationId);
}

class UnexpectedErrorTriageAction implements TriageAction {}

class FinishTriageAction implements TriageAction {}
