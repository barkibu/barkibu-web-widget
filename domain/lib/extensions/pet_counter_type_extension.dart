import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:common_barkibu_dart/models/models.dart';

extension PetCounterTypeLabelized on PetCounterType {
  // ignore: missing_return
  String getLabel(MessagesModel messagesModel) {
    switch (this) {
      case PetCounterType.ASSESSMENT:
        return messagesModel.petProfileMessages.counters.assessments;
      case PetCounterType.VET_CONSULTATION:
        return messagesModel.petProfileMessages.counters.vet_consultations;
      case PetCounterType.CLAIM:
        return messagesModel.petProfileMessages.counters.claims;
    }
  }
}
