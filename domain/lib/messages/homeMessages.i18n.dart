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

class HomeMessages {
	const HomeMessages();
	MessagesHomeMessages get messages => MessagesHomeMessages(this);
	TermsOfServiceHomeMessages get termsOfService => TermsOfServiceHomeMessages(this);
	NavigationButtonsHomeMessages get navigationButtons => NavigationButtonsHomeMessages(this);
}

class MessagesHomeMessages {
	final HomeMessages _parent;
	const MessagesHomeMessages(this._parent);
	String get subtitle => "I’m your personal Pet Health Assistant";
	String get profile => "Profile";
	String title(String name) => "Hi $name,";
	String get startConcierge => "Start";
	String get virtualVetLearnMoreQuestion => "What is the Virtual Vet?";
	String appDownloadLinks(String appName, String iphoneLink, String androidLink) => "You can also download <b>$appName</b> for $iphoneLink and $androidLink";
	String get symptomInputLabel => "Main symptom";
	String get symptomInputHint => "Type your pet’s main symptom here";
	AskAVetMessagesHomeMessages get askAVet => AskAVetMessagesHomeMessages(this);
	String get logout => "Log out";
	String hello(String name) => "Hi $name";
	String get help => "Is there anything I can help your pet with?";
	String get simpleTitle => "Hi,";
	String virtualVetLearnMoreDescription(String brandName) => "Have a question about your pet’s health? Type it here and get immediate guidance from our Virtual Vet, which uses an advanced AI knowledge base of symptoms and conditions to provide the answers you’re looking for.\n\nIf you’d like, you can speak with one of our veterinarians by phone, chat, or email after using the Virtual Vet.";
	String get makeConsultation => "Start an assessment";
	NutritionMessagesHomeMessages get nutrition => NutritionMessagesHomeMessages(this);
	FindClinicsMessagesHomeMessages get findClinics => FindClinicsMessagesHomeMessages(this);
	String get virtualVetLearnMoreTitle => "Virtual Vet";
}

class AskAVetMessagesHomeMessages {
	final MessagesHomeMessages _parent;
	const AskAVetMessagesHomeMessages(this._parent);
	String get title => "Ask A Vet";
	String get subtitle => "Speak with a licensed vet by phone, chat, or email";
}

class NutritionMessagesHomeMessages {
	final MessagesHomeMessages _parent;
	const NutritionMessagesHomeMessages(this._parent);
	String get subtitle => "Get food suggestions personalized to your pet";
	String get title => "Food and Nutrition Finder";
}

class FindClinicsMessagesHomeMessages {
	final MessagesHomeMessages _parent;
	const FindClinicsMessagesHomeMessages(this._parent);
	String get title => "Find A Clinic";
	String get subtitle => "Find the best clinic closest to you";
}

class TermsOfServiceHomeMessages {
	final HomeMessages _parent;
	const TermsOfServiceHomeMessages(this._parent);
	String get ctaText => "See our";
	String get termsOfService => "Terms of Service";
}

class NavigationButtonsHomeMessages {
	final HomeMessages _parent;
	const NavigationButtonsHomeMessages(this._parent);
	String get homeButton => "Home";
	String get calendarButton => "Vaccines";
	String get myPetsButton => "My Pets";
}

