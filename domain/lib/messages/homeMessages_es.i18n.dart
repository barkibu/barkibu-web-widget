// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'homeMessages.i18n.dart';

String get _languageCode => 'es';
String get _localeName => 'es';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class HomeMessages_es extends HomeMessages {
	const HomeMessages_es();
	MessagesHomeMessages_es get messages => MessagesHomeMessages_es(this);
	TermsOfServiceHomeMessages_es get termsOfService => TermsOfServiceHomeMessages_es(this);
	NavigationButtonsHomeMessages_es get navigationButtons => NavigationButtonsHomeMessages_es(this);
}

class MessagesHomeMessages_es extends MessagesHomeMessages {
	final HomeMessages_es _parent;
	const MessagesHomeMessages_es(this._parent):super(_parent);
	String get subtitle => "Soy tu asistente personal de salud para mascotas";
	String get profile => "Perfil";
	String title(String name) => "Hola $name,";
	String get startConcierge => "Comenzar";
	String get virtualVetLearnMoreQuestion => "¿Qué es el Veterinario Virtual";
	String appDownloadLinks(String appName, String iphoneLink, String androidLink) => "También puedes descargar $appName para $iphoneLink y $androidLink";
	String get symptomInputLabel => "Síntoma principal";
	String get symptomInputHint => "Describe el síntoma principal de tu mascota";
	AskAVetMessagesHomeMessages_es get askAVet => AskAVetMessagesHomeMessages_es(this);
	String get logout => "Desconectarse";
	String hello(String name) => "Hola $name";
	String get help => "¿Hay algo que pueda hacer para ayudar a tu mascota?";
	String get simpleTitle => "Hola,";
	String virtualVetLearnMoreDescription(String brandName) => "¿Tienes una pregunta sobre la salud de tu mascota para el Veterinario Virtual? Type it here and get immediate guidance from our Virtual Vet, which uses an advanced AI knowledge base of symptoms and conditions to provide the answers you’re looking for. If you’d like, you can speak with one of our veterinarians by phone, chat, or email after using the Virtual Vet.";
	String get makeConsultation => "Evalúa síntomas";
	NutritionMessagesHomeMessages_es get nutrition => NutritionMessagesHomeMessages_es(this);
	FindClinicsMessagesHomeMessages_es get findClinics => FindClinicsMessagesHomeMessages_es(this);
	String get virtualVetLearnMoreTitle => "Veterinario Virtual";
}

class AskAVetMessagesHomeMessages_es extends AskAVetMessagesHomeMessages {
	final MessagesHomeMessages_es _parent;
	const AskAVetMessagesHomeMessages_es(this._parent):super(_parent);
	String get title => "Habla con un veterinario";
	String get subtitle => "Recibe ayuda y consejo de un equipo veterinario profesional";
}

class NutritionMessagesHomeMessages_es extends NutritionMessagesHomeMessages {
	final MessagesHomeMessages_es _parent;
	const NutritionMessagesHomeMessages_es(this._parent):super(_parent);
	String get subtitle => "Consigue la mejor recomendación de comida y snacks para tu mascota";
	String get title => "Comida y Nutrición";
}

class FindClinicsMessagesHomeMessages_es extends FindClinicsMessagesHomeMessages {
	final MessagesHomeMessages_es _parent;
	const FindClinicsMessagesHomeMessages_es(this._parent):super(_parent);
	String get title => "Busca una Clínica";
	String get subtitle => "Encuentra la mejor clínica cerca de tí";
}

class TermsOfServiceHomeMessages_es extends TermsOfServiceHomeMessages {
	final HomeMessages_es _parent;
	const TermsOfServiceHomeMessages_es(this._parent):super(_parent);
	String get ctaText => "Consulte nuestros";
	String get termsOfService => "Términos de Servicio";
}

class NavigationButtonsHomeMessages_es extends NavigationButtonsHomeMessages {
	final HomeMessages_es _parent;
	const NavigationButtonsHomeMessages_es(this._parent):super(_parent);
	String get homeButton => "Inicio";
	String get calendarButton => "Vacunas";
	String get myPetsButton => "Mis mascotas";
}

