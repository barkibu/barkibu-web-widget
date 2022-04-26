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

class SharedMessages {
	const SharedMessages();
	String get size => "Size";
	String get noThanks => "No thanks";
	String get healthPlan => "Plan";
	String get loading => "Loading";
	ErrorsSharedMessages get errors => ErrorsSharedMessages(this);
	String get addFile => "Add file";
	AgeInputLabelSharedMessages get ageInputLabel => AgeInputLabelSharedMessages(this);
	String get months => "Months";
	String get add => "Add";
	String get phoneCall => "Phone Call";
	String get send => "Send";
	String get google => "Google.com";
	PreventionSharedMessages get prevention => PreventionSharedMessages(this);
	String get email => "Email";
	String get cancel => "Cancel";
	AgeRangeSharedMessages get ageRange => AgeRangeSharedMessages(this);
	String get sex => "Sex";
	AltImageTextSharedMessages get altImageText => AltImageTextSharedMessages(this);
	String get spayed => "Spayed";
	PermissionsSharedMessages get permissions => PermissionsSharedMessages(this);
	String get bodyCondition => "Body condition";
	SexOptionSharedMessages get sexOption => SexOptionSharedMessages(this);
	String get done => "Done";
	DewormingSharedMessages get deworming => DewormingSharedMessages(this);
	SpeciesSharedMessages get species => SpeciesSharedMessages(this);
	String get age => "Age";
	String get breed => "Breed";
	String get amazon => "Amazon.com";
	String get newAlert => "New";
	String get no => "No";
	String get yes => "Yes";
	String get unknown => "Unknown";
	String get dateFormat => "MM-dd-yyyy";
	String unreadNotifications(int count) => "$count unread notifications";
	String get noneOfThese => "None of these";
	String get years => "Years";
	String get save => "Save";
	String get carryOn => "Continue";
	String get weight => "Weight";
	String get unreadNotification => "One unread notification";
	String get edit => "Edit";
	String fullAge(String years, String months) => "$years years $months months";
	String get confirm => "Confirm";
	String get name => "Name";
	String isTyping(String brandName) => "$brandName is typing";
	String get chat => "Chat";
	String get activityLevel => "Activity level";
	String get ok => "Ok";
	String get video => "Video";
	String get castrated => "Castrated";
}

class ErrorsSharedMessages {
	final SharedMessages _parent;
	const ErrorsSharedMessages(this._parent);
	String get screenLoad => "There was an error loading the screen";
	String get connectionWarningBody => "Looks like we are having some issues right now try again later";
	String get isRequired => "This field is required";
	String get connectionWarningTitle => "You need internet connection";
}

class AgeInputLabelSharedMessages {
	final SharedMessages _parent;
	const AgeInputLabelSharedMessages(this._parent);
	String get month => "month";
	String get year => "year";
	String get months => "months";
	String get years => "years";
}

class PreventionSharedMessages {
	final SharedMessages _parent;
	const PreventionSharedMessages(this._parent);
	String get booster => "Booster/Annual shot";
	String get deworming => "Deworming";
	String get rabies => "Rabies";
}

class AgeRangeSharedMessages {
	final SharedMessages _parent;
	const AgeRangeSharedMessages(this._parent);
	String get adult => "Between 4 and 10 years old";
	String get senior => "More than 10 years old";
	String get junior => "Less than 1 year old";
	String get young => "Between 1 and 4 years old";
}

class AltImageTextSharedMessages {
	final SharedMessages _parent;
	const AltImageTextSharedMessages(this._parent);
	String get close => "Close";
	String get next => "Next";
	String get cancel => "Cancel";
	String get back => "Back";
	String get submit => "Submit";
}

class PermissionsSharedMessages {
	final SharedMessages _parent;
	const PermissionsSharedMessages(this._parent);
	String get goToAppSettings => "Go to App Settings";
	String get cancel => "Cancel";
}

class SexOptionSharedMessages {
	final SharedMessages _parent;
	const SexOptionSharedMessages(this._parent);
	String get female => "Female";
	String get male => "Male";
}

class DewormingSharedMessages {
	final SharedMessages _parent;
	const DewormingSharedMessages(this._parent);
	String get internal => "Internal deworming";
	String get external => "External deworming";
}

class SpeciesSharedMessages {
	final SharedMessages _parent;
	const SpeciesSharedMessages(this._parent);
	String get dog => "Dog";
	String get cat => "Cat";
	String get species => "Species";
}

