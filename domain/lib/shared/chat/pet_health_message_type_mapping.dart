import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:common_barkibu_dart/viewmodels/viewmodels.dart';

class PetHealthMessageTypeMapping {
  static String getMessageByType(
    PetHealthChatMessageType type,
    MessagesModel _messagesModel, {
    Map<String, String> data,
  }) {
    switch (type) {
      case PetHealthChatMessageType.initBot:
        return _messagesModel.chatMessages.botMessages.initBot;
      case PetHealthChatMessageType.initVet:
        return _messagesModel.chatMessages.chatWithVet.initVet;
      case PetHealthChatMessageType.noPetsProfile:
        return _messagesModel.chatMessages.botMessages.noPetsProfile;
      case PetHealthChatMessageType.askPetName:
        return _messagesModel.chatMessages.botMessages.askPetName;
      case PetHealthChatMessageType.askPetBreed:
        return _messagesModel.chatMessages.botMessages.askPetBreed;
      case PetHealthChatMessageType.selectPet:
        return _messagesModel.chatMessages.botMessages.selectPet;
      case PetHealthChatMessageType.selectSpecies:
        return _messagesModel.chatMessages.botMessages.selectSpecies(data['petName']);
      case PetHealthChatMessageType.selectSex:
        return _messagesModel.chatMessages.botMessages.selectSex(data['petName']);
      case PetHealthChatMessageType.selectAgeRange:
        return _messagesModel.chatMessages.botMessages.selectAgeRange(data['petName']);
      case PetHealthChatMessageType.selectNeutered:
        return data['sex'] == 'male'
            ? _messagesModel.chatMessages.botMessages.askPetCastrated(data['petName'])
            : _messagesModel.chatMessages.botMessages.askPetSpayed(data['petName']);
      case PetHealthChatMessageType.askSymptomStart:
        return _messagesModel.chatMessages.botMessages.askSymptomStart(data['petName']);
      case PetHealthChatMessageType.askSymptomConfirmation:
        return _messagesModel.chatMessages.botMessages.askSymptomConfirmation(data['petName']);
      case PetHealthChatMessageType.askSymptomQuestion:
        return _messagesModel.chatMessages.botMessages.askSymptomQuestion(data['petName']);
      case PetHealthChatMessageType.askOtherSymptomQuestion:
        return _messagesModel.chatMessages.botMessages.askOtherSymptomQuestion(data['petName']);
      case PetHealthChatMessageType.askSymptomQuestionWithSpecies:
        return _messagesModel.chatMessages.botMessages.askSymptomQuestionWithSpecie(data['species']);
      case PetHealthChatMessageType.addMoreSymptoms:
        return _messagesModel.chatMessages.botMessages.addMoreSymptoms(data['petName']);
      case PetHealthChatMessageType.symptomIsEmpty:
        return _messagesModel.chatMessages.botMessages.symptomIsEmpty;
      case PetHealthChatMessageType.symptomHasError:
        return _messagesModel.chatMessages.botMessages.symptomHasError;
      case PetHealthChatMessageType.symptomIncorrect:
        return _messagesModel.chatMessages.botMessages.symptomIncorrect;
      case PetHealthChatMessageType.symptomFound:
        return _messagesModel.chatMessages.botMessages.symptomFound(data['symptom']);
      case PetHealthChatMessageType.symptomConfirmation:
        return _messagesModel.chatMessages.botMessages.symptomConfirmation;
      case PetHealthChatMessageType.askSymptomDuration:
        return _messagesModel.chatMessages.botMessages.symptomDurationQuestion;
      case PetHealthChatMessageType.askSymptomFrequency:
        return _messagesModel.chatMessages.botMessages.symptomFrequencyQuestion;
      case PetHealthChatMessageType.yes:
        return _messagesModel.sharedMessages.yes;
      case PetHealthChatMessageType.no:
        return _messagesModel.sharedMessages.no;
      case PetHealthChatMessageType.unknown:
        return _messagesModel.sharedMessages.unknown;
      case PetHealthChatMessageType.askFeedback:
        return _messagesModel.chatMessages.botMessages.askFeedback;
      case PetHealthChatMessageType.positiveFeedbackOption:
        return _messagesModel.sharedMessages.yes;
      case PetHealthChatMessageType.negativeFeedbackOption:
        return _messagesModel.sharedMessages.no;
      case PetHealthChatMessageType.helpNext:
        return _messagesModel.chatMessages.botMessages.nextHelpQuestion;
      case PetHealthChatMessageType.findingAVet:
        return _messagesModel.chatMessages.chatWithVet.findingAVet;
      case PetHealthChatMessageType.connectedToAVet:
        return _messagesModel.chatMessages.chatWithVet.connectedToAVet;
      case PetHealthChatMessageType.noAgentsAvailable:
        return _messagesModel.chatMessages.chatWithVet.noVetsAvailable;
      case PetHealthChatMessageType.errorConnectingToAVet:
        return _messagesModel.chatMessages.chatWithVet.errorConnectionToAVet;
      case PetHealthChatMessageType.videoIsNotAvailable:
        return _messagesModel.chatMessages.chatWithVet.videoIsNotAvailable(data['brandName']);
      case PetHealthChatMessageType.anamnesisResultCondition:
        return _messagesModel.chatMessages.botMessages.anamnesisResultCondition;
      case PetHealthChatMessageType.anamnesisResultSymptom:
        return _messagesModel.chatMessages.botMessages.anamnesisResultSymptom;
      case PetHealthChatMessageType.anamnesisResultWarning:
        return _messagesModel.chatMessages.botMessages.anamnesisResultWarning;
      case PetHealthChatMessageType.anamnesisEmptyUrgent:
        return _messagesModel.chatMessages.botMessages.anamnesisEmptyUrgent;
      case PetHealthChatMessageType.anamnesisEmptyNotUrgent:
        return _messagesModel.chatMessages.botMessages.anamnesisEmptyNotUrgent(data['petName']);
      case PetHealthChatMessageType.anamnesisEmptyProposal:
        return _messagesModel.chatMessages.botMessages.anamnesisEmptyProposal;
      case PetHealthChatMessageType.anamnesisEmptyAnotherOption:
        return _messagesModel.chatMessages.botMessages.anamnesisEmptyAnotherOption;
      case PetHealthChatMessageType.positiveFeedbackAnswer:
        return _messagesModel.chatMessages.botMessages.feedbackOk;
      case PetHealthChatMessageType.negativeFeedbackAnswer:
        return _messagesModel.chatMessages.botMessages.feedbackNotOk;
      case PetHealthChatMessageType.changePhoneNumberSuccess:
        return _messagesModel.chatMessages.botMessages.changePhoneNumberSuccess;
      case PetHealthChatMessageType.changePhoneNumberError:
        return _messagesModel.chatMessages.botMessages.changePhoneNumberError;
      case PetHealthChatMessageType.labelPhoneNumber:
        return _messagesModel.chatMessages.botMessages.labelPhoneNumber;
      case PetHealthChatMessageType.noThanks:
        return _messagesModel.sharedMessages.noThanks;
      case PetHealthChatMessageType.ok:
        return _messagesModel.sharedMessages.ok;
      case PetHealthChatMessageType.closedChat:
        return _messagesModel.chatMessages.chatWithVet.closedChat;
      case PetHealthChatMessageType.skipPrimarySymptom:
        return _messagesModel.chatMessages.chipSkipPrimarySymptom;
      case PetHealthChatMessageType.shortDuration:
        return _messagesModel.chatMessages.symptomDuration.short;
      case PetHealthChatMessageType.mediumDuration:
        return _messagesModel.chatMessages.symptomDuration.medium;
      case PetHealthChatMessageType.longDuration:
        return _messagesModel.chatMessages.symptomDuration.long;
      case PetHealthChatMessageType.lowFrequency:
        return _messagesModel.chatMessages.symptomFrequency.low;
      case PetHealthChatMessageType.mediumFrequency:
        return _messagesModel.chatMessages.symptomFrequency.medium;
      case PetHealthChatMessageType.highFrequency:
        return _messagesModel.chatMessages.symptomFrequency.high;
      case PetHealthChatMessageType.dog:
        return _messagesModel.sharedMessages.species.dog;
      case PetHealthChatMessageType.cat:
        return _messagesModel.sharedMessages.species.cat;
      case PetHealthChatMessageType.male:
        return _messagesModel.sharedMessages.sexOption.male;
      case PetHealthChatMessageType.female:
        return _messagesModel.sharedMessages.sexOption.female;
      case PetHealthChatMessageType.noneOfThese:
        return _messagesModel.sharedMessages.noneOfThese;
      case PetHealthChatMessageType.junior:
        return _messagesModel.sharedMessages.ageRange.junior;
      case PetHealthChatMessageType.young:
        return _messagesModel.sharedMessages.ageRange.young;
      case PetHealthChatMessageType.adult:
        return _messagesModel.sharedMessages.ageRange.adult;
      case PetHealthChatMessageType.senior:
        return _messagesModel.sharedMessages.ageRange.senior;
      case PetHealthChatMessageType.age:
        return _messagesModel.sharedMessages.fullAge(data['years'], data['months']);
      case PetHealthChatMessageType.unexpectedError:
        return _messagesModel.chatMessages.botMessages.nextQuestionBackendIssue;
      case PetHealthChatMessageType.assessmentFinished:
        return _messagesModel.chatMessages.botMessages.assessmentFinished;
      case PetHealthChatMessageType.assessmentAdvise:
        return _messagesModel.chatMessages.botMessages.assessmentAdvise;
      case PetHealthChatMessageType.assessmentReminder:
        return _messagesModel.chatMessages.botMessages.assessmentProfileReminder(data['petName']);
      case PetHealthChatMessageType.openReport:
        return _messagesModel.chatMessages.openReport;
      case PetHealthChatMessageType.assessmentReady:
        return _messagesModel.chatMessages.botMessages.assessmentReady;
      case PetHealthChatMessageType.assessmentReadyInProgress:
        return _messagesModel.chatMessages.botMessages.assessmentReadyInProgress;
      case PetHealthChatMessageType.assessmentReadyNoMoreQuestions:
        return _messagesModel.chatMessages.botMessages.assessmentReadyNoMoreQuestions;
      default:
        return '';
    }
  }

