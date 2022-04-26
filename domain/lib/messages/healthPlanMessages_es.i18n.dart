// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'healthPlanMessages.i18n.dart';

String get _languageCode => 'es';
String get _localeName => 'es';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class HealthPlanMessages_es extends HealthPlanMessages {
	const HealthPlanMessages_es();
	String get myPlan => "Mi plan";
	ReviewHealthPlanMessages_es get review => ReviewHealthPlanMessages_es(this);
	String get barkibuPlansMoreInfo => "¿Qué son los Planes de Salud Barkibu?";
	String get showMoreBenefits => "Ver todos los beneficios";
	String get glSubtitle => "Hasta 125000€ al año";
	String get free => "Gratis";
	PetHealthPlanHealthPlanMessages_es get petHealthPlan => PetHealthPlanHealthPlanMessages_es(this);
	HealthHealthPlanMessages_es get health => HealthHealthPlanMessages_es(this);
	String get currentPlan => "Plan Actual";
	String get healthSubtitle => "Hasta 3.000€ al año";
	String get buyHealthPlan => "<p>Para hablar con un veterinario necesitas nuestros planes <b>Digital Vet Premium</b> o <b>Seguro de Salud</b></p><p>Descubre nuestras ofertas en <a>Planes de Salud Barkibu</a> y descubre todas las funcionalidades de Barkibu Assistant</p>";
	String get paymentDetails => "Detalles de pago";
	String get yearlyPayment => "Pago anual de";
	DigitalVetHealthPlanMessages_es get digitalVet => DigitalVetHealthPlanMessages_es(this);
	String get from => "Desde";
	String get buyNow => "Cómpralo ya";
	String get phoneVetSubtitle => "Habla con un vet cuando lo necesites";
	String get healthTitle => "Cubre tus gastos veterinarios";
	String get title => "Planes de Salud";
	String get subTitle => "El seguro veterinario del futuro, sin complicaciones";
	String get glTitle => "Cubre imprevistos legales";
	String get monthly => "al mes";
	String get phoneVetTitle => "Veterinario telefónico";
	String get faq => "Preguntas Frecuentes";
	String get buy => "Comprar";
	String get healthContactUs => "Contáctanos por whatsapp";
	HealthPlanDetailsHealthPlanMessages_es get healthPlanDetails => HealthPlanDetailsHealthPlanMessages_es(this);
}

class ReviewHealthPlanMessages_es extends ReviewHealthPlanMessages {
	final HealthPlanMessages_es _parent;
	const ReviewHealthPlanMessages_es(this._parent):super(_parent);
	String get user2Name => "Víctor Hernández";
	String get title => "¿Qué dicen los usuarios de nosotros?";
	String get user1Name => "Lucía González";
	String get user1Comment => "Nos ha dado la tranquilidad y seguridad que necesitamos. El seguro vale para cualquier clínica y Sirius está en las mejores manos ante cualquier imprevisto.";
	String get user2Comment => "Viajo mucho y siempre me llevo a mi perro conmigo. Me aporta tranquilidad tener acceso a un veterinario esté donde esté.";
}

class PetHealthPlanHealthPlanMessages_es extends PetHealthPlanHealthPlanMessages {
	final HealthPlanMessages_es _parent;
	const PetHealthPlanHealthPlanMessages_es(this._parent):super(_parent);
	String get createClaim => "Crear nueva reclamación";
	String get title => "Tu Plan";
	String get showPlans => "Ver Planes";
	String get help => "Ayuda y detalles del Plan";
	String get expirationDate => "Válido Hasta";
	String subTitle(String petName) => "Gestiona el Plan que tienes para $petName";
	String get requestRefund => "Solicitar un reembolso";
	String get forever => "Para siempre";
}

class HealthHealthPlanMessages_es extends HealthHealthPlanMessages {
	final HealthPlanMessages_es _parent;
	const HealthHealthPlanMessages_es(this._parent):super(_parent);
	String get bodySubtitle => "1 de cada 3 mascotas necesita tratamiento veterinario de emergencia  cada año";
	String get appBarSubtitle => "Seguro de salud Barkibu";
	String get appBarTitle => "Cubre tus gastos veterinarios";
	String get bodyTitle => "Reembolsos rápidos y en cualquier clínica hasta 3000€ al año, recibe al menos el 80% del gasto en tan solo 2-3 días.";
}

class DigitalVetHealthPlanMessages_es extends DigitalVetHealthPlanMessages {
	final HealthPlanMessages_es _parent;
	const DigitalVetHealthPlanMessages_es(this._parent):super(_parent);
	String get bodyTitle => "Habla directamente con veterinarios colegiados por llamada, chat o video";
	String get appBarTitle => "Pregunta a tu veterinario telefónico";
	String get appBarSubtitle => "Veterinario digital";
	String get bodySubtitle => "1 de cada 4 mascotas previene enfermedades graves por un rápido asesoramiento veterinario";
}

class HealthPlanDetailsHealthPlanMessages_es extends HealthPlanDetailsHealthPlanMessages {
	final HealthPlanMessages_es _parent;
	const HealthPlanDetailsHealthPlanMessages_es(this._parent):super(_parent);
	String get infoHeader => "Un veterinario colegiado responderá a todas tus preguntas sin salir de tu casa";
	String get title => "Beneficios";
}

