// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'preventionCalendarMessages.i18n.dart';

String get _languageCode => 'de';
String get _localeName => 'de';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class PreventionCalendarMessages_de extends PreventionCalendarMessages {
	const PreventionCalendarMessages_de();
	AppBarPreventionCalendarMessages_de get appBar => AppBarPreventionCalendarMessages_de(this);
	SectionPreventionCalendarMessages_de get section => SectionPreventionCalendarMessages_de(this);
	ListPreventionCalendarMessages_de get list => ListPreventionCalendarMessages_de(this);
}

class AppBarPreventionCalendarMessages_de extends AppBarPreventionCalendarMessages {
	final PreventionCalendarMessages_de _parent;
	const AppBarPreventionCalendarMessages_de(this._parent):super(_parent);
	String get subtitle => "";
	String get title => "";
}

class SectionPreventionCalendarMessages_de extends SectionPreventionCalendarMessages {
	final PreventionCalendarMessages_de _parent;
	const SectionPreventionCalendarMessages_de(this._parent):super(_parent);
	String title(String type) => "";
	CardSectionPreventionCalendarMessages_de get card => CardSectionPreventionCalendarMessages_de(this);
}

class CardSectionPreventionCalendarMessages_de extends CardSectionPreventionCalendarMessages {
	final SectionPreventionCalendarMessages_de _parent;
	const CardSectionPreventionCalendarMessages_de(this._parent):super(_parent);
	WarningCardSectionPreventionCalendarMessages_de get warning => WarningCardSectionPreventionCalendarMessages_de(this);
	String lastDate(String date) => "";
}

class WarningCardSectionPreventionCalendarMessages_de extends WarningCardSectionPreventionCalendarMessages {
	final CardSectionPreventionCalendarMessages_de _parent;
	const WarningCardSectionPreventionCalendarMessages_de(this._parent):super(_parent);
	String get invalidDate => "";
	String get action => "";
}

class ListPreventionCalendarMessages_de extends ListPreventionCalendarMessages {
	final PreventionCalendarMessages_de _parent;
	const ListPreventionCalendarMessages_de(this._parent):super(_parent);
	String get nextVaccines => "";
	String get error => "";
	String get empty => "";
}

