// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'onBoardingMessages.i18n.dart';

String get _languageCode => 'de';
String get _localeName => 'de';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class OnBoardingMessages_de extends OnBoardingMessages {
	const OnBoardingMessages_de();
	PreventionOnBoardingMessages_de get prevention => PreventionOnBoardingMessages_de(this);
	SuccessOnBoardingMessages_de get success => SuccessOnBoardingMessages_de(this);
	PetCreationOnBoardingMessages_de get petCreation => PetCreationOnBoardingMessages_de(this);
	HealthStatusOnBoardingMessages_de get healthStatus => HealthStatusOnBoardingMessages_de(this);
	AppUsageOnBoardingMessages_de get appUsage => AppUsageOnBoardingMessages_de(this);
	String get almost => "Fast dort!";
}

class PreventionOnBoardingMessages_de extends PreventionOnBoardingMessages {
	final OnBoardingMessages_de _parent;
	const PreventionOnBoardingMessages_de(this._parent):super(_parent);
	String get notExact => "";
	String get before => "";
	String rabies(String petName) => "";
	String multivalent(String petName) => "";
	String get date => "";
	String de_worming(String petName) => "";
	String get never => "";
}

class SuccessOnBoardingMessages_de extends SuccessOnBoardingMessages {
	final OnBoardingMessages_de _parent;
	const SuccessOnBoardingMessages_de(this._parent):super(_parent);
	String creatingProfile(String petName) => "";
	String get assessments => "";
}

class PetCreationOnBoardingMessages_de extends PetCreationOnBoardingMessages {
	final OnBoardingMessages_de _parent;
	const PetCreationOnBoardingMessages_de(this._parent):super(_parent);
	String get selectBreedTitle => "Wählen Sie die Rasse Ihres Haustieres";
	String get intro => "Willkommen in Barkibu. Wir erstellen ein Profil für Ihr Haustier. Wenn Sie mehr als eine haben, können Sie diese später hinzufügen.";
	String get searchBreed => "Rassen suchen";
	String neuteredQuestion(String petName) => "Ist $petName kastriert?";
	String get selectBreed => "Rasse auswählen";
	String get ageHint => "Wie schätze ich das Alter meines Haustieres?";
	String sexQuestion(String petName) => "Welches Geschlecht hat $petName?";
	String get nameQuestion => "Wie ist dein Kosename?";
	String get nameHint => "Name";
	String ageQuestion(String petName) => "Wie alt ist $petName?";
	String breedQuestion(String petName) => "Welche Rasse ist $petName?";
	String get ageQuestionHint => "Geburtsdatum";
	String speciesQuestion(String petName) => "Ist $petName ein Hund oder eine Katze?";
}

class HealthStatusOnBoardingMessages_de extends HealthStatusOnBoardingMessages {
	final OnBoardingMessages_de _parent;
	const HealthStatusOnBoardingMessages_de(this._parent):super(_parent);
	String get yes => "Mein Haustier ist in guter Verfassung";
	String get no => "Jetzt ist mein Haustier nicht von seiner besten Seite";
	String question(String petName) => "";
}

class AppUsageOnBoardingMessages_de extends AppUsageOnBoardingMessages {
	final OnBoardingMessages_de _parent;
	const AppUsageOnBoardingMessages_de(this._parent):super(_parent);
	String get finance => "Sparen Sie gesundheitsbezogene Ausgaben";
	String get question => "Was brauchen Sie von einem Online-Tierarzt?";
	String get prevention => "Verhindern Sie Krankheiten für mein Haustier";
	String get vetOnDemand => "Sprechen Sie mit einem Tierarzt, wann immer ich muss";
}

