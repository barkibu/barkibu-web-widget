// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'petProfileMessages.i18n.dart';

String get _languageCode => 'es';
String get _localeName => 'es';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class PetProfileMessages_es extends PetProfileMessages {
	const PetProfileMessages_es();
	DogCharacteristicsSeniorPetProfileMessages_es get dogCharacteristicsSenior => DogCharacteristicsSeniorPetProfileMessages_es(this);
	FormFieldsHintPetProfileMessages_es get formFieldsHint => FormFieldsHintPetProfileMessages_es(this);
	HistoryPetProfileMessages_es get history => HistoryPetProfileMessages_es(this);
	PetRangePetProfileMessages_es get petRange => PetRangePetProfileMessages_es(this);
	ClaimsPetProfileMessages_es get claims => ClaimsPetProfileMessages_es(this);
	FormFieldsTitlePetProfileMessages_es get formFieldsTitle => FormFieldsTitlePetProfileMessages_es(this);
	PetCharacteristicsYoungPetProfileMessages_es get petCharacteristicsYoung => PetCharacteristicsYoungPetProfileMessages_es(this);
	ClinicalHistorySectionPetProfileMessages_es get clinicalHistorySection => ClinicalHistorySectionPetProfileMessages_es(this);
	String get gallery => "Galería";
	MyClinicSectionPetProfileMessages_es get myClinicSection => MyClinicSectionPetProfileMessages_es(this);
	String get assessments => "Evaluaciones";
	PetCharacteristicsSeniorPetProfileMessages_es get petCharacteristicsSenior => PetCharacteristicsSeniorPetProfileMessages_es(this);
	DeletePetDialogPetProfileMessages_es get deletePetDialog => DeletePetDialogPetProfileMessages_es(this);
	InteractionsPetProfileMessages_es get interactions => InteractionsPetProfileMessages_es(this);
	String clinicalHistorySubtitle(String date) => "Última actualización: <b>$date</b>";
	String petProfileCompletion(int percentage) => "$percentage% Completado";
	String get deletePetButton => "Borrar este perfil de mascota";
	FeedbackPetProfileMessages_es get feedback => FeedbackPetProfileMessages_es(this);
	PetCharacteristicsNewbornPetProfileMessages_es get petCharacteristicsNewborn => PetCharacteristicsNewbornPetProfileMessages_es(this);
	PetCharacteristicsAdultPetProfileMessages_es get petCharacteristicsAdult => PetCharacteristicsAdultPetProfileMessages_es(this);
	String get assessmentHistory => "Historial de evaluaciones";
	ConsultationsHelpPetProfileMessages_es get consultationsHelp => ConsultationsHelpPetProfileMessages_es(this);
	String get reports => "Informes";
	String get assessment => "Evaluación";
	CatCharacteristicsSeniorPetProfileMessages_es get catCharacteristicsSenior => CatCharacteristicsSeniorPetProfileMessages_es(this);
	String get editPhoto => "Editar foto";
	ButtonsNavigationPetProfileMessages_es get buttonsNavigation => ButtonsNavigationPetProfileMessages_es(this);
	AgePetProfileMessages_es get age => AgePetProfileMessages_es(this);
	String get details => "Detalles";
	String get consultationsTitle => "Tus Consultas";
	String get clinicalHistory => "Historial clínico";
	String consultationsSubtitle(String name) => "Aquí se guardan los informes de las consultas que realices sobre $name. ";
	String get camera => "Cámara";
	AgeEstimationPetProfileMessages_es get ageEstimation => AgeEstimationPetProfileMessages_es(this);
	String get clinicalHistoryNoConsultations => "No ha realizado ninguna consulta";
	String get exportData => "Exportar Datos Médicos";
	CountersPetProfileMessages_es get counters => CountersPetProfileMessages_es(this);
	String get petDetails => "Detalles de la mascota";
	String get uploadPhoto => "Añadir foto";
	String get emptyPets => "Aún no has registrado ninguna mascota\nPara añadir una, inicia una consulta.";
	String get title => "Mis mascotas";
	String get petDetailsSubtitle => "Perfil de la mascota";
	String get subtitle => "El perfil de tu mascota";
	String get createPetHint => "¡Crea un perfil para tu mascota aquí!";
	String get unknown => "Desconocido";
	String get breedsNotFound => "No se han encontrado razas";
	String get newAssessment => "Nueva evaluación";
	String get consultationsSeeAll => "Ver todas las consultas";
	String clinicalHistoryTitle(String petName) => "Ver el historial de $petName";
}

