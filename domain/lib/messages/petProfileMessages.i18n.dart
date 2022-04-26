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

class PetProfileMessages {
	const PetProfileMessages();
	DogCharacteristicsSeniorPetProfileMessages get dogCharacteristicsSenior => DogCharacteristicsSeniorPetProfileMessages(this);
	FormFieldsHintPetProfileMessages get formFieldsHint => FormFieldsHintPetProfileMessages(this);
	HistoryPetProfileMessages get history => HistoryPetProfileMessages(this);
	PetRangePetProfileMessages get petRange => PetRangePetProfileMessages(this);
	ClaimsPetProfileMessages get claims => ClaimsPetProfileMessages(this);
	FormFieldsTitlePetProfileMessages get formFieldsTitle => FormFieldsTitlePetProfileMessages(this);
	PetCharacteristicsYoungPetProfileMessages get petCharacteristicsYoung => PetCharacteristicsYoungPetProfileMessages(this);
	ClinicalHistorySectionPetProfileMessages get clinicalHistorySection => ClinicalHistorySectionPetProfileMessages(this);
	String get gallery => "Gallery";
	MyClinicSectionPetProfileMessages get myClinicSection => MyClinicSectionPetProfileMessages(this);
	String get assessments => "Assessments";
	PetCharacteristicsSeniorPetProfileMessages get petCharacteristicsSenior => PetCharacteristicsSeniorPetProfileMessages(this);
	DeletePetDialogPetProfileMessages get deletePetDialog => DeletePetDialogPetProfileMessages(this);
	InteractionsPetProfileMessages get interactions => InteractionsPetProfileMessages(this);
	String clinicalHistorySubtitle(String date) => "Last update: <b>$date</b>";
	String petProfileCompletion(int percentage) => "$percentage% Completed";
	String get deletePetButton => "Delete this Pet Profile";
	FeedbackPetProfileMessages get feedback => FeedbackPetProfileMessages(this);
	PetCharacteristicsNewbornPetProfileMessages get petCharacteristicsNewborn => PetCharacteristicsNewbornPetProfileMessages(this);
	PetCharacteristicsAdultPetProfileMessages get petCharacteristicsAdult => PetCharacteristicsAdultPetProfileMessages(this);
	String get assessmentHistory => "Assessment history";
	ConsultationsHelpPetProfileMessages get consultationsHelp => ConsultationsHelpPetProfileMessages(this);
	String get reports => "Reports";
	String get assessment => "Assessment";
	CatCharacteristicsSeniorPetProfileMessages get catCharacteristicsSenior => CatCharacteristicsSeniorPetProfileMessages(this);
	String get editPhoto => "Edit photo";
	ButtonsNavigationPetProfileMessages get buttonsNavigation => ButtonsNavigationPetProfileMessages(this);
	AgePetProfileMessages get age => AgePetProfileMessages(this);
	String get details => "Details";
	String get consultationsTitle => "Your Consultations";
	String get clinicalHistory => "Clinical History";
	String consultationsSubtitle(String name) => "Tell us what symptoms $name has. You will receive a detailed vet report";
	String get camera => "Camera";
	AgeEstimationPetProfileMessages get ageEstimation => AgeEstimationPetProfileMessages(this);
	String get clinicalHistoryNoConsultations => "No consultations available";
	String get exportData => "Export Health Data";
	CountersPetProfileMessages get counters => CountersPetProfileMessages(this);
	String get petDetails => "Pet Details";
	String get uploadPhoto => "Add photo";
	String get emptyPets => "There are no registered pets yet.\nTo add one, start an assessment.";
	String get title => "My Pets";
	String get petDetailsSubtitle => "Pet profile";
	String get subtitle => "Your pet’s profiles";
	String get createPetHint => "Create a profile for your Pet here!";
	String get unknown => "Unknown";
	String get breedsNotFound => "No breeds found";
	String get newAssessment => "New assessment";
	String get consultationsSeeAll => "See all consultations";
	String clinicalHistoryTitle(String petName) => "See $petName’s History";
}

class DogCharacteristicsSeniorPetProfileMessages {
	final PetProfileMessages _parent;
	const DogCharacteristicsSeniorPetProfileMessages(this._parent);
	String get greyHair => "Grey hairs around the muzzle and eyebrows";
	String get forgetfull => "May seem forgetful, pace around or bark for no reason";
	String get slow => "Slow to stand up, lie down and/or walk";
}

class FormFieldsHintPetProfileMessages {
	final PetProfileMessages _parent;
	const FormFieldsHintPetProfileMessages(this._parent);
	String get age => "Set your pet’s age";
	String get chipNumber => "Introduce your pet chip number";
	String get spayed => "Is spayed?";
	String get sex => "Select your pet’s sex";
	String get species => "Select your pet species";
	String get size => "What size is your pet";
	String get castrated => "Is castrated?";
	String get breed => "Select its breed";
	String get name => "Type your pet's name";
}

