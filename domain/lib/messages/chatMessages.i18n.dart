// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;

String get _languageCode => 'en';
String get _localeName => 'en';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class ChatMessages {
	const ChatMessages();
	BotMessagesChatMessages get botMessages => BotMessagesChatMessages(this);
	SymptomFrequencyChatMessages get symptomFrequency => SymptomFrequencyChatMessages(this);
	ChatWithVetChatMessages get chatWithVet => ChatWithVetChatMessages(this);
	HelperTextsChatMessages get helperTexts => HelperTextsChatMessages(this);
	String popupChatMessageSubtitle(String petName) => "You can find the report of this consultation at $petName's profile";
	SymptomDurationChatMessages get symptomDuration => SymptomDurationChatMessages(this);
	String get petNameInputHint => "Type your pet’s name here";
	String get petBreedInputHint => "Type your pet’s breed here";
	String get you => "You";
	String get knowMore => "Know more";
	String get symptomInputHint => "Type your pet’s main symptom here";
	String get popupChatMessageTitle => "Your report is ready!";
	String get openReport => "Open report";
	String get title => "New Assessment";
	String get chipSkipPrimarySymptom => "Skip: Connect me with a vet now instead";
	String get chatMessageInputHint => "Type your message here";
}

class BotMessagesChatMessages {
	final ChatMessages _parent;
	const BotMessagesChatMessages(this._parent);
	String get symptomDurationQuestion => "<b>How long</b> has this symptom been going on?";
	String get symptomConfirmation => "Is that correct?";
	String get anamnesisEmptyAnotherOption => "Or you can <b>answer the questions again</b> to help us get you the best advice. Adding more detail or rephrasing can sometimes help.";
	String askPetCastrated(String petName) => "Is <b>$petName</b> castrated?";
	String get addPet => "Add a pet";
	String askSymptomConfirmation(String petName) => "Ok. Is <b>$petName</b> experiencing any of these symptoms?";
	String urgentBody(String petName) => "Hmmm I’m a little concerned for $petName based on the symptoms you have highlighted. We recommend that you should get in touch with a vet as there may be some urgent issues that need to be looked at for $petName";
	String askSymptomQuestion(String petName) => "What is the <b>primary symptom</b> $petName is experiencing?";
	String addMoreSymptoms(String petName) => "Does $petName have any <b>other symptoms</b> you’d like to add?";
	String selectSex(String petName) => "Is $petName a <b>he</b> or <b>she</b>?";
	String selectAgeRange(String petName) => "How old is <b>$petName</b>?";
	String assessmentProfileReminder(String petName) => "Remember that you can always come back to $petName's profile to check the assessment report again";
	String get askPetBreed => "What is your pet’s <b>breed</b>?";
	String get symptomHasError => "There was an error trying to understand the symptom... Could you repeat it again?";
	String get assessmentReadyNoMoreQuestions => "We finished your consultation";
	String selectSpecies(String petName) => "Is $petName a <b>Dog</b> or a <b>Cat</b>?";
	String get initBot => "I’ll help you figure out what’s happening";
	String withRelatedSymptoms(String petName, String relatedSymptoms) => "$petName also has: <b>$relatedSymptoms</b>";
	String get changePhoneNumber => "Can you tell us what phone number should we get in touch with?";
	String get anamnesisEmptyProposal => "If you’d like, you can click to <b>speak with a Vet</b> now.";
	String get feedbackNotOk => "<b>Sorry to hear that.</b>";
	String get anamnesisResultCondition => "Got it! Below are some <b>possible issues</b> that match the symptoms you provided. Click on each of them to learn more and consider speaking with a vet.";
	String get assessmentFinished => "All done! I have put together a report that outlines possible causes for those symptoms";
	String get showResultsAction => "Learn more";
	String get urgent => "Immediate Vet Attention Recommended";
	String askOtherSymptomQuestion(String petName) => "What <b>other symptom</b> $petName has?";
	String get noPetsProfile => "Oh, before we start here, we need to add a Pet to your profile so we can know a bit about them to be able to help.\nGo <b>Add a Pet</b> to your account and then come back and we can continue.";
	String get anamnesisResultWarning => "Remember that <b>these results are not intended to replace professional veterinary advice, diagnosis or treatment.</b>";
	String get optionBackHomeTitle => "Go back home";
	String askSymptomStart(String petName) => "Let’s start the <b>symptoms checker</b>.";
	String get anamnesisEmptyUrgent => "Hmmm... I can't find the right advice. I'm not that intelligent yet, but I'm sure that some of the symptoms you introduced are potentially dangerous. You should get in touch with a vet as soon as possible.";
	String checkPhoneNumber(String phoneNumber) => "Alright, we will get in touch via Phone Call. Can you confirm that <b>$phoneNumber</b> is your current phone number?";
	String get selectPet => "Which <b>pet</b> would you like to talk about?";
	String get anamnesisResultSymptom => "Hmmm... I can't find the right advice. I'm not that intelligent yet, but here you have some useful information.";
	String get assessmentReady => "Got it";
	String anamnesisEmptyNotUrgent(String petName) => "I'm sorry, but I'm not sure about the issues $petName may have. I'm learning new things every day but, right now, my only advice based on what you shared is that you should probably contact a vet.";
	String get labelPhoneNumber => "Enter your mobile number";
	String get changePhoneNumberSuccess => "Okay, so let’s schedule a Phone Call.";
	String get optionPersonalRecommendationsTitle => "See your personalized recommendations";
	String get symptomIsEmpty => "Sorry, I don’t understand the symptom. Could you write it in another way?";
	String get changePhoneNumberError => "Sorry, we could not update your phone number.";
	String get assessmentAdvise => "Don't forget that this is <b>not a medical diagnosis</b>. If in doubt, it is always best to <b>seek advice from a veterinarian</b>";
	String get nextHelpQuestion => "What can I <b>help you</b> with next?";
	String get channelChoice => "OK, how would you like us to contact you?";
	String withoutRelatedSymptoms(String petName) => "$petName does <b>not</b> have other symptoms";
	String relatedSymptomsQuestion(String petName) => "Got it. Does $petName have <b>any of these symptoms too</b>?";
	String get assessmentReadyInProgress => "We are preparing the report of your consultation";
	String get optionTalkWithAVetTitle => "Talk with a vet";
	String get nextQuestionBackendIssue => "Sorry, we are having internal problems and cannot continue with the process. We’re aware of the problem and working hard to fix it. You can try it again after few minutes and check if the problem is solved.";
	String get feedbackOk => "<b>Great!</b> Come back any time you have a question about <b>your pet.</b>";
	String askPetSpayed(String petName) => "Is <b>$petName</b> spayed?";
	String symptomFound(String symptom) => "Got it. Symptom is <b>$symptom</b>";
	String get optionAskAnotherQuestionTitle => "Ask another question";
	String get symptomIncorrect => "Could you write it again?";
	String askSymptomQuestionWithSpecie(String species) => "Ok, can you type a word, a phrase or a question so I can understand the primary symptom your <b>$species</b> is having?";
	String get symptomFrequencyQuestion => "<b>How many times</b> has it been happening?";
	String get askPetName => "What is your pet’s <b>name</b>?";
	String get optionGoBackTitle => "Go back";
	String get askFeedback => "Has my answer been <b>helpful</b>?";
	String get emptyPhoneNumber => "Ok, it seems like we don’t have a Phone Number to get in touch with you. Enter your phone number so we can schedule a call.";
}

