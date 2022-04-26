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

class HealthPlanMessages {
	const HealthPlanMessages();
	String get myPlan => "My plan";
	ReviewHealthPlanMessages get review => ReviewHealthPlanMessages(this);
	String get barkibuPlansMoreInfo => "What are Barkibu health plans?";
	String get showMoreBenefits => "See all benefits";
	String get glSubtitle => "Up to 125.000€ yearly";
	String get free => "Free";
	PetHealthPlanHealthPlanMessages get petHealthPlan => PetHealthPlanHealthPlanMessages(this);
	HealthHealthPlanMessages get health => HealthHealthPlanMessages(this);
	String get currentPlan => "Current Plan";
	String get healthSubtitle => "Up to 3.000€ yearly";
	String get buyHealthPlan => "<p>To talk with a Vet you need our <b>Digital Vet Premium</b> or <b>Health</b> plans</p><p>Find our offers on <a>Barkibu Health Plans</a> and find all the functionalities of Barkibu Assistant</p>";
	String get paymentDetails => "PaymentDetails";
	String get yearlyPayment => "Annual payment of ";
	DigitalVetHealthPlanMessages get digitalVet => DigitalVetHealthPlanMessages(this);
	String get from => "From";
	String get buyNow => "Buy it now";
	String get phoneVetSubtitle => "Talk with a vet when you need it";
	String get healthTitle => "Cover your vet expenses";
	String get title => "Health Plans";
	String get subTitle => "The veterinary insurance of the future, without complications";
	String get glTitle => "Cover legal unforeseen";
	String get monthly => "monthly";
	String get phoneVetTitle => "Phone Vet";
	String get faq => "Frequently asked questions";
	String get buy => "Buy";
	String get healthContactUs => "Contact us via whatsapp";
	HealthPlanDetailsHealthPlanMessages get healthPlanDetails => HealthPlanDetailsHealthPlanMessages(this);
}

class ReviewHealthPlanMessages {
	final HealthPlanMessages _parent;
	const ReviewHealthPlanMessages(this._parent);
	String get user2Name => "Víctor Hernández";
	String get title => "What do users say about us?";
	String get user1Name => "Lucía González";
	String get user1Comment => "Nos ha dado la tranquilidad y seguridad que necesitamos. El seguro vale para cualquier clínica y Sirius está en las mejores manos ante cualquier imprevisto.";
	String get user2Comment => "Viajo mucho y siempre me llevo a mi perro conmigo. Me aporta tranquilidad tener acceso a un veterinario esté donde esté.";
}

class PetHealthPlanHealthPlanMessages {
	final HealthPlanMessages _parent;
	const PetHealthPlanHealthPlanMessages(this._parent);
	String get createClaim => "Create new claim";
	String get title => "Your Plan";
	String get showPlans => "Show Plans";
	String get help => "Help and Plan details";
	String get expirationDate => "Valid Until";
	String subTitle(String petName) => "Manage the Plan you have for $petName";
	String get requestRefund => "Request a refund";
	String get forever => "Forever";
}

class HealthHealthPlanMessages {
	final HealthPlanMessages _parent;
	const HealthHealthPlanMessages(this._parent);
	String get bodySubtitle => "1 to 3 pets need emergency vet treatment each year";
	String get appBarSubtitle => "Barkibu's health insurance";
	String get appBarTitle => "Cover your vet expenses";
	String get bodyTitle => "Fast refundings and in any clinic up to 3000€, receive at least 80% of the expense in only 2-3 days.";
}

class DigitalVetHealthPlanMessages {
	final HealthPlanMessages _parent;
	const DigitalVetHealthPlanMessages(this._parent);
	String get bodyTitle => "Talk directly with collegiated vets by phone, chat or video";
	String get appBarTitle => "Ask your phone vet";
	String get appBarSubtitle => "Digital vet";
	String get bodySubtitle => "1 out of 4 pets prevent severe diseases due to fast vet advice";
}

class HealthPlanDetailsHealthPlanMessages {
	final HealthPlanMessages _parent;
	const HealthPlanDetailsHealthPlanMessages(this._parent);
	String get infoHeader => "A vet will answer all your questions without leaving your home";
	String get title => "Benefits";
}

