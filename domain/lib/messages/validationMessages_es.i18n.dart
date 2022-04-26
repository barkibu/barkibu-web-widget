// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'validationMessages.i18n.dart';

String get _languageCode => 'es';
String get _localeName => 'es';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class ValidationMessages_es extends ValidationMessages {
	const ValidationMessages_es();
	ValidateValidationMessages_es get validate => ValidateValidationMessages_es(this);
}

class ValidateValidationMessages_es extends ValidateValidationMessages {
	final ValidationMessages_es _parent;
	const ValidateValidationMessages_es(this._parent):super(_parent);
	String withPattern(String field, String pattern) => "El campo $field debe ser de la forma $pattern";
	String required(String field) => "El campo $field es obligatorio";
	String get emailPasswordIncorrect => "El email o la contraseña son incorrectos";
}