class DogCharacteristicsSeniorPetProfileMessages_es extends DogCharacteristicsSeniorPetProfileMessages {
	final PetProfileMessages_es _parent;
	const DogCharacteristicsSeniorPetProfileMessages_es(this._parent):super(_parent);
	String get greyHair => "Canas alrededor del hocico y las cejas";
	String get forgetfull => "Puede parecer olvidadizo, deambular o ladrar sin ninguna razón";
	String get slow => "Lento para levantarse, acostarse y/o caminar";
}

class FormFieldsHintPetProfileMessages_es extends FormFieldsHintPetProfileMessages {
	final PetProfileMessages_es _parent;
	const FormFieldsHintPetProfileMessages_es(this._parent):super(_parent);
	String get age => "Selecciona la edad";
	String get chipNumber => "Introduce el número de chip de tu mascota";
	String get spayed => "¿Está castrada?";
	String get sex => "Selecciona el sexo";
	String get species => "Selecciona la especie";
	String get size => "Tamaño de la mascota";
	String get castrated => "¿Está castrado?";
	String get breed => "Selecciona su raza";
	String get name => "Introduce el nombre de tu mascota";
}

class HistoryPetProfileMessages_es extends HistoryPetProfileMessages {
	final PetProfileMessages_es _parent;
	const HistoryPetProfileMessages_es(this._parent):super(_parent);
	VirtualVetHistoryPetProfileMessages_es get virtualVet => VirtualVetHistoryPetProfileMessages_es(this);
	String get title => "Historial";
	NutritionHistoryPetProfileMessages_es get nutrition => NutritionHistoryPetProfileMessages_es(this);
	AskAVetDirectlyHistoryPetProfileMessages_es get askAVetDirectly => AskAVetDirectlyHistoryPetProfileMessages_es(this);
}

class VirtualVetHistoryPetProfileMessages_es extends VirtualVetHistoryPetProfileMessages {
	final HistoryPetProfileMessages_es _parent;
	const VirtualVetHistoryPetProfileMessages_es(this._parent):super(_parent);
	String get subtitle => "Informes";
	String get title => "Virtual Vet";
}

class NutritionHistoryPetProfileMessages_es extends NutritionHistoryPetProfileMessages {
	final HistoryPetProfileMessages_es _parent;
	const NutritionHistoryPetProfileMessages_es(this._parent):super(_parent);
	String get title => "Nutrición";
	String get subtitle => "Recommendaciones";
}

class AskAVetDirectlyHistoryPetProfileMessages_es extends AskAVetDirectlyHistoryPetProfileMessages {
	final HistoryPetProfileMessages_es _parent;
	const AskAVetDirectlyHistoryPetProfileMessages_es(this._parent):super(_parent);
	String get title => "Habla con un Vet";
	String get subtitle => "Conversaciones";
}

class PetRangePetProfileMessages_es extends PetRangePetProfileMessages {
	final PetProfileMessages_es _parent;
	const PetRangePetProfileMessages_es(this._parent):super(_parent);
	String get kitten => "Gatito";
	String get adult => "Adulto";
	String get senior => "Senior";
	String get young => "Joven";
	String get puppy => "Cachorro";
}

class ClaimsPetProfileMessages_es extends ClaimsPetProfileMessages {
	final PetProfileMessages_es _parent;
	const ClaimsPetProfileMessages_es(this._parent):super(_parent);
	HasClaimStateClaimsPetProfileMessages_es get hasClaimState => HasClaimStateClaimsPetProfileMessages_es(this);
	EmptyStateClaimsPetProfileMessages_es get emptyState => EmptyStateClaimsPetProfileMessages_es(this);
	UpsellClaimsPetProfileMessages_es get upsell => UpsellClaimsPetProfileMessages_es(this);
	String get title => "Reembolsos solicitados";
	String get requestNewRefund => "Solicitar un nuevo reembolso";
}

class HasClaimStateClaimsPetProfileMessages_es extends HasClaimStateClaimsPetProfileMessages {
	final ClaimsPetProfileMessages_es _parent;
	const HasClaimStateClaimsPetProfileMessages_es(this._parent):super(_parent);
	String get mainText => "Reclamación recibida";
	String get secondaryText => "Nos pondremos en contacto contigo en breve";
}

class EmptyStateClaimsPetProfileMessages_es extends EmptyStateClaimsPetProfileMessages {
	final ClaimsPetProfileMessages_es _parent;
	const EmptyStateClaimsPetProfileMessages_es(this._parent):super(_parent);
	String get mainText => "Aquí puedes solicitar tus reembolsos";
	String get secondaryText => "";
	String get hint => "80% de cobertura hasta 3000€ anuales\n100% en clínicas Kivet";
}

