// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'petProfileMessages.i18n.dart';

String get _languageCode => 'de';
String get _localeName => 'de';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class PetProfileMessages_de extends PetProfileMessages {
	const PetProfileMessages_de();
	DogCharacteristicsSeniorPetProfileMessages_de get dogCharacteristicsSenior => DogCharacteristicsSeniorPetProfileMessages_de(this);
	FormFieldsHintPetProfileMessages_de get formFieldsHint => FormFieldsHintPetProfileMessages_de(this);
	HistoryPetProfileMessages_de get history => HistoryPetProfileMessages_de(this);
	PetRangePetProfileMessages_de get petRange => PetRangePetProfileMessages_de(this);
	ClaimsPetProfileMessages_de get claims => ClaimsPetProfileMessages_de(this);
	FormFieldsTitlePetProfileMessages_de get formFieldsTitle => FormFieldsTitlePetProfileMessages_de(this);
	PetCharacteristicsYoungPetProfileMessages_de get petCharacteristicsYoung => PetCharacteristicsYoungPetProfileMessages_de(this);
	ClinicalHistorySectionPetProfileMessages_de get clinicalHistorySection => ClinicalHistorySectionPetProfileMessages_de(this);
	String get gallery => "Galerie";
	MyClinicSectionPetProfileMessages_de get myClinicSection => MyClinicSectionPetProfileMessages_de(this);
	String get assessments => "Bewertungen";
	PetCharacteristicsSeniorPetProfileMessages_de get petCharacteristicsSenior => PetCharacteristicsSeniorPetProfileMessages_de(this);
	DeletePetDialogPetProfileMessages_de get deletePetDialog => DeletePetDialogPetProfileMessages_de(this);
	InteractionsPetProfileMessages_de get interactions => InteractionsPetProfileMessages_de(this);
	String clinicalHistorySubtitle(String date) => "Letzte Aktualisierung: <b>$date</b>";
	String petProfileCompletion(int percentage) => "$percentage% Abgeschlossen";
	String get deletePetButton => "Löschen Sie dieses Haustierprofil";
	FeedbackPetProfileMessages_de get feedback => FeedbackPetProfileMessages_de(this);
	PetCharacteristicsNewbornPetProfileMessages_de get petCharacteristicsNewborn => PetCharacteristicsNewbornPetProfileMessages_de(this);
	PetCharacteristicsAdultPetProfileMessages_de get petCharacteristicsAdult => PetCharacteristicsAdultPetProfileMessages_de(this);
	String get assessmentHistory => "Bewertungsverlauf";
	ConsultationsHelpPetProfileMessages_de get consultationsHelp => ConsultationsHelpPetProfileMessages_de(this);
	String get reports => "Berichte";
	String get assessment => "Bewertung";
	CatCharacteristicsSeniorPetProfileMessages_de get catCharacteristicsSenior => CatCharacteristicsSeniorPetProfileMessages_de(this);
	String get editPhoto => "";
	ButtonsNavigationPetProfileMessages_de get buttonsNavigation => ButtonsNavigationPetProfileMessages_de(this);
	AgePetProfileMessages_de get age => AgePetProfileMessages_de(this);
	String get details => "Einzelheiten";
	String get consultationsTitle => "Ihre Beratungen";
	String get clinicalHistory => "Krankengeschichte";
	String consultationsSubtitle(String name) => "Sagen Sie uns, welche Symptome $name hat. Sie erhalten einen detaillierten Tierarztbericht";
	String get camera => "Kamera";
	AgeEstimationPetProfileMessages_de get ageEstimation => AgeEstimationPetProfileMessages_de(this);
	String get clinicalHistoryNoConsultations => "Keine Konsultationen verfügbar";
	String get exportData => "Gesundheitsdaten exportieren";
	CountersPetProfileMessages_de get counters => CountersPetProfileMessages_de(this);
	String get petDetails => "Haustier Details";
	String get uploadPhoto => "Foto hochladen";
	String get emptyPets => "Es sind noch keine Haustiere registriert.\n Um eines hinzuzufügen, starten Sie eine Bewertung.";
	String get title => "Meine Haustiere";
	String get petDetailsSubtitle => "Haustierprofil";
	String get subtitle => "Die Profile Ihres Haustieres";
	String get createPetHint => "Erstellen Sie hier ein Profil für Ihr Haustier!";
	String get unknown => "Unbekannt";
	String get breedsNotFound => "Keine Rassen gefunden";
	String get newAssessment => "Neue Einschätzung";
	String get consultationsSeeAll => "Alle Konsultationen anzeigen";
	String clinicalHistoryTitle(String petName) => "Siehe den Verlauf von $petName";
}