class HistoryPetProfileMessages {
	final PetProfileMessages _parent;
	const HistoryPetProfileMessages(this._parent);
	VirtualVetHistoryPetProfileMessages get virtualVet => VirtualVetHistoryPetProfileMessages(this);
	String get title => "history";
	NutritionHistoryPetProfileMessages get nutrition => NutritionHistoryPetProfileMessages(this);
	AskAVetDirectlyHistoryPetProfileMessages get askAVetDirectly => AskAVetDirectlyHistoryPetProfileMessages(this);
}

class VirtualVetHistoryPetProfileMessages {
	final HistoryPetProfileMessages _parent;
	const VirtualVetHistoryPetProfileMessages(this._parent);
	String get subtitle => "Consultations";
	String get title => "Virtual Vet";
}

class NutritionHistoryPetProfileMessages {
	final HistoryPetProfileMessages _parent;
	const NutritionHistoryPetProfileMessages(this._parent);
	String get title => "Nutrition";
	String get subtitle => "Recommendations";
}

class AskAVetDirectlyHistoryPetProfileMessages {
	final HistoryPetProfileMessages _parent;
	const AskAVetDirectlyHistoryPetProfileMessages(this._parent);
	String get title => "Ask a Vet";
	String get subtitle => "Conversations";
}

class PetRangePetProfileMessages {
	final PetProfileMessages _parent;
	const PetRangePetProfileMessages(this._parent);
	String get kitten => "Kitten";
	String get adult => "Adult";
	String get senior => "Senior";
	String get young => "Young";
	String get puppy => "Puppy";
}

class ClaimsPetProfileMessages {
	final PetProfileMessages _parent;
	const ClaimsPetProfileMessages(this._parent);
	HasClaimStateClaimsPetProfileMessages get hasClaimState => HasClaimStateClaimsPetProfileMessages(this);
	EmptyStateClaimsPetProfileMessages get emptyState => EmptyStateClaimsPetProfileMessages(this);
	UpsellClaimsPetProfileMessages get upsell => UpsellClaimsPetProfileMessages(this);
	String get title => "Claims";
	String get requestNewRefund => "Request a new refund";
}

class HasClaimStateClaimsPetProfileMessages {
	final ClaimsPetProfileMessages _parent;
	const HasClaimStateClaimsPetProfileMessages(this._parent);
	String get mainText => "Claim received";
	String get secondaryText => "We will get in touch with you soon";
}

class EmptyStateClaimsPetProfileMessages {
	final ClaimsPetProfileMessages _parent;
	const EmptyStateClaimsPetProfileMessages(this._parent);
	String get mainText => "You did not request any refund yet";
	String get secondaryText => "You will be able to see and review the status of the refunds of your veterinary expenses";
	String get hint => "80% of cover up to 3000€ per year\n100% en clinics Kivet";
}

class UpsellClaimsPetProfileMessages {
	final ClaimsPetProfileMessages _parent;
	const UpsellClaimsPetProfileMessages(this._parent);
	String buyHealthPlan(String petName) => "<p>You can request a refund if you contracted <a>the health plan for  $petName</a></p>";
}

class FormFieldsTitlePetProfileMessages {
	final PetProfileMessages _parent;
	const FormFieldsTitlePetProfileMessages(this._parent);
	String get neutered => "Neutered";
	String get name => "Name";
	String get breed => "Breed";
	String get species => "Species";
	String get size => "Size";
	String get birthdate => "Date of birth";
	String get castrated => "Castrated";
	String get chipNumber => "Chip number";
	String get spayed => "Spayed";
	String get sex => "Sex";
}

class PetCharacteristicsYoungPetProfileMessages {
	final PetProfileMessages _parent;
	const PetCharacteristicsYoungPetProfileMessages(this._parent);
	String get playfull => "Very playful";
	String get brightEyes => "Bright eyes and always inquisitive";
	String get neverTired => "Doesn’t seem to get tired when out for a run";
	String get brightTeeth => "Very bright white teeth";
}

class ClinicalHistorySectionPetProfileMessages {
	final PetProfileMessages _parent;
	const ClinicalHistorySectionPetProfileMessages(this._parent);
	EmptyStateClinicalHistorySectionPetProfileMessages get emptyState => EmptyStateClinicalHistorySectionPetProfileMessages(this);
	String get description => "Reports of your consultations";
	String get selectorDate => "Date";
	String get report => "Assessment Report";
	String get consultation => "Consultation";
	String get title => "Consultations";
	String get consultations => "Consultations";
	String get selectorType => "Type";
}

class EmptyStateClinicalHistorySectionPetProfileMessages {
	final ClinicalHistorySectionPetProfileMessages _parent;
	const EmptyStateClinicalHistorySectionPetProfileMessages(this._parent);
	String get hint => "Always there when you need it";
	String get secondaryText => "You will be able to do a free quick and easy check-up on your pet";
	String get mainText => "You don't have any consultations yet";
}