class UpsellClaimsPetProfileMessages_es extends UpsellClaimsPetProfileMessages {
	final ClaimsPetProfileMessages_es _parent;
	const UpsellClaimsPetProfileMessages_es(this._parent):super(_parent);
	String buyHealthPlan(String petName) => "<p>Puedes solicitar un reembolso si tienes <a>el seguro de salud de  $petName</a> contratado</p>";
}

class FormFieldsTitlePetProfileMessages_es extends FormFieldsTitlePetProfileMessages {
	final PetProfileMessages_es _parent;
	const FormFieldsTitlePetProfileMessages_es(this._parent):super(_parent);
	String get neutered => "Castrado";
	String get name => "Nombre";
	String get breed => "Raza";
	String get species => "Especie";
	String get size => "Tamaño";
	String get birthdate => "Fecha de nacimiento";
	String get castrated => "Castrado";
	String get chipNumber => "Número de chip";
	String get spayed => "Castrada";
	String get sex => "Sexo";
}

class PetCharacteristicsYoungPetProfileMessages_es extends PetCharacteristicsYoungPetProfileMessages {
	final PetProfileMessages_es _parent;
	const PetCharacteristicsYoungPetProfileMessages_es(this._parent):super(_parent);
	String get playfull => "Muy juguetón";
	String get brightEyes => "Ojos brillantes y siempre curiosos";
	String get neverTired => "Parece que nunca se cansa cuando sale a correr";
	String get brightTeeth => "Dientes muy brillantes y blancos";
}

class ClinicalHistorySectionPetProfileMessages_es extends ClinicalHistorySectionPetProfileMessages {
	final PetProfileMessages_es _parent;
	const ClinicalHistorySectionPetProfileMessages_es(this._parent):super(_parent);
	EmptyStateClinicalHistorySectionPetProfileMessages_es get emptyState => EmptyStateClinicalHistorySectionPetProfileMessages_es(this);
	String get description => "Informes de tus consultas";
	String get selectorDate => "Fecha";
	String get report => "Informe de Evaluación";
	String get consultation => "Consulta";
	String get title => "Consultas";
	String get consultations => "Consultas";
	String get selectorType => "Tipo";
}

class EmptyStateClinicalHistorySectionPetProfileMessages_es extends EmptyStateClinicalHistorySectionPetProfileMessages {
	final ClinicalHistorySectionPetProfileMessages_es _parent;
	const EmptyStateClinicalHistorySectionPetProfileMessages_es(this._parent):super(_parent);
	String get hint => "Siempre a tu disposición";
	String get secondaryText => "Podrás realizar un primer chequeo de lo que le puede pasar a tu mascota. De un manera rápida, fácil y gratuita.";
	String get mainText => "Todavía no tienes ninguna consulta";
}

class MyClinicSectionPetProfileMessages_es extends MyClinicSectionPetProfileMessages {
	final PetProfileMessages_es _parent;
	const MyClinicSectionPetProfileMessages_es(this._parent):super(_parent);
	String get myClinic => "Mi clínica";
	String get myClinicSubtitle => "Añade los datos de tu clínica habitual";
	String get myClinicAdd => "Añadir una clínica";
	String get verify => "Verificaremos personalmente tu clínica";
	String get customClinicHint => "Escribe los detalles de tu clínica";
	String get myClinicSheetHeader => "Selecciona tu clínica";
	String get myClinicSubtitleEdit => "Edita los datos de tu clínica habitual";
	String get myClinicHint => "Selecciona";
	String get myClinicSheetInputHint => "Busca tu clínica";
	String get myClinicSheetButton => "Añade tu clínica";
	String get myClinicAddress => "Dirección";
}

class PetCharacteristicsSeniorPetProfileMessages_es extends PetCharacteristicsSeniorPetProfileMessages {
	final PetProfileMessages_es _parent;
	const PetCharacteristicsSeniorPetProfileMessages_es(this._parent):super(_parent);
	String get muscleWastage => "Desgaste muscular, articulaciones que crujen o rígidas";
	String get missTeeth => "Falta de dientes o debilidad dental 'dientes flojos'";
}

class DeletePetDialogPetProfileMessages_es extends DeletePetDialogPetProfileMessages {
	final PetProfileMessages_es _parent;
	const DeletePetDialogPetProfileMessages_es(this._parent):super(_parent);
	String get title => "¿Deseas borrar los datos de tu mascota?";
	String get body => "Esta acción borrará permanentemente los datos de tu mascota";
}

