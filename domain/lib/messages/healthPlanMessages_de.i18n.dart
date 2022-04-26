// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'healthPlanMessages.i18n.dart';

String get _languageCode => 'de';
String get _localeName => 'de';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class HealthPlanMessages_de extends HealthPlanMessages {
	const HealthPlanMessages_de();
	String get myPlan => "Mein Plan";
	ReviewHealthPlanMessages_de get review => ReviewHealthPlanMessages_de(this);
	String get barkibuPlansMoreInfo => "Was sind Barkibu Gesundheitspläne?";
	String get showMoreBenefits => "Alle Vorteile anzeigen";
	String get glSubtitle => "Bis zu 125.000€ jährlich";
	String get free => "Kostenlos";
	PetHealthPlanHealthPlanMessages_de get petHealthPlan => PetHealthPlanHealthPlanMessages_de(this);
	HealthHealthPlanMessages_de get health => HealthHealthPlanMessages_de(this);
	String get currentPlan => "Derzeitiger Plan";
	String get healthSubtitle => "Bis zu 3.000€ jährlich";
	String get buyHealthPlan => "<p> Um mit einem Tierarzt zu sprechen, benötigen Sie unsere <b>Digital Vet Premium</b> oder <b>Gesundheitspläne</b> </p> <p>. Finden Sie unsere Angebote unter <a> Barkibu Health Plans </a> und finden Sie alle Funktionen von Barkibu Assistant </p>";
	String get paymentDetails => "Zahlungsdetails";
	String get yearlyPayment => "Jährliche Zahlung von";
	DigitalVetHealthPlanMessages_de get digitalVet => DigitalVetHealthPlanMessages_de(this);
	String get from => "Von";
	String get buyNow => "Kaufe es jetzt";
	String get phoneVetSubtitle => "Sprechen Sie mit einem Tierarzt, wenn Sie es brauchen";
	String get healthTitle => "Decken Sie Ihre Tierarztkosten";
	String get title => "Gesundheitspläne";
	String get subTitle => "Die Veterinärversicherung der Zukunft ohne Komplikationen";
	String get glTitle => "Gesetzliche unvorhergesehene Deckung";
	String get monthly => "monatlich";
	String get phoneVetTitle => "Telefon Tierarzt";
	String get faq => "";
	String get buy => "Kaufen";
	String get healthContactUs => "";
	HealthPlanDetailsHealthPlanMessages_de get healthPlanDetails => HealthPlanDetailsHealthPlanMessages_de(this);
}

class ReviewHealthPlanMessages_de extends ReviewHealthPlanMessages {
	final HealthPlanMessages_de _parent;
	const ReviewHealthPlanMessages_de(this._parent):super(_parent);
	String get user2Name => "";
	String get title => "";
	String get user1Name => "";
	String get user1Comment => "";
	String get user2Comment => "";
}

class PetHealthPlanHealthPlanMessages_de extends PetHealthPlanHealthPlanMessages {
	final HealthPlanMessages_de _parent;
	const PetHealthPlanHealthPlanMessages_de(this._parent):super(_parent);
	String get createClaim => "Neuen Anspruch erstellen";
	String get title => "Dein Plan";
	String get showPlans => "Pläne anzeigen";
	String get help => "Hilfe- und Planungsdetails";
	String get expirationDate => "Gültig bis";
	String subTitle(String petName) => "Verwalten Sie den Plan, den Sie für $petName haben";
	String get requestRefund => "";
	String get forever => "Für immer";
}

class HealthHealthPlanMessages_de extends HealthHealthPlanMessages {
	final HealthPlanMessages_de _parent;
	const HealthHealthPlanMessages_de(this._parent):super(_parent);
	String get bodySubtitle => "1 bis 3 Haustiere benötigen jedes Jahr eine Notfall-Tierarztbehandlung";
	String get appBarSubtitle => "Barkibus Krankenversicherung";
	String get appBarTitle => "Decken Sie Ihre Tierarztkosten";
	String get bodyTitle => "Schnelle Rückerstattungen und in jeder Klinik bis zu 3000€ erhalten Sie in nur 2-3 Tagen mindestens 80% der Kosten.";
}

class DigitalVetHealthPlanMessages_de extends DigitalVetHealthPlanMessages {
	final HealthPlanMessages_de _parent;
	const DigitalVetHealthPlanMessages_de(this._parent):super(_parent);
	String get bodyTitle => "Sprechen Sie direkt mit den Tierärzten per Telefon, Chat oder Video";
	String get appBarTitle => "Fragen Sie Ihren Telefon-Tierarzt";
	String get appBarSubtitle => "Digitaler Tierarzt";
	String get bodySubtitle => "1 von 4 Haustieren beugt schweren Krankheiten durch schnelle Tierarztberatung vor";
}

class HealthPlanDetailsHealthPlanMessages_de extends HealthPlanDetailsHealthPlanMessages {
	final HealthPlanMessages_de _parent;
	const HealthPlanDetailsHealthPlanMessages_de(this._parent):super(_parent);
	String get infoHeader => "Ein Tierarzt wird alle Ihre Fragen beantworten, ohne Ihr Zuhause zu verlassen";
	String get title => "Leistungen";
}

