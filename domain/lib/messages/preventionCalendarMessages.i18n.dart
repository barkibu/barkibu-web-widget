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

class PreventionCalendarMessages {
	const PreventionCalendarMessages();
	AppBarPreventionCalendarMessages get appBar => AppBarPreventionCalendarMessages(this);
	SectionPreventionCalendarMessages get section => SectionPreventionCalendarMessages(this);
	ListPreventionCalendarMessages get list => ListPreventionCalendarMessages(this);
}

class AppBarPreventionCalendarMessages {
	final PreventionCalendarMessages _parent;
	const AppBarPreventionCalendarMessages(this._parent);
	String get subtitle => "Vaccination and Deworming";
	String get title => "Calendar";
}

class SectionPreventionCalendarMessages {
	final PreventionCalendarMessages _parent;
	const SectionPreventionCalendarMessages(this._parent);
	String title(String type) => "Next $type";
	CardSectionPreventionCalendarMessages get card => CardSectionPreventionCalendarMessages(this);
}

class CardSectionPreventionCalendarMessages {
	final SectionPreventionCalendarMessages _parent;
	const CardSectionPreventionCalendarMessages(this._parent);
	WarningCardSectionPreventionCalendarMessages get warning => WarningCardSectionPreventionCalendarMessages(this);
	String lastDate(String date) => "Previous: $date";
}

class WarningCardSectionPreventionCalendarMessages {
	final CardSectionPreventionCalendarMessages _parent;
	const WarningCardSectionPreventionCalendarMessages(this._parent);
	String get invalidDate => "Not correct?";
	String get action => "Correct the date";
}

class ListPreventionCalendarMessages {
	final PreventionCalendarMessages _parent;
	const ListPreventionCalendarMessages(this._parent);
	String get nextVaccines => "Next vaccines";
	String get error => "There has been a problem loading your calendar";
	String get empty => "Your vaccination calendar is empty";
}

