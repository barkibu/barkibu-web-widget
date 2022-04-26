// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'homeMessages.i18n.dart';

String get _languageCode => 'de';
String get _localeName => 'de';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class HomeMessages_de extends HomeMessages {
	const HomeMessages_de();
	MessagesHomeMessages_de get messages => MessagesHomeMessages_de(this);
	TermsOfServiceHomeMessages_de get termsOfService => TermsOfServiceHomeMessages_de(this);
	NavigationButtonsHomeMessages_de get navigationButtons => NavigationButtonsHomeMessages_de(this);
}

class MessagesHomeMessages_de extends MessagesHomeMessages {
	final HomeMessages_de _parent;
	const MessagesHomeMessages_de(this._parent):super(_parent);
	String get subtitle => "Ich bin Ihr persönlicher Tiergesundheitsassistent";
	String get profile => "Profil";
	String title(String name) => "Hallo $name,";
	String get startConcierge => "Start";
	String get virtualVetLearnMoreQuestion => "Was ist der virtuelle Tierarzt?";
	String appDownloadLinks(String appName, String iphoneLink, String androidLink) => "Sie können auch <b>$appName</b> für $iphoneLink und $androidLink herunterladen";
	String get symptomInputLabel => "Hauptsymptom";
	String get symptomInputHint => "Geben Sie hier das Hauptsymptom Ihres Haustieres ein";
	AskAVetMessagesHomeMessages_de get askAVet => AskAVetMessagesHomeMessages_de(this);
	String get logout => "Ausloggen";
	String hello(String name) => "Hallo $name";
	String get help => "Kann ich Ihrem Haustier bei irgendetwas helfen?";
	String get simpleTitle => "Hallo,";
	String virtualVetLearnMoreDescription(String brandName) => "Haben Sie eine Frage zur Gesundheit Ihres Haustieres? Geben Sie es hier ein und lassen Sie sich sofort von unserem virtuellen Tierarzt beraten, der eine erweiterte KI-Wissensbasis mit Symptomen und Zuständen verwendet, um die gewünschten Antworten zu erhalten. Wenn Sie möchten, können Sie mit einem unserer Tierärzte telefonisch, im Chat oder per E-Mail sprechen, nachdem Sie den virtuellen Tierarzt verwendet haben.";
	String get makeConsultation => "Starten Sie eine Bewertung";
	NutritionMessagesHomeMessages_de get nutrition => NutritionMessagesHomeMessages_de(this);
	FindClinicsMessagesHomeMessages_de get findClinics => FindClinicsMessagesHomeMessages_de(this);
	String get virtualVetLearnMoreTitle => "Virtueller Tierarzt";
}

class AskAVetMessagesHomeMessages_de extends AskAVetMessagesHomeMessages {
	final MessagesHomeMessages_de _parent;
	const AskAVetMessagesHomeMessages_de(this._parent):super(_parent);
	String get title => "Fragen Sie einen Tierarzt";
	String get subtitle => "Sprechen Sie mit einem lizenzierten Tierarzt per Telefon, Chat oder E-Mail";
}

class NutritionMessagesHomeMessages_de extends NutritionMessagesHomeMessages {
	final MessagesHomeMessages_de _parent;
	const NutritionMessagesHomeMessages_de(this._parent):super(_parent);
	String get subtitle => "Finden Sie Futteroptionen basierend auf Ihrem Haustier";
	String get title => "Lebensmittel- und Ernährungsfinder";
}

class FindClinicsMessagesHomeMessages_de extends FindClinicsMessagesHomeMessages {
	final MessagesHomeMessages_de _parent;
	const FindClinicsMessagesHomeMessages_de(this._parent):super(_parent);
	String get title => "Find A Clinic";
	String get subtitle => "Find the best clinic closest to you";
}

class TermsOfServiceHomeMessages_de extends TermsOfServiceHomeMessages {
	final HomeMessages_de _parent;
	const TermsOfServiceHomeMessages_de(this._parent):super(_parent);
	String get ctaText => "Sehen Sie unsere";
	String get termsOfService => "Nutzungsbedingungen";
}

class NavigationButtonsHomeMessages_de extends NavigationButtonsHomeMessages {
	final HomeMessages_de _parent;
	const NavigationButtonsHomeMessages_de(this._parent):super(_parent);
	String get homeButton => "Zuhause";
	String get calendarButton => "";
	String get myPetsButton => "Meine Haustiere";
}

