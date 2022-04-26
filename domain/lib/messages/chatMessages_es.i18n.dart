// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'chatMessages.i18n.dart';

String get _languageCode => 'es';
String get _localeName => 'es';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class ChatMessages_es extends ChatMessages {
	const ChatMessages_es();
	BotMessagesChatMessages_es get botMessages => BotMessagesChatMessages_es(this);
	SymptomFrequencyChatMessages_es get symptomFrequency => SymptomFrequencyChatMessages_es(this);
	ChatWithVetChatMessages_es get chatWithVet => ChatWithVetChatMessages_es(this);
	HelperTextsChatMessages_es get helperTexts => HelperTextsChatMessages_es(this);
	String popupChatMessageSubtitle(String petName) => "Ya puedes consultarlo en el perfil de $petName";
	SymptomDurationChatMessages_es get symptomDuration => SymptomDurationChatMessages_es(this);
	String get petNameInputHint => "Escribe aquí el nombre de tu mascota";
	String get petBreedInputHint => "Escribe aquí el nombre de la raza de tu mascota";
	String get you => "Tú";
	String get knowMore => "Saber más";
	String get symptomInputHint => "Describe el síntoma principal de tu mascota";
	String get popupChatMessageTitle => "¡El informe está listo!";
	String get openReport => "Abrir el informe";
	String get title => "Nueva consulta";
	String get chipSkipPrimarySymptom => "Saltar: conéctame con un veterinario";
	String get chatMessageInputHint => "Escribe tu mensaje aquí";
}

