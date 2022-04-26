import 'package:common_barkibu_dart/viewmodels/chat/chat_flow.dart';

abstract class PetHealthChatFlow extends ChatFlow {
  PetHealthChatFlow();

  factory PetHealthChatFlow.inputSymptom() = InputSymptomAIVetChatFlow;
  factory PetHealthChatFlow.confirmSymptom() = ConfirmSymptomAIVetChatFlow;
  factory PetHealthChatFlow.addMoreSymptoms() = AddMoreSymptomsAIVetChatFlow;
  factory PetHealthChatFlow.askSymptomDuration() = AskSymptomDurationAIVetChatFlow;
  factory PetHealthChatFlow.askSymptomDurationCycle() = AskSymptomDurationCycleAIVetChatFlow;
  factory PetHealthChatFlow.askSymptomFrequencyCycle() = AskSymptomFrequencyCycleAIVetChatFlow;
  factory PetHealthChatFlow.askNextQuestion() = AskNextQuestionAIVetChatFlow;
  factory PetHealthChatFlow.askFeedback() = AskFeedbackAIVetChatFlow;
}

class InputSymptomAIVetChatFlow extends PetHealthChatFlow {}

class InputOrSkipSymptomAIVetChatFlow extends PetHealthChatFlow {}

class ConfirmSymptomAIVetChatFlow extends PetHealthChatFlow {}

class AddMoreSymptomsAIVetChatFlow extends PetHealthChatFlow {}

class AskSymptomDurationAIVetChatFlow extends PetHealthChatFlow {}

class AskSymptomDurationCycleAIVetChatFlow extends PetHealthChatFlow {}

class AskSymptomFrequencyCycleAIVetChatFlow extends PetHealthChatFlow {}

class AskNextQuestionAIVetChatFlow extends PetHealthChatFlow {}

class AskFeedbackAIVetChatFlow extends PetHealthChatFlow {}
