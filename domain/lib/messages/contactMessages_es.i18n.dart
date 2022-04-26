// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'contactMessages.i18n.dart';

String get _languageCode => 'es';
String get _localeName => 'es';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class ContactMessages_es extends ContactMessages {
	const ContactMessages_es();
	AskAVetEmailTemplateContactMessages_es get askAVetEmailTemplate => AskAVetEmailTemplateContactMessages_es(this);
	VirtualVetEmailTemplateContactMessages_es get virtualVetEmailTemplate => VirtualVetEmailTemplateContactMessages_es(this);
	InputsContactMessages_es get inputs => InputsContactMessages_es(this);
	ActionsContactMessages_es get actions => ActionsContactMessages_es(this);
	InfoContactMessages_es get info => InfoContactMessages_es(this);
	NutribotEmailTemplateContactMessages_es get nutribotEmailTemplate => NutribotEmailTemplateContactMessages_es(this);
}

class AskAVetEmailTemplateContactMessages_es extends AskAVetEmailTemplateContactMessages {
	final ContactMessages_es _parent;
	const AskAVetEmailTemplateContactMessages_es(this._parent):super(_parent);
	String get outro => "Espero recibir noticias tuyas pronto";
	String get intro => "Hola, escribo este email para ver si podrías ofrecerme consejo y ayuda sobre mi mascota";
	String petDefinition(String petSpecies, String petName, String petSex, String breed, String age, String neutered) => "Mi $petSpecies es $petName ($petSex)\nRaza: $breed\nEdad: $age\nCastrado: $neutered";
	String symptoms(String symptomsPresent) => "Síntomas que presenta:\n$symptomsPresent";
	String symptomsWithDurationAndFrequency(String symptomsPresent, String symptomDuration, String symptomFrequency) => "Síntomas que presenta:\n$symptomsPresent (Duración: $symptomDuration Frecuencia: $symptomFrequency)";
	String get subject => "Consulta sobre mi mascota";
	String subjectWithInfo(String petSpecies, String petName) => "Consulta sobre mi $petSpecies, $petName";
	String get subjectCopy => "Copia de tu email a nuestros veterinarios";
}

class VirtualVetEmailTemplateContactMessages_es extends VirtualVetEmailTemplateContactMessages {
	final ContactMessages_es _parent;
	const VirtualVetEmailTemplateContactMessages_es(this._parent):super(_parent);
	String get subject => "Consulta sobre mi mascota";
	String symptoms(String symptomsPresent, String symptomsNotPresent) => "Síntomas presentes:\n$symptomsPresent\n\nSíntomas no presentes:\n$symptomsNotPresent";
	String conditions(String possibleConditions) => "Posibles condiciones:\n$possibleConditions";
	String get intro => "Hola, escribo este email para ver si podrías ofrecerme consejo y ayuda sobre mi mascota";
	String petDefinition(String petSpecies, String petName, String petSex, String breed, String age) => "Mi $petSpecies es $petName ($petSex)\nRaza: $breed\nEdad: $age";
	String get outro => "Espero recibir noticias tuyas pronto";
}

class InputsContactMessages_es extends InputsContactMessages {
	final ContactMessages_es _parent;
	const InputsContactMessages_es(this._parent):super(_parent);
	String get prefix => "Prefijo";
	String get phone => "Teléfono";
}

class ActionsContactMessages_es extends ActionsContactMessages {
	final ContactMessages_es _parent;
	const ActionsContactMessages_es(this._parent):super(_parent);
	String get sendEmail => "Enviar email";
	String get schedulePhoneCall => "Programar llamada";
	String get writeMail => "Escribe tu email debajo:";
	String get reply => "Nuestros expertos responderan a:";
}

class InfoContactMessages_es extends InfoContactMessages {
	final ContactMessages_es _parent;
	const InfoContactMessages_es(this._parent):super(_parent);
	String get success => "Tu email se ha enviado correctamente✅\n\nNos pondremos en contacto pronto";
	String get error => "Ouch! Parece que estamos teniendo algunos problemas para enviar tu email 😭\n\nIntentalo mas tarde";
}

class NutribotEmailTemplateContactMessages_es extends NutribotEmailTemplateContactMessages {
	final ContactMessages_es _parent;
	const NutribotEmailTemplateContactMessages_es(this._parent):super(_parent);
	String get outro => "Espero recibir noticias tuyas pronto";
	String foodSensitivies(String foodSensitivies) => "Sensibilidad alimentaria:\n$foodSensitivies";
	String get subject => "Consulta sobre mi mascota";
	String get intro => "Hola, escribo este email para ver si podrías ofrecerme consejo y ayuda sobre mi mascota";
	String petDefinition(String petSpecies, String petName, String petSex) => "Mi $petSpecies es $petName ($petSex)";
}

