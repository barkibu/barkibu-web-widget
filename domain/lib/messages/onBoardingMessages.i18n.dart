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

class OnBoardingMessages {
	const OnBoardingMessages();
	PreventionOnBoardingMessages get prevention => PreventionOnBoardingMessages(this);
	SuccessOnBoardingMessages get success => SuccessOnBoardingMessages(this);
	PetCreationOnBoardingMessages get petCreation => PetCreationOnBoardingMessages(this);
	HealthStatusOnBoardingMessages get healthStatus => HealthStatusOnBoardingMessages(this);
	AppUsageOnBoardingMessages get appUsage => AppUsageOnBoardingMessages(this);
	String get almost => "Almost there!";
}

class PreventionOnBoardingMessages {
	final OnBoardingMessages _parent;
	const PreventionOnBoardingMessages(this._parent);
	String get notExact => "You don't need to know the exact date";
	String get before => "Before";
	String rabies(String petName) => "When did you last vaccinate $petName against rabies?";
	String multivalent(String petName) => "When did you give $petName the annual booster?";
	String get date => "Select date";
	String de_worming(String petName) => "When did you last give $petName internal deworming?";
	String get never => "Never";
}

class SuccessOnBoardingMessages {
	final OnBoardingMessages _parent;
	const SuccessOnBoardingMessages(this._parent);
	String creatingProfile(String petName) => "We are preparing the  Veterinary Profile of $petName";
	String get assessments => "Veterinary consultations";
}

class PetCreationOnBoardingMessages {
	final OnBoardingMessages _parent;
	const PetCreationOnBoardingMessages(this._parent);
	String get selectBreedTitle => "Select your pet's breed";
	String get intro => "Welcome to Barkibu. We are going to create a profile for your pet. If you have more than one, you can add them later on.";
	String get searchBreed => "Search breeds";
	String neuteredQuestion(String petName) => "Has $petName been spayed/neutered?";
	String get selectBreed => "Select breed";
	String get ageHint => "How to estimate my pet's age";
	String sexQuestion(String petName) => "What sex is $petName?";
	String get nameQuestion => "What's your pet name?";
	String get nameHint => "Name";
	String ageQuestion(String petName) => "How old is $petName?";
	String breedQuestion(String petName) => "What breed is $petName?";
	String get ageQuestionHint => "Date of birth";
	String speciesQuestion(String petName) => "Is $petName a dog or a cat?";
}

class HealthStatusOnBoardingMessages {
	final OnBoardingMessages _parent;
	const HealthStatusOnBoardingMessages(this._parent);
	String get yes => "My pet is in good shape";
	String get no => "Now my pet isn't at its best";
	String question(String petName) => "Is your pet in good health?";
}

class AppUsageOnBoardingMessages {
	final OnBoardingMessages _parent;
	const AppUsageOnBoardingMessages(this._parent);
	String get finance => "Save health related spendings";
	String get question => "What do you need from an online vet?";
	String get prevention => "Prevent disease to my pet";
	String get vetOnDemand => "Speak with a vet whenever I need to";
}

