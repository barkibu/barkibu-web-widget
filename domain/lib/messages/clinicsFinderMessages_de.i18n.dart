// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'clinicsFinderMessages.i18n.dart';

String get _languageCode => 'de';
String get _localeName => 'de';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class ClinicsFinderMessages_de extends ClinicsFinderMessages {
	const ClinicsFinderMessages_de();
	String get title => "Find A Clinic";
	String get geolocationRequired => "We need your location to find the clinics closest to you";
	String get searchAddress => "Enter address, city or zipcode...";
	String get enterYourAddress => "Enter your address to find the closest clincs";
	String get searchLabel => "Enter address, city or zipcode...";
	String get search => "Search";
	CardClinicsFinderMessages_de get card => CardClinicsFinderMessages_de(this);
}

class CardClinicsFinderMessages_de extends CardClinicsFinderMessages {
	final ClinicsFinderMessages_de _parent;
	const CardClinicsFinderMessages_de(this._parent):super(_parent);
	String get hoursTitle => "Hours";
}