class MyClinicSectionPetProfileMessages {
	final PetProfileMessages _parent;
	const MyClinicSectionPetProfileMessages(this._parent);
	String get myClinic => "My clinic";
	String get myClinicSubtitle => "Add your main clinic";
	String get myClinicAdd => "Add a clinic";
	String get verify => "We will personaly verify your clinic";
	String get customClinicHint => "Write your clinic details";
	String get myClinicSheetHeader => "Select your clinic";
	String get myClinicSubtitleEdit => "Edit your main clinic";
	String get myClinicHint => "Select";
	String get myClinicSheetInputHint => "Search your clinic";
	String get myClinicSheetButton => "Add custom clinic";
	String get myClinicAddress => "Address";
}

class PetCharacteristicsSeniorPetProfileMessages {
	final PetProfileMessages _parent;
	const PetCharacteristicsSeniorPetProfileMessages(this._parent);
	String get muscleWastage => "Muscle wastage, creaky or stiff joints";
	String get missTeeth => "Missing or loose teeth";
}

class DeletePetDialogPetProfileMessages {
	final PetProfileMessages _parent;
	const DeletePetDialogPetProfileMessages(this._parent);
	String get title => "Do you want to delete your pet data?";
	String get body => "This action will permanently delete your pet information";
}

class InteractionsPetProfileMessages {
	final PetProfileMessages _parent;
	const InteractionsPetProfileMessages(this._parent);
	EmptyStateInteractionsPetProfileMessages get emptyState => EmptyStateInteractionsPetProfileMessages(this);
	String consultation(String id) => "Consultation $id";
	String get subtitle => "Here you will see the consultations you made by chat, email or phone ";
	String get title => "Phone Consultations";
}

class EmptyStateInteractionsPetProfileMessages {
	final InteractionsPetProfileMessages _parent;
	const EmptyStateInteractionsPetProfileMessages(this._parent);
	String get hint => "From Monday to Friday between 9am to 4pm ";
	String get secondaryText => "You will have unlimited access to certified vets through chat, phone call or video for only 2.5€ / month";
	String get mainText => "You did not yet chat with our vets";
}

class FeedbackPetProfileMessages {
	final PetProfileMessages _parent;
	const FeedbackPetProfileMessages(this._parent);
	String get subtitle => "Your pet's health depends on you!";
	String link(String petName) => "Tell us, <a>how do you care for $petName's health?</a>";
	String title(String petName) => "What do you do on a day-to-day basis so that $petName has good health?";
}

class PetCharacteristicsNewbornPetProfileMessages {
	final PetProfileMessages _parent;
	const PetCharacteristicsNewbornPetProfileMessages(this._parent);
	String get cute => "Very cute baby-like expression on their face";
	String get bigBodyParts => "Their legs, paws and ears seem a bit too large";
	String get playfull => "Very playful and very curious";
}

class PetCharacteristicsAdultPetProfileMessages {
	final PetProfileMessages _parent;
	const PetCharacteristicsAdultPetProfileMessages(this._parent);
	String get energetic => "Energetic and playful";
	String get likesToRest => "Likes to have rest time";
	String get balancedBehaviour => "Balanced behavior";
}

class ConsultationsHelpPetProfileMessages {
	final PetProfileMessages _parent;
	const ConsultationsHelpPetProfileMessages(this._parent);
	String content(String petName) => "Here you can check all $petName’s consultation reports.\nEach report shows the urgency, the description of the symptoms, and the final result of the evaluation.";
	String get title => "How does it work?";
}

class CatCharacteristicsSeniorPetProfileMessages {
	final PetProfileMessages _parent;
	const CatCharacteristicsSeniorPetProfileMessages(this._parent);
	String get notBrightSkin => "Coat and skin are not so bright, a little dull, matted or greasy";
	String get relucantToJump => "Reluctant to jump to places where they used to be able to";
	String get forgetfull => "May seem forgetful, pace around or vocalize for no reason";
}

class ButtonsNavigationPetProfileMessages {
	final PetProfileMessages _parent;
	const ButtonsNavigationPetProfileMessages(this._parent);
	String get assistant => "Assistant";
}

class AgePetProfileMessages {
	final PetProfileMessages _parent;
	const AgePetProfileMessages(this._parent);
	String friendly(int year, int month) => "${ year > 0 ? (year.toString() + ' years') : (month.toString() + ' months')} old";
	String born(String formattedDate) => "Born on $formattedDate";
	String dog(String age) => "$age dog";
	String cat(String age) => "$age cat";
}

class AgeEstimationPetProfileMessages {
	final PetProfileMessages _parent;
	const AgeEstimationPetProfileMessages(this._parent);
	String title(String species) => "How do I find out my $species's age?";
}

class CountersPetProfileMessages {
	final PetProfileMessages _parent;
	const CountersPetProfileMessages(this._parent);
	String get claims => "Refunds";
	String get vet_consultations => "Phone Consultations";
	String get assessments => "24 hours \n consultations";
}