class SymptomFrequencyChatMessages {
	final ChatMessages _parent;
	const SymptomFrequencyChatMessages(this._parent);
	String get medium => "2 to 5 times per day";
	String get high => "6 or more times per day";
	String get low => "once or less per day";
}

class ChatWithVetChatMessages {
	final ChatMessages _parent;
	const ChatWithVetChatMessages(this._parent);
	VideoSharingChatWithVetChatMessages get videoSharing => VideoSharingChatWithVetChatMessages(this);
	RecoverChatChatWithVetChatMessages get recoverChat => RecoverChatChatWithVetChatMessages(this);
	String get letsConnectChat => "Ok, let’s <b>connect</b> you to a vet right now...";
	String vetChatTriagePet(String petName, String gender, String species, String breed, bool neutered, bool mixedBreed, String size) => "Pet name: $petName\nGender: $gender\nSpecie: $species\nBreed: $breed\nNeutered: $neutered\nMixed Breed: $mixedBreed\nSize: $size";
	String vetChatTriageSymptom(String mainSymptom, String duration) => "Main symptom: $mainSymptom\nDuration: $duration";
	String get positiveFeedback => "<b>Great!</b> Come back any time you have a question about <b>your pet.</b>";
	String vetChatTriageAllSymptoms(String mainSymptom, String duration, String relatedSymptoms, String possibleDiseases) => "Main symptom: $mainSymptom\nDuration: $duration\nRelated symptoms: $relatedSymptoms\nPossible diseases: $possibleDiseases";
	String get closedChat => "The Vet has <b>closed the chat.</b>";
	String letsConnectVideoOrPhone(String brandName, String channel) => "You’ll now be taken to $brandName’s appointment calendar to schedule your <b>$channel</b> call.";
	String vetChatTriageSpecies(String species) => "Species: $species";
	String get title => "Ask A Vet";
	String get petParentLeftChat => "The pet parent <b>is abstent.</b>";
	String get videoChatUnavailable => "Video Chat is currently unavailable 😱";
	String vetChatTriagePartner(String partner) => "Partner: $partner";
	String get errorConnectionToAVet => "Sorry, there was an <b>issue</b> connecting with a vet.";
	String get noVetsAvailable => "Sorry, we don’t have any <b>vets available</b> at this time. Their opening hours are Monday to Thursday from 9:00 to 16:00 hours and Friday from 9:00 to 14:00 without interruption. Within these hours, you can try to contact them again in a few minutes; you can also send them an email or schedule a phone call.";
	String videoIsNotAvailable(String brandName) => "Video chat is coming soon. Please choose another way to connect with the $brandName vets.";
	String get initVet => "We’ll connect you with a vet in a moment, but first we have a few quick questions to help our team give you the best guidance.";
	String get findingAVet => "Great. Wait a few seconds while <b>I find a vet.</b>";
	String vetJoined(String identity) => "You are connected with $identity from the Vet Team";
	String letsConnectEmail(String brandName) => "We’ll get the email started for you but please add as much info as you can to help the $brandName team give you the best guidance. Click <b>OK</b> to begin.";
	String get letsConnectVideoOrPhoneInformation => "After you’ve set your appointment, tap the \"Done\" or \"Back\" button to return to this screen.";
	String get negativeFeedback => "<b>Sorry to hear that.</b> Your feedback will help us improve.";
	String get askFeedback => "Was your chat with the vet helpful?";
	String get petParentLeftPermanently => "The pet parent definitely left the chat";
	String get connectedToAVet => "Ok, you are now <b>connected</b>.";
	String userIsTyping(String user) => "$user is typing";
}

