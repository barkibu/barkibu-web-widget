// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'contactMessages.i18n.dart';

String get _languageCode => 'de';
String get _localeName => 'de';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class ContactMessages_de extends ContactMessages {
	const ContactMessages_de();
	AskAVetEmailTemplateContactMessages_de get askAVetEmailTemplate => AskAVetEmailTemplateContactMessages_de(this);
	VirtualVetEmailTemplateContactMessages_de get virtualVetEmailTemplate => VirtualVetEmailTemplateContactMessages_de(this);
	InputsContactMessages_de get inputs => InputsContactMessages_de(this);
	ActionsContactMessages_de get actions => ActionsContactMessages_de(this);
	NutribotEmailTemplateContactMessages_de get nutribotEmailTemplate => NutribotEmailTemplateContactMessages_de(this);
}

class AskAVetEmailTemplateContactMessages_de extends AskAVetEmailTemplateContactMessages {
	final ContactMessages_de _parent;
	const AskAVetEmailTemplateContactMessages_de(this._parent):super(_parent);
	String get outro => "Ich freue mich darauf, von dir zu hören";
	String get intro => "Hallo, ich sende eine E-Mail über mein Haustier, um zu sehen, ob Sie Ratschläge und Hilfe anbieten können.";
	String petDefinition(String petSpecies, String petName, String petSex, String breed, String age, String neutered) => "Meine $petSpecies ist $petName ($petSex)\nZucht: $breed\nAlter: $age\nKastriert: $neutered";
	String symptoms(String symptomsPresent) => "Symptome vorhanden:\n$symptomsPresent";
	String symptomsWithDurationAndFrequency(String symptomsPresent, String symptomDuration, String symptomFrequency) => "Symptome vorhanden:\n$symptomsPresent";
	String get subject => "Frage zu meinem Haustier";
}

class VirtualVetEmailTemplateContactMessages_de extends VirtualVetEmailTemplateContactMessages {
	final ContactMessages_de _parent;
	const VirtualVetEmailTemplateContactMessages_de(this._parent):super(_parent);
	String get subject => "Frage zu meinem Haustier";
	String symptoms(String symptomsPresent, String symptomsNotPresent) => "Symptome vorhanden:\n$symptomsPresent\n\nSymptome nicht vorhanden:\n$symptomsNotPresent";
	String conditions(String possibleConditions) => "Mögliche Bedingungen:\n$possibleConditions";
	String get intro => "Hallo, ich sende eine E-Mail über mein Haustier, um zu sehen, ob Sie Ratschläge und Hilfe anbieten können.";
	String petDefinition(String petSpecies, String petName, String petSex, String breed, String age) => "Meine $petSpecies ist $petName ($petSex)\nZucht: $breed\nAlter: $age";
	String get outro => "Ich freue mich darauf, von dir zu hören";
}

class InputsContactMessages_de extends InputsContactMessages {
	final ContactMessages_de _parent;
	const InputsContactMessages_de(this._parent):super(_parent);
	String get prefix => "Präfix";
	String get phone => "Telefon";
}

class ActionsContactMessages_de extends ActionsContactMessages {
	final ContactMessages_de _parent;
	const ActionsContactMessages_de(this._parent):super(_parent);
	String get sendEmail => "E-Mail senden";
	String get schedulePhoneCall => "Anruf planen";
	String get writeMail => "Write your mail below:";
	String get reply => "Our experts will reply to:";
}

class NutribotEmailTemplateContactMessages_de extends NutribotEmailTemplateContactMessages {
	final ContactMessages_de _parent;
	const NutribotEmailTemplateContactMessages_de(this._parent):super(_parent);
	String get outro => "Ich freue mich darauf, von dir zu hören";
	String foodSensitivies(String foodSensitivies) => "Nahrungsmittelempfindlichkeiten:\n$foodSensitivies";
	String get subject => "Frage zu meinem Haustier";
	String get intro => "Hallo, ich sende eine E-Mail über mein Haustier, um zu sehen, ob Sie Ratschläge und Hilfe anbieten können.";
	String petDefinition(String petSpecies, String petName, String petSex) => "Meine $petSpecies ist $petName ($petSex)";
}

