import 'package:common_barkibu_dart/models/aivet/aivet.dart';
import 'package:common_barkibu_dart/shared/chat/aivet_chat_title.dart';

abstract class PetHealthNextStepUseCase {
  Stream<AiVetAction> nextStep(AiVetModel model, PetHealthChatType type, {bool init = false});
}

class PetHealthNextStepUseCaseImpl implements PetHealthNextStepUseCase {
  @override
  Stream<AiVetAction> nextStep(AiVetModel model, PetHealthChatType type, {bool init = false}) {
    switch (type) {
      case PetHealthChatType.virtualVet:
        return _nextStepForVirtualVet(model, init: init);
      case PetHealthChatType.askAVet:
      default:
        return _nextStepForAskAVet(model, init: init);
    }
  }

  Stream<AiVetAction> _nextStepForVirtualVet(AiVetModel model, {bool init = false}) async* {
    if (init) {
      yield AiVetAction.init();
    }
    if (!model.triageCompleted) {
      yield AiVetAction.fullTriage();
    } else if (model.symptomDefinitionSkipped) {
      yield AiVetAction.talkToAVetChoice();
    } else {
      yield AiVetAction.showReport();
    }
  }

  Stream<AiVetAction> _nextStepForAskAVet(AiVetModel model, {bool init = false}) async* {
    if (init) {
      yield AiVetAction.init();
    }
    if (!model.triageCompleted) {
      yield AiVetAction.mainSymptomTriage();
    } else {
      yield AiVetAction.talkToAVetChoice();
    }
  }
}
