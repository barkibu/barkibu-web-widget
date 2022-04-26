// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'authMessages.i18n.dart';

String get _languageCode => 'de';
String get _localeName => 'de';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class AuthMessages_de extends AuthMessages {
	const AuthMessages_de();
	Sign_upAuthMessages_de get sign_up => Sign_upAuthMessages_de(this);
	CodeAuthMessages_de get code => CodeAuthMessages_de(this);
	Auth_homeAuthMessages_de get auth_home => Auth_homeAuthMessages_de(this);
	Password_recoveryAuthMessages_de get password_recovery => Password_recoveryAuthMessages_de(this);
	Sign_inAuthMessages_de get sign_in => Sign_inAuthMessages_de(this);
	PhonelessDialogAuthMessages_de get phonelessDialog => PhonelessDialogAuthMessages_de(this);
}

class Sign_upAuthMessages_de extends Sign_upAuthMessages {
	final AuthMessages_de _parent;
	const Sign_upAuthMessages_de(this._parent):super(_parent);
	String get phone_number_error => "Geben Sie eine gültige Telefonnummer ein";
	String terms_and_privacy(String brandName, String termsUrl, String privacyUrl) => "Wenn Sie fortfahren, akzeptieren Sie die <a href='$termsUrl'>Allgemeinen Geschäftsbedingungen</a> und die <a href='$privacyUrl'>Datenschutzrichtlinie</a> von $brandName";
	String get email => "Email";
	String get lastname_error => "Geben Sie einen gültigen Nachnamen ein";
	String get lastname_hint => "Geben Sie Ihren Nachnamen ein";
	String get email_error => "Geben sie eine gültige E-Mail-Adresse an";
	String get password => "Passwort";
	String get sign_up => "Anmelden";
	String get prefix => "Landesvorwahl";
	String get phone_not_found => "Diese Telefonnummer ist noch nicht registriert";
	String get go_back => "Rückkehr";
	String get name => "Name";
	String get terms_and_condition_url => "https://www.barkibu.com/en-us/legal-notice";
	String get phone_not_verified_error => "Beim Überprüfen Ihrer Telefonnummer ist ein Fehler aufgetreten";
	String get create_account_email_phone => "Erstellen Sie ein Konto mit Ihrer E-Mail-Adresse oder Handynummer";
	String get name_hint => "Geben Sie Ihren Vornamen ein";
	String get general_error => "Es ist ein Fehler aufgetreten";
	String get confirm_password_error => "Passwörter stimmen nicht überein";
	String get email_tab => "Email";
	String get phone_number_prefix_hint => "Geben Sie Ihre Telefonnummer ein";
	String get invalid_phone_error => "Die von Ihnen eingegebene Telefonnummer ist ungültig";
	String get action => "Anmelden";
	String get lastname => "Nachname";
	String get password_hint => "Geben Sie Ihr Passwort ein";
	String get confirm_password => "Bestätigen";
	String get phone_number_hint => "Trage deine Telefonnummer ein";
	String get password_error => "Geben Sie ein gültiges Passwort ein";
	String get phone_tab => "Telefon";
	String get phone_number_prefix_error => "Geben Sie eine gültige Landesvorwahl für die Telefonnummer ein";
	String get phone_number => "Telefonnummer";
	String get accept_terms_error => "Sie müssen unsere Bedingungen akzeptieren";
	String get privacy_url => "https://www.barkibu.com/en-us/legal-notice";
	String get email_hint => "Geben sie ihre E-Mailadresse ein";
	String get create_account => "Erstelle deinen Account";
	String get confirm_password_hint => "Bestätigen Sie Ihr Passwort";
	String get accept_terms => "Die Bedingungen akzeptieren";
	String get phone_number_prefix => "Ländernummer der Telefonnummer";
	String get go_to_sign_in => "Oder Melden Sie sich an, wenn Sie bereits ein Konto haben";
	String get name_error => "Geben Sie einen gültigen Namen ein";
}

class CodeAuthMessages_de extends CodeAuthMessages {
	final AuthMessages_de _parent;
	const CodeAuthMessages_de(this._parent):super(_parent);
	String get hint => "000 000";
	String get not_sent_error => "Beim Senden des Bestätigungscodes ist ein Fehler aufgetreten";
	String get error => "Geben Sie einen gültigen 6-stelligen Code ein";
	String get resendHint => "Wir haben eine SMS mit einem Bestätigungscode an Ihr Telefon gesendet. Hast du es nicht erhalten?";
	String get phoneNumberVerificationMessage => "Wir verwenden die von Ihnen angegebene Telefonnummer, um Ihnen eine Bestätigungs-SMS zu senden.";
	String get code => "Geben Sie Ihren Bestätigungscode ein";
	String get resendQuestion => "Hast du es nicht erhalten?";
	String resendConfirmation(String fullPhoneNumber) => "Wir haben Ihnen einen Code per SMS an <b>$fullPhoneNumber</b> gesendet";
	String get incorrectCodeError => "Code stimmte nicht überein";
	String get resendAction => "Code erneut senden";
	String get send => "Code senden";
	String resendProblem(String url) => "Probleme haben? <a href='$url'>Kontaktieren Sie uns über WhatsApp</a>";
}

