// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'authMessages.i18n.dart';

String get _languageCode => 'es';
String get _localeName => 'es';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class AuthMessages_es extends AuthMessages {
	const AuthMessages_es();
	Sign_upAuthMessages_es get sign_up => Sign_upAuthMessages_es(this);
	CodeAuthMessages_es get code => CodeAuthMessages_es(this);
	Auth_homeAuthMessages_es get auth_home => Auth_homeAuthMessages_es(this);
	Password_recoveryAuthMessages_es get password_recovery => Password_recoveryAuthMessages_es(this);
	Sign_inAuthMessages_es get sign_in => Sign_inAuthMessages_es(this);
	PhonelessDialogAuthMessages_es get phonelessDialog => PhonelessDialogAuthMessages_es(this);
}

class Sign_upAuthMessages_es extends Sign_upAuthMessages {
	final AuthMessages_es _parent;
	const Sign_upAuthMessages_es(this._parent):super(_parent);
	String get phone_number_error => "Escribe un teléfono válido";
	String terms_and_privacy(String brandName, String termsUrl, String privacyUrl) => "Al continuar, aceptas los <a href='$termsUrl'>Términos y Condiciones de Uso</a> y la <a href='$privacyUrl'>Política de Privacidad</a> de $brandName";
	String get email => "Email";
	String get lastname_error => "Escribe un apellido válido";
	String get lastname_hint => "Escribe tus apellidos";
	String get email_error => "Escribe un email válido";
	String get password => "Contraseña";
	String get sign_up => "Registro";
	String get prefix => "Código de país";
	String get phone_not_found => "Este número de teléfono todavía no está registrado";
	String get go_back => "Volver";
	String get name => "Nombre";
	String get terms_and_condition_url => "https://www.barkibu.com/es/aviso-legal";
	String get phone_not_verified_error => "Hubo un error al verificar el teléfono";
	String get create_account_email_phone => "Crea una cuenta usando tu dirección de email o tu número de teléfono";
	String get name_hint => "Escribe tu nombre";
	String get general_error => "Ha sucedido un error";
	String get confirm_password_error => "Las contraseñas no coinciden";
	String get email_tab => "Email";
	String get phone_number_prefix_hint => "Escribe tu código de país";
	String get invalid_phone_error => "El teléfono introducido es inválido";
	String get action => "Entrar";
	String get lastname => "Apellidos";
	String get password_hint => "Escribe tu contraseña";
	String get confirm_password => "Confirmación";
	String get phone_number_hint => "Introduce tu número de teléfono";
	String get password_error => "Escribe una contraseña válida";
	String get phone_tab => "Teléfono";
	String get phone_number_prefix_error => "Escribe un código de país válido";
	String get phone_number => "Tu número de teléfono";
	String get accept_terms_error => "Debes aceptar los términos";
	String get privacy_url => "https://www.barkibu.com/es/aviso-legal";
	String get email_hint => "Escribe tu email";
	String get create_account => "Crea tu cuenta";
	String get confirm_password_hint => "Confirma tu contraseña";
	String get accept_terms => "Acepta los términos";
	String get phone_number_prefix => "Código de país";
	String get go_to_sign_in => "O entra si ya estás registrado";
	String get name_error => "Escribe un nombre válido";
}

class CodeAuthMessages_es extends CodeAuthMessages {
	final AuthMessages_es _parent;
	const CodeAuthMessages_es(this._parent):super(_parent);
	String get hint => "000 000";
	String get not_sent_error => "Hubo un error al enviar el código de verificación";
	String get error => "Introduce un código de 6 dígitos válido";
	String get resendHint => "Te enviamos un SMS a tu teléfono con un código de verificación. ¿Lo recibiste?";
	String get phoneNumberVerificationMessage => "Usaremos el número que nos proporciones para mandarte un SMS de verificación.";
	String get code => "Introduce tu código de confirmación";
	String get resendQuestion => "¿No lo has recibido?";
	String resendConfirmation(String fullPhoneNumber) => "Te hemos enviado un SMS al <b>$fullPhoneNumber</b>";
	String get incorrectCodeError => "Los códigos no coinciden";
	String get resendAction => "Reenviar código";
	String get send => "Enviar código";
	String resendProblem(String url) => "¿Tienes problemas? <a href='$url'>Contáctanos via WhatsApp</a>";
}

