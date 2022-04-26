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

class ContactMessages {
	const ContactMessages();
	AskAVetEmailTemplateContactMessages get askAVetEmailTemplate => AskAVetEmailTemplateContactMessages(this);
	VirtualVetEmailTemplateContactMessages get virtualVetEmailTemplate => VirtualVetEmailTemplateContactMessages(this);
	InputsContactMessages get inputs => InputsContactMessages(this);
	ActionsContactMessages get actions => ActionsContactMessages(this);
	InfoContactMessages get info => InfoContactMessages(this);
	NutribotEmailTemplateContactMessages get nutribotEmailTemplate => NutribotEmailTemplateContactMessages(this);
}

class AskAVetEmailTemplateContactMessages {
	final ContactMessages _parent;
	const AskAVetEmailTemplateContactMessages(this._parent);
	String get outro => "Please add any additional info here:";
	String get intro => "Hi,";
	String petDefinition(String petSpecies, String petName, String petSex, String breed, String age, String neutered) => "My $petSpecies is $petName ($petSex)\nBreed: $breed\nAge: $age\nNeutered: $neutered";
	String symptoms(String symptomsPresent) => "Symptoms present:\n$symptomsPresent";
	String symptomsWithDurationAndFrequency(String symptomsPresent, String symptomDuration, String symptomFrequency) => "Symptoms present:\n$symptomsPresent (Duration: $symptomDuration Frequency: $symptomFrequency)";
	String get subject => "Question about my pet";
	String subjectWithInfo(String petSpecies, String petName) => "Question about my $petSpecies, $petName";
	String get subjectCopy => "Copy of your email to the vets";
}

class VirtualVetEmailTemplateContactMessages {
	final ContactMessages _parent;
	const VirtualVetEmailTemplateContactMessages(this._parent);
	String get subject => "Question about my pet";
	String symptoms(String symptomsPresent, String symptomsNotPresent) => "Symptoms present:\n$symptomsPresent\n\nSymptoms not present:\n$symptomsNotPresent";
	String conditions(String possibleConditions) => "Possible conditions:\n$possibleConditions";
	String get intro => "Hi there, I’m emailing about my pet to see if you can offer some advice and help.";
	String petDefinition(String petSpecies, String petName, String petSex, String breed, String age) => "My $petSpecies is $petName ($petSex)\nBreed: $breed\nAge: $age";
	String get outro => "Please add any additional info here:";
}

class InputsContactMessages {
	final ContactMessages _parent;
	const InputsContactMessages(this._parent);
	String get prefix => "Prefix";
	String get phone => "Phone";
}

class ActionsContactMessages {
	final ContactMessages _parent;
	const ActionsContactMessages(this._parent);
	String get sendEmail => "Send Email";
	String get writeMail => "Write your email below:";
	String get reply => "Our experts will reply to:";
	String get schedulePhoneCall => "Schedule Call";
}

class InfoContactMessages {
	final ContactMessages _parent;
	const InfoContactMessages(this._parent);
	String get success => "Your email has been sent ✅\n\nWe’ll be in touch soon";
	String get error => "Ouch! Looks like we’re having some issues to send your email 😭\n\nTry again later";
}

class NutribotEmailTemplateContactMessages {
	final ContactMessages _parent;
	const NutribotEmailTemplateContactMessages(this._parent);
	String get outro => "Please add any additional info here:";
	String foodSensitivies(String foodSensitivies) => "Food sensitivies:\n$foodSensitivies";
	String get subject => "Question about my pet";
	String get intro => "Hi there, I’m emailing about my pet to see if you can offer some advice and help.";
	String petDefinition(String petSpecies, String petName, String petSex) => "My $petSpecies is $petName ($petSex)";
}