class BotMessagesChatMessages_es extends BotMessagesChatMessages {
	final ChatMessages_es _parent;
	const BotMessagesChatMessages_es(this._parent):super(_parent);
	String get symptomDurationQuestion => "¿<b>Cuánto tiempo</b> lleva este síntoma sucediendo?";
	String get symptomConfirmation => "¿Es correcto?";
	String get anamnesisEmptyAnotherOption => "O puedes <b>responder las preguntas de nuevo</b> para ayudarnos a darte la mejor recomendación. Si añades más detalles o rehaces las frases a veces puede ayudar.";
	String askPetCastrated(String petName) => "¿<b>$petName</b> está castrado?";
	String get addPet => "Agrega una mascota";
	String askSymptomConfirmation(String petName) => "Ok. ¿El síntoma que notas en <b>$petName</b> es alguno de estos?";
	String urgentBody(String petName) => "Estoy un poco preocupado por los síntomas de $petName . Te recomiendo que hables con un veterinario lo antes posible ya que podría haber algún problema urgente.";
	String askSymptomQuestion(String petName) => "¿Cuál es el <b>síntoma principal</b> que notas en $petName?";
	String addMoreSymptoms(String petName) => "¿Tiene $petName <b>algún otro síntoma</b> que te gustaría decirme?";
	String selectSex(String petName) => "¿Cuál es el <b>sexo</b> de $petName?";
	String selectAgeRange(String petName) => "¿Cuántos años tiene <b>$petName</b>?";
	String assessmentProfileReminder(String petName) => "Recuerda que puedes volver a consultar la evaluación desde el perfil de $petName";
	String get askPetBreed => "¿Cuál es la <b>raza</b> de tu mascota?";
	String get symptomHasError => "Se produjo un error al intentar entender el síntoma... ¿Podrías repetirlo otra vez?";
	String get assessmentReadyNoMoreQuestions => "No tengo más preguntas";
	String selectSpecies(String petName) => "¿Es $petName un <b>Perro</b> o un <b>Gato</b>?";
	String get initBot => "Te ayudaré a descubrir qué está pasando.";
	String withRelatedSymptoms(String petName, String relatedSymptoms) => "$petName también tiene: <b>$relatedSymptoms</b>";
	String get changePhoneNumber => "¿Puedes decirnos a qué número de teléfono podemos llamarte?";
	String get anamnesisEmptyProposal => "Si quieres, puedes hacer click para <b>hablar con un veterinario</b> ahora.";
	String get feedbackNotOk => "<b>Lamento oír eso.</b>";
	String get anamnesisResultCondition => "¡Entendido! Abajo puedes ver algunos <b>posibles problemas</b> que coinciden con los síntomas que proporcionaste. Haz click en cada uno de ellos para obtener más información y considera hablar con un veterinario.";
	String get assessmentFinished => "¡Hemos terminado las preguntas! He elaborado un informe que identifica las posibles causas de estos síntomas";
	String get showResultsAction => "Saber más";
	String get urgent => "Atención inmediata de un veterinario recomendada";
	String askOtherSymptomQuestion(String petName) => "¿Qué <b>otro síntoma</b> tiene $petName?";
	String get noPetsProfile => "Ah sí, antes de empezar, necesitamos añadir una mascota a tu perfil para saber un poco más sobre ella y poder ayudarte mejor. \n Vete <b>Añade una mascota</b> a tu cuenta y luego vuelve aquí para continuar.";
	String get anamnesisResultWarning => "Recuerda que <b>estos resultados no pretenden reemplazar el consejo, diagnóstico o tratamiento de un veterinario profesional.</b>";
	String get optionBackHomeTitle => "Vuelve a Inicio";
	String askSymptomStart(String petName) => "Ok, <b>$petName</b>. Empecemos revisando los <b>síntomas</b>.";
	String get anamnesisEmptyUrgent => "Hmmm... parece que <b>no puedo encontrar</b> la recomendación correcta basada en lo que nos has contado. Todavía no soy tan inteligente, pero estoy seguro de que algunos de los síntomas que has introducido son potencialmente peligrosos. Deberías contactar con un veterinario cuanto antes.";
	String checkPhoneNumber(String phoneNumber) => "Bien, nos pondremos en contacto contigo mediante una llamada telefónica. ¿Puedes confirmar que el <b>$phoneNumber</b> es tu número de teléfono actual?";
	String get selectPet => "¿Puedes decirme sobre qué <b>mascota</b> quieres hablar?";
	String get anamnesisResultSymptom => "Hmmm... parece que <b>no puedo encontrar</b> la recomendación correcta. Todavía no soy tan inteligente, pero aquí tienes información útil.";
	String get assessmentReady => "Listo";
	String anamnesisEmptyNotUrgent(String petName) => "Lo siento, pero no estoy seguro de qué problemas puede tener $petName. Estoy aprendiendo cosas nuevas cada día pero, ahora mismo y basado en la información que me has dado, mi único consejo es que probablemente debas contactar con un veterinario.";
	String get labelPhoneNumber => "Introduce tu número de teléfono";
	String get changePhoneNumberSuccess => "Vale, entonces programemos una llamada telefónica.";
	String get optionPersonalRecommendationsTitle => "Mira tus recomendaciones personalizadas";
	String get symptomIsEmpty => "Lo siento, no entiendo el síntoma. ¿Podrías escribirlo de otra manera?";
	String get changePhoneNumberError => "Lo siento, no hemos podido actualizar tu número de teléfono.";
	String get assessmentAdvise => "No olvides que esto <b>no es un diagnóstico</b>. En caso de tener dudas, siempre es mejor <b>realizar una consulta con un veterinario</b>";
	String get nextHelpQuestion => "¿Con qué te puedo <b>ayudar</b>?";
	String get channelChoice => "Ok, ¿cómo quieres que te contactemos?";
	String withoutRelatedSymptoms(String petName) => "$petName <b>no</b> tiene otros síntomas";
	String relatedSymptomsQuestion(String petName) => "Entendido. ¿Tiene también $petName <b>alguno de estos síntomas</b>?";
	String get assessmentReadyInProgress => "Estoy preparando el informe de tu consulta";
	String get optionTalkWithAVetTitle => "Habla con un veterinario";
	String get nextQuestionBackendIssue => "Lo sentimos, estamos teniendo problemas en este momento y no podemos continuar con el proceso. Hemos visto el problema y ya estamos trabajando para resolverlo. Vuelve a intentarlo en unos minutos para ver si el problema está resuelto.";
	String get feedbackOk => "<b>¡Bien!</b> Vuelve siempre que tengas una pregunta sobre <b>tu mascota.</b>";
	String askPetSpayed(String petName) => "¿<b>$petName</b> está castrada?";
	String symptomFound(String symptom) => "Entendido. El síntoma es <b>$symptom</b>";
	String get optionAskAnotherQuestionTitle => "Realiza otra pregunta";
	String get symptomIncorrect => "¿Podrías escribirlo de nuevo?";
	String askSymptomQuestionWithSpecie(String species) => "Ok, ¿puedes escribir una palabra, una frase o una pregunta para que pueda entender el síntoma principal de tu <b>$species</b>?";
	String get symptomFrequencyQuestion => "¿<b>Cuántas veces</b> ha ocurrido?";
	String get askPetName => "¿Cuál es el <b>nombre</b> de tu mascota?";
	String get optionGoBackTitle => "Vueve atrás";
	String get askFeedback => "¿Ha sido mi respuesta <b>útil</b>?";
	String get emptyPhoneNumber => "Ok, parece que no tenemos un número de teléfono para ponernos en contacto contigo. Introduce tu número de teléfono para poder contactar contigo.";
}

