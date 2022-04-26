// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'profileMessages.i18n.dart';

String get _languageCode => 'es';
String get _localeName => 'es';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class ProfileMessages_es extends ProfileMessages {
	const ProfileMessages_es();
	String termsAndPolicy(String url, String appName) => "<a href=$url target=_blank>Términos y Condiciones y Política de privacidad</a> de $appName";
	String get title => "Perfil";
	String get update => "Actualizar perfil";
}