class DogCharacteristicsSeniorPetProfileMessages_de extends DogCharacteristicsSeniorPetProfileMessages {
	final PetProfileMessages_de _parent;
	const DogCharacteristicsSeniorPetProfileMessages_de(this._parent):super(_parent);
	String get greyHair => "Graue Haare um die Schnauze und die Augenbrauen";
	String get forgetfull => "Kann ohne Grund vergesslich erscheinen, herumlaufen oder bellen";
	String get slow => "Stehen Sie langsam auf, legen Sie sich hin und / oder gehen Sie";
}

class FormFieldsHintPetProfileMessages_de extends FormFieldsHintPetProfileMessages {
	final PetProfileMessages_de _parent;
	const FormFieldsHintPetProfileMessages_de(this._parent):super(_parent);
	String get age => "Stellen Sie das Alter Ihres Haustieres ein";
	String get chipNumber => "Geben Sie die Nummer Ihres Haustierchips ein";
	String get spayed => "Ist kastriert?";
	String get sex => "Wählen Sie das Geschlecht Ihres Haustieres";
	String get species => "Wählen Sie Ihre Haustierart";
	String get size => "Welche Größe hat Ihr Haustier?";
	String get castrated => "Ist kastriert?";
	String get breed => "Wählen Sie seine Rasse";
	String get name => "Geben Sie den Namen Ihres Haustieres ein";
}

class HistoryPetProfileMessages_de extends HistoryPetProfileMessages {
	final PetProfileMessages_de _parent;
	const HistoryPetProfileMessages_de(this._parent):super(_parent);
	VirtualVetHistoryPetProfileMessages_de get virtualVet => VirtualVetHistoryPetProfileMessages_de(this);
	String get title => "Geschichte";
	NutritionHistoryPetProfileMessages_de get nutrition => NutritionHistoryPetProfileMessages_de(this);
	AskAVetDirectlyHistoryPetProfileMessages_de get askAVetDirectly => AskAVetDirectlyHistoryPetProfileMessages_de(this);
}

class VirtualVetHistoryPetProfileMessages_de extends VirtualVetHistoryPetProfileMessages {
	final HistoryPetProfileMessages_de _parent;
	const VirtualVetHistoryPetProfileMessages_de(this._parent):super(_parent);
	String get subtitle => "Konsultationen";
	String get title => "Virtueller Tierarzt";
}

class NutritionHistoryPetProfileMessages_de extends NutritionHistoryPetProfileMessages {
	final HistoryPetProfileMessages_de _parent;
	const NutritionHistoryPetProfileMessages_de(this._parent):super(_parent);
	String get title => "Ernährung";
	String get subtitle => "Empfehlungen";
}

class AskAVetDirectlyHistoryPetProfileMessages_de extends AskAVetDirectlyHistoryPetProfileMessages {
	final HistoryPetProfileMessages_de _parent;
	const AskAVetDirectlyHistoryPetProfileMessages_de(this._parent):super(_parent);
	String get title => "Fragen Sie einen Tierarzt";
	String get subtitle => "Gespräche";
}

class PetRangePetProfileMessages_de extends PetRangePetProfileMessages {
	final PetProfileMessages_de _parent;
	const PetRangePetProfileMessages_de(this._parent):super(_parent);
	String get kitten => "Kätzchen";
	String get adult => "Erwachsene";
	String get senior => "Senior";
	String get young => "Jung";
	String get puppy => "Hündchen";
}

class ClaimsPetProfileMessages_de extends ClaimsPetProfileMessages {
	final PetProfileMessages_de _parent;
	const ClaimsPetProfileMessages_de(this._parent):super(_parent);
	HasClaimStateClaimsPetProfileMessages_de get hasClaimState => HasClaimStateClaimsPetProfileMessages_de(this);
	EmptyStateClaimsPetProfileMessages_de get emptyState => EmptyStateClaimsPetProfileMessages_de(this);
	UpsellClaimsPetProfileMessages_de get upsell => UpsellClaimsPetProfileMessages_de(this);
	String get title => "Ansprüche";
	String get requestNewRefund => "";
}

class HasClaimStateClaimsPetProfileMessages_de extends HasClaimStateClaimsPetProfileMessages {
	final ClaimsPetProfileMessages_de _parent;
	const HasClaimStateClaimsPetProfileMessages_de(this._parent):super(_parent);
	String get mainText => "";
	String get secondaryText => "";
}

class EmptyStateClaimsPetProfileMessages_de extends EmptyStateClaimsPetProfileMessages {
	final ClaimsPetProfileMessages_de _parent;
	const EmptyStateClaimsPetProfileMessages_de(this._parent):super(_parent);
	String get mainText => "Sie haben noch keine Rückerstattung beantragt";
	String get secondaryText => "Sie können den Status der Rückerstattung Ihrer Veterinärkosten anzeigen und überprüfen";
	String get hint => "80% der Deckung bis zu 3000€ pro Jahr\n100% in Kliniken Kivet";
}

