// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'clinicsFinderMessages.i18n.dart';

String get _languageCode => 'es';
String get _localeName => 'es';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class ClinicsFinderMessages_es extends ClinicsFinderMessages {
	const ClinicsFinderMessages_es();
	String get title => "Busca una clínica cercana";
	String get geolocationRequired => "Necesitamos tu posición para encontrar las clínicas más cercanas a ti";
	String get searchAddress => "Introduce tu dirección, código postal o ciudad...";
	String get enterYourAddress => "Introduce tu dirección para buscar las clínicas más cercanas";
	String get searchLabel => "Introduce tu dirección, código postal o ciudad...";
	CardClinicsFinderMessages_es get card => CardClinicsFinderMessages_es(this);
}

class CardClinicsFinderMessages_es extends CardClinicsFinderMessages {
	final ClinicsFinderMessages_es _parent;
	const CardClinicsFinderMessages_es(this._parent):super(_parent);
	String get hoursTitle => "Horario";
}