class InteractionsPetProfileMessages_es extends InteractionsPetProfileMessages {
	final PetProfileMessages_es _parent;
	const InteractionsPetProfileMessages_es(this._parent):super(_parent);
	EmptyStateInteractionsPetProfileMessages_es get emptyState => EmptyStateInteractionsPetProfileMessages_es(this);
	String consultation(String id) => "Consulta $id";
	String get subtitle => "Aquí verás tus consultas por llamada, chat, video o mail";
	String get title => "Consultas Telefónicas";
}

class EmptyStateInteractionsPetProfileMessages_es extends EmptyStateInteractionsPetProfileMessages {
	final InteractionsPetProfileMessages_es _parent;
	const EmptyStateInteractionsPetProfileMessages_es(this._parent):super(_parent);
	String get hint => "De Lunes a Viernes de 9am a 4pm";
	String get secondaryText => "Tendrás acceso ilimitado a veterinarios colegiados mediante chat, llamada o video por tan solo 2,5 € al mes. ";
	String get mainText => "Aún no has hablado por teléfono con ningún veterinario";
}

class FeedbackPetProfileMessages_es extends FeedbackPetProfileMessages {
	final PetProfileMessages_es _parent;
	const FeedbackPetProfileMessages_es(this._parent):super(_parent);
	String get subtitle => "¡Su salud depende de ti!";
	String link(String petName) => "Cuéntanos, <a>¿cómo cuidas la salud de $petName?</a>";
	String title(String petName) => "¿Qué haces en el día a día para que $petName tenga buena salud?";
}

class PetCharacteristicsNewbornPetProfileMessages_es extends PetCharacteristicsNewbornPetProfileMessages {
	final PetProfileMessages_es _parent;
	const PetCharacteristicsNewbornPetProfileMessages_es(this._parent):super(_parent);
	String get cute => "Expresión facial dulce, como un bebé";
	String get bigBodyParts => "Patas y orejas que parecen o muy pequeñas o muy grandes";
	String get playfull => "Muy juguetón y muy curioso";
}

class PetCharacteristicsAdultPetProfileMessages_es extends PetCharacteristicsAdultPetProfileMessages {
	final PetProfileMessages_es _parent;
	const PetCharacteristicsAdultPetProfileMessages_es(this._parent):super(_parent);
	String get energetic => "Energético y juguetón";
	String get likesToRest => "Le gusta descansar";
	String get balancedBehaviour => "Comportamiento equilibrado";
}

class ConsultationsHelpPetProfileMessages_es extends ConsultationsHelpPetProfileMessages {
	final PetProfileMessages_es _parent;
	const ConsultationsHelpPetProfileMessages_es(this._parent):super(_parent);
	String content(String petName) => "Aquí puedes revisar todos los informes de las consultas que realices sobre la salud de $petName.\nCada informe contiene la urgencia, la descripción de los síntomas y el resultado final de la evaluación.";
	String get title => "¿Cómo funciona?";
}

class CatCharacteristicsSeniorPetProfileMessages_es extends CatCharacteristicsSeniorPetProfileMessages {
	final PetProfileMessages_es _parent;
	const CatCharacteristicsSeniorPetProfileMessages_es(this._parent):super(_parent);
	String get notBrightSkin => "El pelaje y la piel no son tan brillantes, un poco opacos, enmarañados o grasosos";
	String get relucantToJump => "Lento para levantarse, acostarse y/o caminar";
	String get forgetfull => "Puede parecer olvidadizo, deambular o maullar sin ninguna razón";
}

class ButtonsNavigationPetProfileMessages_es extends ButtonsNavigationPetProfileMessages {
	final PetProfileMessages_es _parent;
	const ButtonsNavigationPetProfileMessages_es(this._parent):super(_parent);
	String get assistant => "Asistente";
}

class AgePetProfileMessages_es extends AgePetProfileMessages {
	final PetProfileMessages_es _parent;
	const AgePetProfileMessages_es(this._parent):super(_parent);
	String friendly(int year, int month) => "${ year > 0 ? (year.toString() + ' años') : (month.toString() + ' meses')}";
	String born(String formattedDate) => "Nacido el $formattedDate";
	String dog(String age) => "Perro de $age";
	String cat(String age) => "Gato de $age";
}

class AgeEstimationPetProfileMessages_es extends AgeEstimationPetProfileMessages {
	final PetProfileMessages_es _parent;
	const AgeEstimationPetProfileMessages_es(this._parent):super(_parent);
	String title(String species) => "¿Cómo averiguar la edad de mi $species?";
}

class CountersPetProfileMessages_es extends CountersPetProfileMessages {
	final PetProfileMessages_es _parent;
	const CountersPetProfileMessages_es(this._parent):super(_parent);
	String get claims => "Reembolsos";
	String get vet_consultations => "Consultas telefónicas";
	String get assessments => "Consultas \n24 HORAS";
}

