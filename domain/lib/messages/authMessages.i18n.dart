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

class AuthMessages {
	const AuthMessages();
	Sign_upAuthMessages get sign_up => Sign_upAuthMessages(this);
	CodeAuthMessages get code => CodeAuthMessages(this);
	Auth_homeAuthMessages get auth_home => Auth_homeAuthMessages(this);
	Password_recoveryAuthMessages get password_recovery => Password_recoveryAuthMessages(this);
	Sign_inAuthMessages get sign_in => Sign_inAuthMessages(this);
	PhonelessDialogAuthMessages get phonelessDialog => PhonelessDialogAuthMessages(this);
}

class Sign_upAuthMessages {
	final AuthMessages _parent;
	const Sign_upAuthMessages(this._parent);
	String get phone_number_error => "Enter a valid phone number";
	String terms_and_privacy(String brandName, String termsUrl, String privacyUrl) => "By continuing you accept $brandName's <a href='$termsUrl'>Terms and Conditions</a> and <a href='$privacyUrl'>Privacy policy</a>";
	String marketing_optin_acknowledgement(String marketingBrandName, String affiliatesUrl) => "By clicking \"Sign Up\", you are indicating you would like to hear from $marketingBrandName and its <a  href='$affiliatesUrl'>affiliates</a> with special offers, the latest about $marketingBrandName products and more.";
	String data_privacy_policy(String privacyUrl) => "Must be 16 or older to subscribe and may unsubscribe at any time. We may use your data for research to improve our offerings; see our <a  href='$privacyUrl'>Privacy Policy</a> for details about how we use your data.";
	String get email => "E-mail";
	String get lastname_error => "Enter a valid last name";
	String get lastname_hint => "Enter your last name";
	String get email_error => "Enter a valid e-mail address";
	String get password => "Password";
	String get sign_up => "Sign up";
	String get prefix => "Country code";
	String get phone_not_found => "This phone number isn’t registered yet";
	String get go_back => "Return";
	String get name => "Name";
	String get terms_and_condition_url => "https://www.barkibu.com/en-us/legal-notice";
	String get phone_not_verified_error => "There was an error while verifying your phone number";
	String get create_account_email => "Create an account using your email address";
	String get create_account_phone => "Create an account using your mobile number";
	String get name_hint => "Enter your first name";
	String get general_error => "An error occured";
	String get confirm_password_error => "Passwords doesn’t match";
	String get email_tab => "Email";
	String get phone_number_prefix_hint => "Enter your phone number country code";
	String get invalid_phone_error => "The phone number you entered is invalid";
	String get action => "Sign up";
	String get lastname => "Last Name";
	String get password_hint => "Enter your password";
	String get confirm_password => "Confirm";
	String get phone_number_hint => "Enter your phone number";
	String get password_error => "Enter a valid password";
	String get phone_tab => "Phone";
	String get phone_number_prefix_error => "Enter a valid phone number country code";
	String get phone_number => "Phone number";
	String get accept_terms_error => "You must accept our terms";
	String get privacy_url => "https://www.barkibu.com/en-us/legal-notice";
	String get email_hint => "Enter your e-mail address";
	String get create_account => "Create your account";
	String get confirm_password_hint => "Confirm your password";
	String get accept_terms => "Accept terms";
	String get phone_number_prefix => "Phone number country code";
	String get go_to_sign_in => "Or Sign In if you already have an account";
	String get name_error => "Enter a valid name";
}

class CodeAuthMessages {
	final AuthMessages _parent;
	const CodeAuthMessages(this._parent);
	String get hint => "000 000";
	String get not_sent_error => "There was an error while sending verification code";
	String get error => "Enter a valid 6-digit code";
	String get resendHint => "We sent an SMS to your Phone with a verification code. Didn’t receive it?";
	String get phoneNumberVerificationMessage => "We will use the phone number you provide to send you a verification SMS.";
	String get code => "Enter your confirmation code";
	String get resendQuestion => "Didn't receive it?";
	String resendConfirmation(String fullPhoneNumber) => "We sent you a code via SMS to <b>$fullPhoneNumber</b>";
	String get incorrectCodeError => "Code didn’t match";
	String get resendAction => "Resend code";
	String get send => "Send code";
	String resendProblem(String url) => "Having problems? <a href='$url'>Contact us via WhatsApp</a>";
}

class Auth_homeAuthMessages {
	final AuthMessages _parent;
	const Auth_homeAuthMessages(this._parent);
	String get sign_in => "Sign in";
	String sign_in_hint(String brandName) => "If you already have an account with $brandName";
	String welcome_subtitle(String appName) => "$appName will help you with any doubt or problem you may have about your pet’s health";
	String log_in_alternative(String url) => "Or <a href='$url'>Log in</a> if already have an account";
	String get presentation => "Enjoy your <br><b>Pet's health</b>";
	String sign_up(String brandName) => "Start using $brandName";
	String welcome_title(String appName) => "Welcome to $appName";
	String help_question(String appName) => "How can $appName help me?";
	String get sign_up_hint => "If this is your first time with us";
}

class Password_recoveryAuthMessages {
	final AuthMessages _parent;
	const Password_recoveryAuthMessages(this._parent);
	String get title => "Reset password";
	String get alertError => "An error has occurred";
	String get resetPasswordButton => "Reset my password";
	String get buttonsResetPassword => "Reset password & log in";
	String codeSentDescription(String email) => "We have emailed a reset code to your e-mail address: $email";
	String get inputEmail => "E-mail";
	String get subtitle => "Enter a new password";
	String get inputCode => "Code Received in Email";
	String get newPasswordHint => "Type your new password";
	String get buttonsResendCode => "Not received anything? Resend code";
	String get codeHint => "000 000";
	String get confirmNewPasswordHint => "Confirm your new password";
	String get buttonsSendEmail => "Send reset email";
	String get inputNewPassword => "New Password";
	String get inputConfirmNewPassword => "Confirm New Password";
	String get alertsSuccess => "The email has been sent correctly";
	String get emailHint => "Enter your e-mail";
	String get passwordForgotten => "Have you forgotten your password?";
}

class Sign_inAuthMessages {
	final AuthMessages _parent;
	const Sign_inAuthMessages(this._parent);
	String get mail => "E-mail";
	String get password_error => "Invalid password";
	String get password => "Password";
	String get phone_number_verification_message => "We will use the phone number you provide to send you a verification SMS.";
	String get welcome_back => "Welcome back!";
	String get password_hint => "Enter your password";
	String get credential_error => "Email or password invalid";
	String get go_to_sign_up => "Don’t have an account yet? Sign up here";
	String get log_in => "Log in";
	String get mail_hint => "Enter your e-mail";
	String get mail_error => "Invalid e-mail";
}

class PhonelessDialogAuthMessages {
	final AuthMessages _parent;
	const PhonelessDialogAuthMessages(this._parent);
	String get action => "Ok";
	String get title => "Heads up!";
	String get content => "To improve your security and protect your pet health data, we need you to sign up again using a phone number. We're really sorry for the trouble!";
}

