// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'validationMessages.i18n.dart';

String get _languageCode => 'de';
String get _localeName => 'de';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class ValidationMessages_de extends ValidationMessages {
	const ValidationMessages_de();
	ValidateValidationMessages_de get validate => ValidateValidationMessages_de(this);
}

class ValidateValidationMessages_de extends ValidateValidationMessages {
	final ValidationMessages_de _parent;
	const ValidateValidationMessages_de(this._parent):super(_parent);
	String withPattern(String field, String pattern) => "Das $field muss $pattern sein";
	String required(String field) => "Das Feld $field ist erforderlich";
	String get emailPasswordIncorrect => "Die E-Mail oder das Passwort sind falsch";
}

