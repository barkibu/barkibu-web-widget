import 'package:common_barkibu_dart/messages/chatMessages.i18n.dart';

class ChatMessages_tsc extends ChatMessages {
  const ChatMessages_tsc();

  @override
  String get title => 'Virtual Vet';

  @override
  BotMessagesChatMessages get botMessages => BotMessagesChatMessages_tsc(this);

  @override
  ChatWithVetChatMessages get chatWithVet => ChatWithVetChatMessages_tsc(this);
}

class BotMessagesChatMessages_tsc extends BotMessagesChatMessages {
  const BotMessagesChatMessages_tsc(ChatMessages_tsc _parent) : super(_parent);

  @override
  String get initBot =>
      'Welcome to the Virtual Vet.\n\nIf this is an emergency, please go to your local vet hospital or clinic right away.';

  @override
  String get addPet => 'Add A Dog Or Cat';

  @override
  String get anamnesisResultWarning =>
      'Remember these results are not intended to replace professional veterinary advice, diagnosis, or treatment.';

  @override
  String askSymptomQuestion(String petName) => 'What is the <b>main symptom</b> $petName is experiencing?';

  @override
  String get emptyPhoneNumber =>
      "It looks like we don't have your phone number. Please type in your number so we can schedule your call with a vet.";

  @override
  String get channelChoice => 'How would you prefer to speak with the VETINSIGHT™ team?';

  @override
  String askPetCastrated(String petName) => 'Is <b>$petName</b> neutered?';

  @override
  String get assessmentFinished =>
      "Ok, got it. Based on what you've shared, we've created a report to show you possible causes and what you can do.";

  @override
  String get assessmentAdvise =>
      "Remember, this is not a medical diagnosis. It's always best to seek advice from a veterinarian.";

  @override
  String askSymptomQuestionWithSpecie(String species) =>
      'Ok, can you type a word, a phrase or a question so we can understand the primary symptom your <b>$species</b> is having?';

  @override
  String urgentBody(String petName) =>
      'Hmmm we are a little concerned for $petName based on the symptoms you have highlighted. We recommend that you should get in touch with a vet as there may be some urgent issues that need to be looked at for $petName';
}

class ChatWithVetChatMessages_tsc extends ChatWithVetChatMessages {
  const ChatWithVetChatMessages_tsc(ChatMessages_tsc _parent) : super(_parent);

  @override
  String letsConnectVideoOrPhone(String brandName, String channel) =>
      "Great, thanks. \nYou'll now be taken to the veterinarians' appointment calendar so you can choose the date and time you want to speak with them.";

  @override
  VideoSharingChatWithVetChatMessages get videoSharing => VideoSharingChatWithVetChatMessages_tsc(this);

  @override
  String get noVetsAvailable => """
  Sorry, there aren't any veterinarians available for chat at the moment.
  Would you like to send an <b>email</b> or schedule a <b>phone</b> call?
  1. Tap the back arrow above
  2. Choose "Talk with a vet"
  3. Select "Email" or "Phone Call"
  The veterinary team is available 7 days per week.
  From 9AM to 10PM Eastern.
  """;

  @override
  String letsConnectEmail(String brandName) =>
      "We'll get the email started for you but please add as much info as you can to help the vets give you the best guidance. Click OK to begin.";
}

class VideoSharingChatWithVetChatMessages_tsc extends VideoSharingChatWithVetChatMessages {
  VideoSharingChatWithVetChatMessages_tsc(ChatWithVetChatMessages parent) : super(parent);

  @override
  String get endCall => 'Turn off camera';
}