class Auth_homeAuthMessages_de extends Auth_homeAuthMessages {
	final AuthMessages_de _parent;
	const Auth_homeAuthMessages_de(this._parent):super(_parent);
	String get sign_in => "Einloggen";
	String sign_in_hint(String brandName) => "Wenn Sie bereits ein Konto bei $brandName haben";
	String welcome_subtitle(String appName) => "$appName hilft Ihnen bei Zweifeln oder Problemen, die Sie möglicherweise hinsichtlich der Gesundheit Ihres Haustieres haben";
	String log_in_alternative(String url) => "Oder <a href='$url'> Anmelden </a>, wenn Sie bereits ein Konto haben";
	String get presentation => "Genießen Sie die Gesundheit Ihres <br> <b>Haustieres</b>";
	String sign_up(String brandName) => "Beginnen Sie mit der Verwendung von $brandName";
	String welcome_title(String appName) => "Willkommen bei $appName";
	String help_question(String appName) => "Wie kann mir $appName helfen?";
	String get sign_up_hint => "Wenn Sie zum ersten Mal bei uns sind";
}

class Password_recoveryAuthMessages_de extends Password_recoveryAuthMessages {
	final AuthMessages_de _parent;
	const Password_recoveryAuthMessages_de(this._parent):super(_parent);
	String get title => "Passwort zurücksetzen";
	String get alertError => "Ein Fehler ist aufgetreten";
	String get resetPasswordButton => "Setze mein Passwort zurück";
	String get buttonsResetPassword => "Passwort zurücksetzen und anmelden";
	String codeSentDescription(String email) => "Wir haben einen Rücksetzcode per E-Mail an Ihre E-Mail-Adresse gesendet: $email";
	String get inputEmail => "Email";
	String get subtitle => "Geben Sie ein neues Kennwort ein";
	String get inputCode => "Code per E-Mail erhalten";
	String get newPasswordHint => "Geben Sie Ihr neues Passwort ein";
	String get buttonsResendCode => "Sie haben nichts erhalten? Code erneut senden";
	String get codeHint => "000 000";
	String get confirmNewPasswordHint => "Bestätigen Sie Ihr neues Passwort";
	String get buttonsSendEmail => "E-Mail zurücksetzen";
	String get inputNewPassword => "Neues Kennwort";
	String get inputConfirmNewPassword => "Bestätige neues Passwort";
	String get alertsSuccess => "Die E-Mail wurde korrekt gesendet";
	String get emailHint => "Geben sie ihre E-Mail Adresse ein";
	String get passwordForgotten => "Hast du dein Passwort vergessen?";
}

class Sign_inAuthMessages_de extends Sign_inAuthMessages {
	final AuthMessages_de _parent;
	const Sign_inAuthMessages_de(this._parent):super(_parent);
	String get mail => "Email";
	String get password_error => "Ungültiges Passwort";
	String get password => "Passwort";
	String get phone_number_verification_message => "Wir verwenden die von Ihnen angegebene Telefonnummer, um Ihnen eine Bestätigungs-SMS zu senden.";
	String get welcome_back => "Willkommen zurück!";
	String get password_hint => "Geben Sie Ihr Passwort ein";
	String get credential_error => "E-Mail oder Passwort ungültig";
	String get go_to_sign_up => "Sie haben noch kein Konto? Hier anmelden";
	String get log_in => "Einloggen";
	String get mail_hint => "Geben sie ihre E-Mail Adresse ein";
	String get mail_error => "Ungültige E-Mail";
}

class PhonelessDialogAuthMessages_de extends PhonelessDialogAuthMessages {
	final AuthMessages_de _parent;
	const PhonelessDialogAuthMessages_de(this._parent):super(_parent);
	String get action => "OK";
	String get title => "Kopf hoch!";
	String get content => "Um Ihre Sicherheit zu verbessern und die Gesundheitsdaten Ihres Haustieres zu schützen, müssen Sie sich erneut unter einer Telefonnummer anmelden. Wir entschuldigen uns wirklich für den Ärger!";
}

