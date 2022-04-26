// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'sharedMessages.i18n.dart';

String get _languageCode => 'de';
String get _localeName => 'de';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class SharedMessages_de extends SharedMessages {
	const SharedMessages_de();
	String get size => "Größe";
	String get noThanks => "Nein danke";
	String get healthPlan => "Planen";
	String get loading => "Wird geladen";
	ErrorsSharedMessages_de get errors => ErrorsSharedMessages_de(this);
	String get addFile => "Datei hinzufügen";
	AgeInputLabelSharedMessages_de get ageInputLabel => AgeInputLabelSharedMessages_de(this);
	String get months => "Monate";
	String get add => "Hinzufügen";
	String get phoneCall => "Anruf";
	String get send => "Senden";
	String get google => "Google.com";
	PreventionSharedMessages_de get prevention => PreventionSharedMessages_de(this);
	String get email => "Email";
	String get cancel => "Stornieren";
	AgeRangeSharedMessages_de get ageRange => AgeRangeSharedMessages_de(this);
	String get sex => "Sex";
	AltImageTextSharedMessages_de get altImageText => AltImageTextSharedMessages_de(this);
	String get spayed => "Kastriert";
	PermissionsSharedMessages_de get permissions => PermissionsSharedMessages_de(this);
	String get bodyCondition => "Körperzustand";
	SexOptionSharedMessages_de get sexOption => SexOptionSharedMessages_de(this);
	String get done => "Getan";
	DewormingSharedMessages_de get deworming => DewormingSharedMessages_de(this);
	SpeciesSharedMessages_de get species => SpeciesSharedMessages_de(this);
	String get age => "Alter";
	String get breed => "Rasse";
	String get amazon => "Amazon.com";
	String get newAlert => "Neu";
	String get no => "Nein";
	String get yes => "Ja";
	String get unknown => "Unbekannt";
	String get dateFormat => "MM-TT-JJJJ";
	String unreadNotifications(int count) => "";
	String get noneOfThese => "Keine von diesen";
	String get years => "Jahre";
	String get save => "speichern";
	String get carryOn => "Fortsetzen";
	String get weight => "Gewicht";
	String get unreadNotification => "";
	String get edit => "Bearbeiten";
	String fullAge(String years, String months) => "$years Jahre $months Monate";
	String get confirm => "Bestätigen";
	String get name => "Name";
	String isTyping(String brandName) => "$brandName tippt";
	String get chat => "Plaudern";
	String get activityLevel => "Aktivitätslevel";
	String get ok => "OK";
	String get video => "Video";
	String get castrated => "Kastriert";
}

class ErrorsSharedMessages_de extends ErrorsSharedMessages {
	final SharedMessages_de _parent;
	const ErrorsSharedMessages_de(this._parent):super(_parent);
	String get screenLoad => "Beim Laden des Bildschirms ist ein Fehler aufgetreten";
	String get connectionWarningBody => "Es sieht so aus, als hätten wir momentan einige Probleme. Versuchen Sie es später noch einmal";
	String get isRequired => "Dieses Feld wird benötigt";
	String get connectionWarningTitle => "Sie benötigen eine Internetverbindung";
}

class AgeInputLabelSharedMessages_de extends AgeInputLabelSharedMessages {
	final SharedMessages_de _parent;
	const AgeInputLabelSharedMessages_de(this._parent):super(_parent);
	String get month => "Monat";
	String get year => "Jahr";
	String get months => "Monate";
	String get years => "Jahre";
}

class PreventionSharedMessages_de extends PreventionSharedMessages {
	final SharedMessages_de _parent;
	const PreventionSharedMessages_de(this._parent):super(_parent);
	String get booster => "";
	String get deworming => "";
	String get rabies => "";
}

class AgeRangeSharedMessages_de extends AgeRangeSharedMessages {
	final SharedMessages_de _parent;
	const AgeRangeSharedMessages_de(this._parent):super(_parent);
	String get adult => "Zwischen 4 und 10 Jahren";
	String get senior => "Mehr als 10 Jahre alt";
	String get junior => "Weniger als 1 Jahr alt";
	String get young => "Zwischen 1 und 4 Jahren";
}

class AltImageTextSharedMessages_de extends AltImageTextSharedMessages {
	final SharedMessages_de _parent;
	const AltImageTextSharedMessages_de(this._parent):super(_parent);
	String get close => "Schließen";
	String get next => "Nächster";
	String get cancel => "Stornieren";
	String get back => "Zurück";
	String get submit => "einreichen";
}

class PermissionsSharedMessages_de extends PermissionsSharedMessages {
	final SharedMessages_de _parent;
	const PermissionsSharedMessages_de(this._parent):super(_parent);
	String get goToAppSettings => "Gehen Sie zu App-Einstellungen";
	String get cancel => "Stornieren";
}

class SexOptionSharedMessages_de extends SexOptionSharedMessages {
	final SharedMessages_de _parent;
	const SexOptionSharedMessages_de(this._parent):super(_parent);
	String get female => "Weiblich";
	String get male => "Männlich";
}

class DewormingSharedMessages_de extends DewormingSharedMessages {
	final SharedMessages_de _parent;
	const DewormingSharedMessages_de(this._parent):super(_parent);
	String get internal => "Interne Entwurmung";
	String get external => "Externe Entwurmung";
}

class SpeciesSharedMessages_de extends SpeciesSharedMessages {
	final SharedMessages_de _parent;
	const SpeciesSharedMessages_de(this._parent):super(_parent);
	String get dog => "Hund";
	String get cat => "Katze";
	String get species => "Spezies";
}

