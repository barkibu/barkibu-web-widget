import 'package:common_barkibu_dart/bloc/pet_health_chat/triage/triage_state.dart';

abstract class AiVetAction {
  factory AiVetAction.init() = InitAiVetAction;

  factory AiVetAction.talkToAVetChoice() = TalkToAVetChoiceAiVetAction;

  factory AiVetAction.fullTriage() = FullTriageAiVetAction;

  factory AiVetAction.mainSymptomTriage() = MainSymptomTriageAiVetAction;

  factory AiVetAction.showReport() = ShowReportAiVetAction;
}

class InitAiVetAction implements AiVetAction {}

class TalkToAVetChoiceAiVetAction implements AiVetAction {}

abstract class TriageInitAiVetAction implements AiVetAction {
  TriageFlow get triageFlow;
}

class FullTriageAiVetAction implements TriageInitAiVetAction {
  @override
  TriageFlow get triageFlow => TriageFlow.full;
}

class MainSymptomTriageAiVetAction implements TriageInitAiVetAction {
  @override
  TriageFlow get triageFlow => TriageFlow.mainSymptom;
}

class ShowReportAiVetAction implements AiVetAction {}

class UnexpectedErrorAiVetAction implements AiVetAction {}