class UpsellClaimsPetProfileMessages_de extends UpsellClaimsPetProfileMessages {
	final ClaimsPetProfileMessages_de _parent;
	const UpsellClaimsPetProfileMessages_de(this._parent):super(_parent);
	String buyHealthPlan(String petName) => "";
}

class FormFieldsTitlePetProfileMessages_de extends FormFieldsTitlePetProfileMessages {
	final PetProfileMessages_de _parent;
	const FormFieldsTitlePetProfileMessages_de(this._parent):super(_parent);
	String get neutered => "Kastriert";
	String get name => "Name";
	String get breed => "Rasse";
	String get species => "Spezies";
	String get size => "Größe";
	String get birthdate => "Geburtsdatum";
	String get castrated => "Kastriert";
	String get chipNumber => "Chipnummer";
	String get spayed => "Kastriert";
	String get sex => "Sex";
}

class PetCharacteristicsYoungPetProfileMessages_de extends PetCharacteristicsYoungPetProfileMessages {
	final PetProfileMessages_de _parent;
	const PetCharacteristicsYoungPetProfileMessages_de(this._parent):super(_parent);
	String get playfull => "Sehr verspielt";
	String get brightEyes => "Helle Augen und immer neugierig";
	String get neverTired => "Scheint nicht müde zu werden, wenn man läuft";
	String get brightTeeth => "Sehr hellweiße Zähne";
}

class ClinicalHistorySectionPetProfileMessages_de extends ClinicalHistorySectionPetProfileMessages {
	final PetProfileMessages_de _parent;
	const ClinicalHistorySectionPetProfileMessages_de(this._parent):super(_parent);
	EmptyStateClinicalHistorySectionPetProfileMessages_de get emptyState => EmptyStateClinicalHistorySectionPetProfileMessages_de(this);
	String get description => "Berichte über Ihre Konsultationen";
	String get selectorDate => "Datum";
	String get report => "Beurteilung";
	String get consultation => "Beratung";
	String get title => "Konsultationen";
	String get consultations => "Konsultationen";
	String get selectorType => "Art";
}

class EmptyStateClinicalHistorySectionPetProfileMessages_de extends EmptyStateClinicalHistorySectionPetProfileMessages {
	final ClinicalHistorySectionPetProfileMessages_de _parent;
	const EmptyStateClinicalHistorySectionPetProfileMessages_de(this._parent):super(_parent);
	String get hint => "Immer da, wenn Sie es brauchen";
	String get secondaryText => "Sie können Ihr Haustier schnell und einfach kostenlos untersuchen";
	String get mainText => "Sie haben noch keine Konsultationen";
}

class MyClinicSectionPetProfileMessages_de extends MyClinicSectionPetProfileMessages {
	final PetProfileMessages_de _parent;
	const MyClinicSectionPetProfileMessages_de(this._parent):super(_parent);
	String get myClinic => "Meine Klinik";
	String get myClinicSubtitle => "Fügen Sie Ihre Hauptklinik hinzu";
	String get myClinicAdd => "Fügen Sie eine Klinik hinzu";
	String get verify => "Wir werden Ihre Klinik persönlich überprüfen";
	String get customClinicHint => "Schreiben Sie Ihre Klinikdetails";
	String get myClinicSheetHeader => "Wählen Sie Ihre Klinik aus";
	String get myClinicSubtitleEdit => "Bearbeiten Sie Ihre Hauptklinik";
	String get myClinicHint => "Wählen";
	String get myClinicSheetInputHint => "Suchen Sie Ihre Klinik";
	String get myClinicSheetButton => "Fügen Sie eine benutzerdefinierte Klinik hinzu";
	String get myClinicAddress => "Adresse";
}

class PetCharacteristicsSeniorPetProfileMessages_de extends PetCharacteristicsSeniorPetProfileMessages {
	final PetProfileMessages_de _parent;
	const PetCharacteristicsSeniorPetProfileMessages_de(this._parent):super(_parent);
	String get muscleWastage => "Muskelschwund, knarrende oder steife Gelenke";
	String get missTeeth => "Fehlende oder lose Zähne";
}

class DeletePetDialogPetProfileMessages_de extends DeletePetDialogPetProfileMessages {
	final PetProfileMessages_de _parent;
	const DeletePetDialogPetProfileMessages_de(this._parent):super(_parent);
	String get title => "Möchten Sie Ihre Haustierdaten löschen?";
	String get body => "Diese Aktion löscht Ihre Haustierinformationen dauerhaft";
}

class InteractionsPetProfileMessages_de extends InteractionsPetProfileMessages {
	final PetProfileMessages_de _parent;
	const InteractionsPetProfileMessages_de(this._parent):super(_parent);
	EmptyStateInteractionsPetProfileMessages_de get emptyState => EmptyStateInteractionsPetProfileMessages_de(this);
	String consultation(String id) => "Beratung $id";
	String get subtitle => "Hier sehen Sie die Konsultationen, die Sie per Chat, E-Mail oder Telefon durchgeführt haben";
	String get title => "Telefonische Konsultationen";
}