class Auth_homeAuthMessages_es extends Auth_homeAuthMessages {
	final AuthMessages_es _parent;
	const Auth_homeAuthMessages_es(this._parent):super(_parent);
	String get sign_in => "Entrar";
	String sign_in_hint(String brandName) => "Si ya tienes una cuenta en $brandName";
	String welcome_subtitle(String appName) => "$appName te ayudará con cualquier duda o problema sobre la salud de tus animales";
	String log_in_alternative(String url) => "¿Ya tienes cuenta? <a href='$url'>Inicia sesión</a>";
	String get presentation => "Disfruta de la <br><b>salud de tu mascota</b>";
	String sign_up(String brandName) => "Comienza a usar $brandName";
	String welcome_title(String appName) => "Bienvenido a $appName";
	String help_question(String appName) => "¿Cómo me puede ayudar $appName?";
	String get sign_up_hint => "Si es tu primera vez aquí";
}

class Password_recoveryAuthMessages_es extends Password_recoveryAuthMessages {
	final AuthMessages_es _parent;
	const Password_recoveryAuthMessages_es(this._parent):super(_parent);
	String get title => "Resetea tu contraseña";
	String get alertError => "Ha sucedido un error";
	String get resetPasswordButton => "Resetea mi contraseña";
	String get buttonsResetPassword => "Restablecer contraseña y log in";
	String codeSentDescription(String email) => "Te hemos enviado un código de reseteo a tu dirección de email: $email";
	String get inputEmail => "Email";
	String get subtitle => "Escribe una nueva contraseña";
	String get inputCode => "Código recibido en el email";
	String get newPasswordHint => "Escribe tu contraseña";
	String get buttonsResendCode => "¿No recibiste nada? Te volvemos a mandar el código";
	String get codeHint => "000 000";
	String get confirmNewPasswordHint => "Confirma tu nueva contraseña";
	String get buttonsSendEmail => "Mandar email de restablecimiento";
	String get inputNewPassword => "Nueva contraseña";
	String get inputConfirmNewPassword => "Confirma la nueva contraseña";
	String get alertsSuccess => "El email se ha mandado correctamente";
	String get emailHint => "Introduce tu email";
	String get passwordForgotten => "Olvidaste la contraseña";
}

class Sign_inAuthMessages_es extends Sign_inAuthMessages {
	final AuthMessages_es _parent;
	const Sign_inAuthMessages_es(this._parent):super(_parent);
	String get mail => "Email";
	String get password_error => "Contraseña inválida";
	String get password => "Contraseña";
	String get phone_number_verification_message => "Usaremos el número que nos proporciones para mandarte un SMS de verificación.";
	String get welcome_back => "Bienvenido";
	String get password_hint => "Introduce tu contraseña";
	String get credential_error => "Email o contraseña inválidos";
	String get go_to_sign_up => "Regístrate";
	String get log_in => "Entrar";
	String get mail_hint => "Escribe tu email";
	String get mail_error => "Email inválido";
}

class PhonelessDialogAuthMessages_es extends PhonelessDialogAuthMessages {
	final AuthMessages_es _parent;
	const PhonelessDialogAuthMessages_es(this._parent):super(_parent);
	String get action => "Ok";
	String get title => "Atención";
	String get content => "Para mejorar tu seguridad y proteger los datos de salud de tu mascota, necesitamos que te des de alta de nuevo usando un número de teléfono. ¡Perdona las molestias!";
}