class SymptomFrequencyChatMessages_es extends SymptomFrequencyChatMessages {
	final ChatMessages_es _parent;
	const SymptomFrequencyChatMessages_es(this._parent):super(_parent);
	String get medium => "de 2 a 5 veces al día";
	String get high => "6 o más veces al día";
	String get low => "1 vez o menos al día";
}

class ChatWithVetChatMessages_es extends ChatWithVetChatMessages {
	final ChatMessages_es _parent;
	const ChatWithVetChatMessages_es(this._parent):super(_parent);
	VideoSharingChatWithVetChatMessages_es get videoSharing => VideoSharingChatWithVetChatMessages_es(this);
	RecoverChatChatWithVetChatMessages_es get recoverChat => RecoverChatChatWithVetChatMessages_es(this);
	String get letsConnectChat => "Bien, vamos a <b>conectarte</b> con un veterinario ahora...";
	String vetChatTriagePet(String petName, String gender, String species, String breed, bool neutered, bool mixedBreed, String size) => "Nombre de la mascota: $petName\nGénero: $gender\nEspecie: $species\nRaza: $breed\nCastrado: $neutered\nRaza mixta: $mixedBreed\nTamaño: $size";
	String vetChatTriageSymptom(String mainSymptom, String duration) => "Síntoma principal: $mainSymptom\nDuración: $duration";
	String get positiveFeedback => "<b>¡Bien!</b> Vuelve siempre que tengas una pregunta sobre <b>tu mascota.</b>";
	String vetChatTriageAllSymptoms(String mainSymptom, String duration, String relatedSymptoms, String possibleDiseases) => "Síntoma principal: $mainSymptom\nDuración: $duration\nSíntomas relacionados: $relatedSymptoms\nPosibles enfermedades: $possibleDiseases";
	String get closedChat => "El veterinario ha <b>cerrado el chat.</b>";
	String letsConnectVideoOrPhone(String brandName, String channel) => "Te llevo al calendario de citas de $brandName para concertar tu llamada por <b>$channel</b>.";
	String vetChatTriageSpecies(String species) => "Especie: $species";
	String get title => "Habla con un veterinario";
	String get petParentLeftChat => "El padre de la mascota <b>está austente.</b>";
	String get videoChatUnavailable => "El servicio de video llamada no se encuentra disponible por ahora 😱";
	String vetChatTriagePartner(String partner) => "Compañero: $partner";
	String get errorConnectionToAVet => "Lo siento, ha ocurrido un <b>problema</b> conectándose con el veterinario.";
	String get noVetsAvailable => "Lo siento, no tenemos nigún <b>veterinario disponible</b> en este momento. Su horario de atención es de Lunes a Jueves de 9.00 a 16.00 horas y Viernes de 9:00 a 14:00 horas ininterrumpidamente. Dentro de estos horarios, puedes volver a intentar contactarles en unos minutos; también puedes enviarles un correo electrónico o agendar una llamada telefónica.";
	String videoIsNotAvailable(String brandName) => "El chat con video funcionará pronto. Por favor, escoja otra manera para contactar con los veterinarios de $brandName.";
	String get initVet => "Podemos conectarte con un veterinario para obtener excelentes consejos y soporte. Primero, y para ayudarles, necesito hacerte un par de preguntas para que el veterinario tenga algo de información sobre tu consulta...";
	String get findingAVet => "Bien. Espera unos segundos mientras <b>busco un veterinario.</b>";
	String vetJoined(String identity) => "Estás conectado con $identity del equipo veterinario";
	String letsConnectEmail(String brandName) => "Empezaremos el email para ti pero, por favor, añade tanta información como puedas para ayudar al equipo de $brandName a darte la mejor guía. Pulsa <b>Enviar email</b> para empezar.";
	String get letsConnectVideoOrPhoneInformation => "Después de seleccionar tu cita, pulsa el botón \"Hecho\" o \"Atrás\" para volver a esta pantalla.";
	String get negativeFeedback => "<b>Lamento oír eso.</b>";
	String get askFeedback => "¿El veterinario te ha ayudado con tu pregunta?";
	String get petParentLeftPermanently => "El padre de la mascota <b>ha dejado el chat.</b>";
	String get connectedToAVet => "Ok, ahora estás <b>conectado</b>.";
	String userIsTyping(String user) => "$user está escribiendo";
}