class EmptyStateInteractionsPetProfileMessages_de extends EmptyStateInteractionsPetProfileMessages {
	final InteractionsPetProfileMessages_de _parent;
	const EmptyStateInteractionsPetProfileMessages_de(this._parent):super(_parent);
	String get hint => "Von Montag bis Freitag zwischen 9 und 16 Uhr";
	String get secondaryText => "Sie haben uneingeschränkten Zugang zu zertifizierten Tierärzten per Chat, Telefonanruf oder Video für nur 2,5€ / Monat";
	String get mainText => "Sie haben noch nicht mit unseren Tierärzten gesprochen";
}

class FeedbackPetProfileMessages_de extends FeedbackPetProfileMessages {
	final PetProfileMessages_de _parent;
	const FeedbackPetProfileMessages_de(this._parent):super(_parent);
	String get subtitle => "Bei Barkibu arbeiten mehr als 30 Menschen hart daran, die beste Gesundheits-App für unsere Haustiere zu entwickeln.";
	String link(String petName) => "Ihre Meinung wird uns helfen, diese App zu verbessern. <a> Könnten Sie uns bitte bei der Beantwortung dieser Fragen helfen? </a>";
	String title(String petName) => "Helfen Sie uns, das Wohlbefinden Ihrer Haustiere zu verbessern";
}

class PetCharacteristicsNewbornPetProfileMessages_de extends PetCharacteristicsNewbornPetProfileMessages {
	final PetProfileMessages_de _parent;
	const PetCharacteristicsNewbornPetProfileMessages_de(this._parent):super(_parent);
	String get cute => "Sehr süßer babyähnlicher Ausdruck auf ihrem Gesicht";
	String get bigBodyParts => "Ihre Beine, Pfoten und Ohren wirken etwas zu groß";
	String get playfull => "Sehr verspielt und sehr neugierig";
}

class PetCharacteristicsAdultPetProfileMessages_de extends PetCharacteristicsAdultPetProfileMessages {
	final PetProfileMessages_de _parent;
	const PetCharacteristicsAdultPetProfileMessages_de(this._parent):super(_parent);
	String get energetic => "Energetisch und verspielt";
	String get likesToRest => "Hat gerne Ruhezeit";
	String get balancedBehaviour => "Ausgewogenes Verhalten";
}

class ConsultationsHelpPetProfileMessages_de extends ConsultationsHelpPetProfileMessages {
	final PetProfileMessages_de _parent;
	const ConsultationsHelpPetProfileMessages_de(this._parent):super(_parent);
	String content(String petName) => "";
	String get title => "";
}

class CatCharacteristicsSeniorPetProfileMessages_de extends CatCharacteristicsSeniorPetProfileMessages {
	final PetProfileMessages_de _parent;
	const CatCharacteristicsSeniorPetProfileMessages_de(this._parent):super(_parent);
	String get notBrightSkin => "Fell und Haut sind nicht so hell, etwas stumpf, matt oder fettig";
	String get relucantToJump => "Ich zögere es, an Orte zu springen, an denen sie es früher konnten";
	String get forgetfull => "Kann ohne Grund vergesslich erscheinen, herumlaufen oder vokalisieren";
}

class ButtonsNavigationPetProfileMessages_de extends ButtonsNavigationPetProfileMessages {
	final PetProfileMessages_de _parent;
	const ButtonsNavigationPetProfileMessages_de(this._parent):super(_parent);
	String get assistant => "Assistent";
}

class AgePetProfileMessages_de extends AgePetProfileMessages {
	final PetProfileMessages_de _parent;
	const AgePetProfileMessages_de(this._parent):super(_parent);
	String friendly(int year, int month) => "${year > 0? (year.toString() + 'Jahre'): (month.toString() + 'Monate')} alt";
	String born(String formattedDate) => "";
	String dog(String age) => "$age Hund";
	String cat(String age) => "$age Katze";
}

class AgeEstimationPetProfileMessages_de extends AgeEstimationPetProfileMessages {
	final PetProfileMessages_de _parent;
	const AgeEstimationPetProfileMessages_de(this._parent):super(_parent);
	String title(String species) => "Wie finde ich das Alter meiner $species heraus?";
}

class CountersPetProfileMessages_de extends CountersPetProfileMessages {
	final PetProfileMessages_de _parent;
	const CountersPetProfileMessages_de(this._parent):super(_parent);
	String get claims => "Rückerstattungen";
	String get vet_consultations => "Telefonische Konsultationen";
	String get assessments => "24 Stunden \n Konsultationen";
}

