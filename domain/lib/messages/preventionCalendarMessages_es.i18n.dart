// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'preventionCalendarMessages.i18n.dart';

String get _languageCode => 'es';
String get _localeName => 'es';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class PreventionCalendarMessages_es extends PreventionCalendarMessages {
	const PreventionCalendarMessages_es();
	AppBarPreventionCalendarMessages_es get appBar => AppBarPreventionCalendarMessages_es(this);
	SectionPreventionCalendarMessages_es get section => SectionPreventionCalendarMessages_es(this);
	ListPreventionCalendarMessages_es get list => ListPreventionCalendarMessages_es(this);
}

class AppBarPreventionCalendarMessages_es extends AppBarPreventionCalendarMessages {
	final PreventionCalendarMessages_es _parent;
	const AppBarPreventionCalendarMessages_es(this._parent):super(_parent);
	String get subtitle => "Vacunación y Desparasitación";
	String get title => "Calendario";
}

class SectionPreventionCalendarMessages_es extends SectionPreventionCalendarMessages {
	final PreventionCalendarMessages_es _parent;
	const SectionPreventionCalendarMessages_es(this._parent):super(_parent);
	String title(String type) => "Próxima $type";
	CardSectionPreventionCalendarMessages_es get card => CardSectionPreventionCalendarMessages_es(this);
}

class CardSectionPreventionCalendarMessages_es extends CardSectionPreventionCalendarMessages {
	final SectionPreventionCalendarMessages_es _parent;
	const CardSectionPreventionCalendarMessages_es(this._parent):super(_parent);
	WarningCardSectionPreventionCalendarMessages_es get warning => WarningCardSectionPreventionCalendarMessages_es(this);
	String lastDate(String date) => "Anterior: $date";
}

class WarningCardSectionPreventionCalendarMessages_es extends WarningCardSectionPreventionCalendarMessages {
	final CardSectionPreventionCalendarMessages_es _parent;
	const WarningCardSectionPreventionCalendarMessages_es(this._parent):super(_parent);
	String get invalidDate => "¿No es correcta?";
	String get action => "Corrige la fecha";
}

class ListPreventionCalendarMessages_es extends ListPreventionCalendarMessages {
	final PreventionCalendarMessages_es _parent;
	const ListPreventionCalendarMessages_es(this._parent):super(_parent);
	String get nextVaccines => "Siguientes vacunas";
	String get error => "Ha habido un problema cargando tu calendario";
	String get empty => "Tu calendario de vacunación está vacío";
}

