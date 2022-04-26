// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'sharedMessages.i18n.dart';

String get _languageCode => 'es';
String get _localeName => 'es';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class SharedMessages_es extends SharedMessages {
	const SharedMessages_es();
	String get size => "Tamaño";
	String get noThanks => "No, gracias";
	String get healthPlan => "Plan";
	String get loading => "Cargando";
	ErrorsSharedMessages_es get errors => ErrorsSharedMessages_es(this);
	String get addFile => "Añadir archivo";
	AgeInputLabelSharedMessages_es get ageInputLabel => AgeInputLabelSharedMessages_es(this);
	String get months => "Meses";
	String get add => "Añadir";
	String get phoneCall => "Llamada telefónica";
	String get send => "Enviar";
	String get google => "Google.com";
	PreventionSharedMessages_es get prevention => PreventionSharedMessages_es(this);
	String get email => "Email";
	String get cancel => "Cancelar";
	AgeRangeSharedMessages_es get ageRange => AgeRangeSharedMessages_es(this);
	String get sex => "Sexo";
	AltImageTextSharedMessages_es get altImageText => AltImageTextSharedMessages_es(this);
	String get spayed => "Castrada";
	PermissionsSharedMessages_es get permissions => PermissionsSharedMessages_es(this);
	String get bodyCondition => "Condición corporal";
	SexOptionSharedMessages_es get sexOption => SexOptionSharedMessages_es(this);
	String get done => "Aceptar";
	DewormingSharedMessages_es get deworming => DewormingSharedMessages_es(this);
	SpeciesSharedMessages_es get species => SpeciesSharedMessages_es(this);
	String get age => "Edad";
	String get breed => "Raza";
	String get amazon => "Amazon.com";
	String get newAlert => "Nuevo";
	String get no => "No";
	String get yes => "Sí";
	String get unknown => "No estoy seguro";
	String get dateFormat => "dd-MM-yyyy";
	String unreadNotifications(int count) => "$count notificaciones sin leer";
	String get noneOfThese => "Ninguno de ellos";
	String get years => "Años";
	String get save => "Guardar";
	String get carryOn => "Continuar";
	String get weight => "Peso";
	String get unreadNotification => "Una notificación sin leer";
	String get edit => "Editar";
	String fullAge(String years, String months) => "$years años $months meses";
	String get confirm => "Confirmar";
	String get name => "Nombre";
	String isTyping(String brandName) => "$brandName está escribiendo";
	String get chat => "Chat";
	String get activityLevel => "Nivel de actividad";
	String get ok => "Ok";
	String get video => "Video";
	String get castrated => "Castrado";
}

class ErrorsSharedMessages_es extends ErrorsSharedMessages {
	final SharedMessages_es _parent;
	const ErrorsSharedMessages_es(this._parent):super(_parent);
	String get screenLoad => "Se produjo un error al cargar la pantalla";
	String get connectionWarningBody => "Parece que estamos teniendo algunos problemas, inténtalo más tarde";
	String get isRequired => "Este campo es requerido";
	String get connectionWarningTitle => "Necesita conexión a internet";
}

class AgeInputLabelSharedMessages_es extends AgeInputLabelSharedMessages {
	final SharedMessages_es _parent;
	const AgeInputLabelSharedMessages_es(this._parent):super(_parent);
	String get month => "mes";
	String get year => "año";
	String get months => "meses";
	String get years => "años";
}

class PreventionSharedMessages_es extends PreventionSharedMessages {
	final SharedMessages_es _parent;
	const PreventionSharedMessages_es(this._parent):super(_parent);
	String get booster => "Polivalente";
	String get deworming => "Desparasitación";
	String get rabies => "Rabia";
}

class AgeRangeSharedMessages_es extends AgeRangeSharedMessages {
	final SharedMessages_es _parent;
	const AgeRangeSharedMessages_es(this._parent):super(_parent);
	String get adult => "Entre 4 y 10 años";
	String get senior => "Más de 10 años";
	String get junior => "Menos de un año";
	String get young => "Entre 1 y 4 años";
}

class AltImageTextSharedMessages_es extends AltImageTextSharedMessages {
	final SharedMessages_es _parent;
	const AltImageTextSharedMessages_es(this._parent):super(_parent);
	String get close => "Cerrar";
	String get next => "Siguiente";
	String get cancel => "Cancelar";
	String get back => "Volver";
	String get submit => "Enviar";
}

class PermissionsSharedMessages_es extends PermissionsSharedMessages {
	final SharedMessages_es _parent;
	const PermissionsSharedMessages_es(this._parent):super(_parent);
	String get goToAppSettings => "Ir a los parámetros de la App";
	String get cancel => "Cancelar";
}

class SexOptionSharedMessages_es extends SexOptionSharedMessages {
	final SharedMessages_es _parent;
	const SexOptionSharedMessages_es(this._parent):super(_parent);
	String get female => "Hembra";
	String get male => "Macho";
}

class DewormingSharedMessages_es extends DewormingSharedMessages {
	final SharedMessages_es _parent;
	const DewormingSharedMessages_es(this._parent):super(_parent);
	String get internal => "Desparasitación interna";
	String get external => "Desparasitación externa";
}

class SpeciesSharedMessages_es extends SpeciesSharedMessages {
	final SharedMessages_es _parent;
	const SpeciesSharedMessages_es(this._parent):super(_parent);
	String get dog => "Perro";
	String get cat => "Gato";
	String get species => "Especie";
}