class VideoSharingChatWithVetChatMessages_es extends VideoSharingChatWithVetChatMessages {
	final ChatWithVetChatMessages_es _parent;
	const VideoSharingChatWithVetChatMessages_es(this._parent):super(_parent);
	String get closedByPetParent => "El dueño del animal ha cerrado la video consulta";
	String get terminateSuccess => "La video consulta ha terminado";
	String vetJoined(String vet) => "$vet se ha unido a la video consulta";
	PermissionsVideoSharingChatWithVetChatMessages_es get permissions => PermissionsVideoSharingChatWithVetChatMessages_es(this);
	String get roomRequestSuccess => "La video consulta se ha creado";
	String get callRequestSuccess => "Llamada establecida con éxito";
	String get callRequestFailure => "El veterinario ha rechazado la video consulta";
	String get endCall => "Terminar la video consulta";
	String get callRequestInProgress => "Esperando a que el veterinario se una";
	String loading(String vet) => "Llamada con $vet";
	String get switchCamera => "Cambiar la cámara";
	String get startButton => "Empezar la video consulta";
	String get roomRequestFailure => "Algo ha pasado mientras se preparaba la video consulta 🤯. ¡Inténtalo de nuevo!";
	String get roomRequestInProgress => "Preparando la video consulta";
	String get errorTitle => "Ups";
	String get streamSharingFailure => "Ocurrió un error al intentar compartir el video. Inténtalo de nuevo.";
}

class PermissionsVideoSharingChatWithVetChatMessages_es extends PermissionsVideoSharingChatWithVetChatMessages {
	final VideoSharingChatWithVetChatMessages_es _parent;
	const PermissionsVideoSharingChatWithVetChatMessages_es(this._parent):super(_parent);
	String get body => "Para usar la video consulta necesitas dar permisos a la cámara";
	String get warning => "Es posible que la aplicación se reinicie, aún así podrás seguir chateando";
	String get title => "Información sobre la video consulta";
}

class RecoverChatChatWithVetChatMessages_es extends RecoverChatChatWithVetChatMessages {
	final ChatWithVetChatMessages_es _parent;
	const RecoverChatChatWithVetChatMessages_es(this._parent):super(_parent);
	String get yes => "Sí, continuar";
	String get detail => "Estabas hablando con un veterinario, ¿quieres continuar?";
	String get title => "Continúa con el chat anterior";
	String get no => "No";
}

class HelperTextsChatMessages_es extends HelperTextsChatMessages {
	final ChatMessages_es _parent;
	const HelperTextsChatMessages_es(this._parent):super(_parent);
	String get doubleTapToSelect => "Toca dos veces para seleccionar";
	String get petParentSays => "Yo digo:";
	String botSays(String botName) => "$botName dice:";
}

class SymptomDurationChatMessages_es extends SymptomDurationChatMessages {
	final ChatMessages_es _parent;
	const SymptomDurationChatMessages_es(this._parent):super(_parent);
	String get short => "menos de 1 día";
	String get long => "4 días o más";
	String get medium => "1-3 días";
}

