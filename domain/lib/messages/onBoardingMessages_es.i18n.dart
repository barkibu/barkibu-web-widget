// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'onBoardingMessages.i18n.dart';

String get _languageCode => 'es';
String get _localeName => 'es';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class OnBoardingMessages_es extends OnBoardingMessages {
	const OnBoardingMessages_es();
	PreventionOnBoardingMessages_es get prevention => PreventionOnBoardingMessages_es(this);
	SuccessOnBoardingMessages_es get success => SuccessOnBoardingMessages_es(this);
	PetCreationOnBoardingMessages_es get petCreation => PetCreationOnBoardingMessages_es(this);
	HealthStatusOnBoardingMessages_es get healthStatus => HealthStatusOnBoardingMessages_es(this);
	AppUsageOnBoardingMessages_es get appUsage => AppUsageOnBoardingMessages_es(this);
	String get almost => "Ya casi está!";
}

class PreventionOnBoardingMessages_es extends PreventionOnBoardingMessages {
	final OnBoardingMessages_es _parent;
	const PreventionOnBoardingMessages_es(this._parent):super(_parent);
	String get notExact => "No hace falta que sepas la fecha exacta";
	String get before => "Antes";
	String rabies(String petName) => "¿Cuándo vacunaste de la rabia a $petName, por última vez?";
	String multivalent(String petName) => "¿Cuándo le vacunaste de la polivalente?";
	String get date => "Selecciona fecha";
	String de_worming(String petName) => "¿Cuándo diste a $petName su última desparasitación interna?";
	String get never => "Nunca";
}

class SuccessOnBoardingMessages_es extends SuccessOnBoardingMessages {
	final OnBoardingMessages_es _parent;
	const SuccessOnBoardingMessages_es(this._parent):super(_parent);
	String creatingProfile(String petName) => "Estamos preparando el Perfil de $petName";
	String get assessments => "Consultas veterinarias";
}

class PetCreationOnBoardingMessages_es extends PetCreationOnBoardingMessages {
	final OnBoardingMessages_es _parent;
	const PetCreationOnBoardingMessages_es(this._parent):super(_parent);
	String get selectBreedTitle => "Selecciona la raza de tu mascota";
	String get intro => "Bienvenido a Barkibu. Vamos a crearle un perfil a tu mascota. Si tienes más de una mascota luego podrás añadirla.";
	String get searchBreed => "Buscar razas";
	String neuteredQuestion(String petName) => "¿Está castrado?";
	String get selectBreed => "Selecciona raza";
	String get ageHint => "Cómo saber la edad de mi mascota";
	String sexQuestion(String petName) => "¿Cuál es el sexo de $petName?";
	String get nameQuestion => "¿Cómo se llama tu mascota?";
	String get nameHint => "Nombre";
	String ageQuestion(String petName) => "¿Cuántos años tiene?";
	String breedQuestion(String petName) => "¿Qué raza es?";
	String get ageQuestionHint => "Fecha de nacimiento";
	String speciesQuestion(String petName) => "¿Es $petName un perro o un gato?";
}

class HealthStatusOnBoardingMessages_es extends HealthStatusOnBoardingMessages {
	final OnBoardingMessages_es _parent;
	const HealthStatusOnBoardingMessages_es(this._parent):super(_parent);
	String get yes => "Su salud es buena";
	String get no => "Ahora tiene un problema de salud";
	String question(String petName) => "¿Disfruta $petName de buena salud?";
}

class AppUsageOnBoardingMessages_es extends AppUsageOnBoardingMessages {
	final OnBoardingMessages_es _parent;
	const AppUsageOnBoardingMessages_es(this._parent):super(_parent);
	String get finance => "Ahorrar gastos de salud";
	String get question => "¿Qué necesitas de un veterinario online?";
	String get prevention => "Evitar enfermedades a mi mascota";
	String get vetOnDemand => "Hablar con un veterinario siempre que lo necesite";
}