  static String getTitleByOptionType(
    ChatButtonOptionType type,
    MessagesModel _messagesModel,
  ) {
    switch (type) {
      case ChatButtonOptionType.askAnotherQuestion:
        return _messagesModel.chatMessages.botMessages.optionAskAnotherQuestionTitle;
      case ChatButtonOptionType.talkWithAVet:
        return _messagesModel.chatMessages.botMessages.optionTalkWithAVetTitle;
      case ChatButtonOptionType.personalRecommendations:
        return _messagesModel.chatMessages.botMessages.optionPersonalRecommendationsTitle;
      case ChatButtonOptionType.backHome:
        return _messagesModel.chatMessages.botMessages.optionBackHomeTitle;
      case ChatButtonOptionType.goBack:
        return _messagesModel.chatMessages.botMessages.optionGoBackTitle;
      case ChatButtonOptionType.openReport:
        return _messagesModel.chatMessages.openReport;
      case ChatButtonOptionType.schedulePhoneCall:
        return _messagesModel.contactMessages.actions.schedulePhoneCall;
      case ChatButtonOptionType.sendEmail:
        return _messagesModel.contactMessages.actions.sendEmail;
      case ChatButtonOptionType.noThanks:
        return _messagesModel.sharedMessages.noThanks;
        break;
    }
    return '';
  }

  static String getModalTitleByType(PetHealthChatMessageType type, MessagesModel _messagesModel,
      {Map<String, String> data}) {
    switch (type) {
      case PetHealthChatMessageType.selectAgeRange:
        return _messagesModel.petProfileMessages.ageEstimation.title(
          data['species'] == 'dog'
              ? _messagesModel.sharedMessages.species.dog.toLowerCase()
              : _messagesModel.sharedMessages.species.cat.toLowerCase(),
        );
      default:
        return '';
    }
  }

  static String getModalContentByType(PetHealthChatMessageType type, MessagesModel _messagesModel,
      {Map<String, String> data}) {
    switch (type) {
      case PetHealthChatMessageType.selectAgeRange:
        return data['species'];
      default:
        return '';
    }
  }
}