class VideoSharingChatWithVetChatMessages {
	final ChatWithVetChatMessages _parent;
	const VideoSharingChatWithVetChatMessages(this._parent);
	String get closedByPetParent => "Pet Parent closed the video Stream Sharing";
	String get terminateSuccess => "Video chat is now off. Click Back to return to typing with the vet";
	String vetJoined(String vet) => "$vet joined the video consulting room";
	PermissionsVideoSharingChatWithVetChatMessages get permissions => PermissionsVideoSharingChatWithVetChatMessages(this);
	String get roomRequestSuccess => "Video Consulting room successfully created";
	String get callRequestSuccess => "Call established successfully";
	String get callRequestFailure => "The video connection has been declined";
	String get endCall => "End call";
	String get callRequestInProgress => "Connecting with the vet";
	String loading(String vet) => "Calling $vet";
	String get switchCamera => "Switch camera";
	String get startButton => "Start video stream sharing";
	String get roomRequestFailure => "Something unexpected happened while preparing the video consulting room 🤯. Please try again!";
	String get roomRequestInProgress => "Preparing a video consulting room";
	String get errorTitle => "Oops";
	String get streamSharingFailure => "Something went wrong while trying to share the video Stream, please try again";
}

class PermissionsVideoSharingChatWithVetChatMessages {
	final VideoSharingChatWithVetChatMessages _parent;
	const PermissionsVideoSharingChatWithVetChatMessages(this._parent);
	String get body => "This feature requires video capability turned on";
	String get warning => "The app might restart, you'll be able to continue chatting";
	String get title => "Video Sharing Feature";
}

class RecoverChatChatWithVetChatMessages {
	final ChatWithVetChatMessages _parent;
	const RecoverChatChatWithVetChatMessages(this._parent);
	String get yes => "Yes, continue";
	String get detail => "You were in the middle of a chat with a vet, do you want to continue ?";
	String get title => "Continue previous chat";
	String get no => "No";
}

class HelperTextsChatMessages {
	final ChatMessages _parent;
	const HelperTextsChatMessages(this._parent);
	String get doubleTapToSelect => "Double tap to select";
	String get petParentSays => "I say:";
	String botSays(String botName) => "$botName says:";
}

class SymptomDurationChatMessages {
	final ChatMessages _parent;
	const SymptomDurationChatMessages(this._parent);
	String get short => "less than 1 day";
	String get long => "4 days or more";
	String get medium => "1-3 days";
}

