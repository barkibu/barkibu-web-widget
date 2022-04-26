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

class ClinicsFinderMessages {
	const ClinicsFinderMessages();
	String get title => "Find A Clinic";
	String get geolocationRequired => "We need your location to find the clinics closest to you";
	String get searchAddress => "Enter address, city or zipcode...";
	String get enterYourAddress => "Enter your address to find the closest clincs";
	String get searchLabel => "Enter address, city or zipcode...";
	CardClinicsFinderMessages get card => CardClinicsFinderMessages(this);
}

class CardClinicsFinderMessages {
	final ClinicsFinderMessages _parent;
	const CardClinicsFinderMessages(this._parent);
	String get hoursTitle => "Hours";
}

