// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'nutribotMessages.i18n.dart';

String get _languageCode => 'es';
String get _localeName => 'es';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class NutribotMessages_es extends NutribotMessages {
	const NutribotMessages_es();
	String get readFullDescription => "Leer más";
	BotMessagesNutribotMessages_es get botMessages => BotMessagesNutribotMessages_es(this);
	String get readShortDescription => "Leer menos";
	String recommendedFor(String petName) => "Recomendado para $petName";
	String get reportTitle => "Nutrición recomendación";
	String get primaryFood => "Comida principal";
	String get treat => "Tratamiento";
	String get title => "Ayudante de nutrición";
	String  buyTreat(String productVendor) => "Comprar ahora${productVendor != '' ? (' en ') + productVendor : ''}";

	String get treatIngredients => "Ingredientes";
	String get treatInfo => "Información de producto";
}

class BotMessagesNutribotMessages_es extends BotMessagesNutribotMessages {
	final NutribotMessages_es _parent;
	const BotMessagesNutribotMessages_es(this._parent):super(_parent);
	String get helpNext => "¿Qué te gustaría hacer a continuación?";
	String get unexpectedError => "";
	String get foodTopRecommended => "Top Recomendado";
	String askDullCoatOrDrySkin(String petName) => "¿$petName tiene la piel seca y / o el pelaje opaco?";
	String askFoodSensitivity(String petName) => "¿Sabes si <b>$petName</b> tiene alguna de las siguientes sensibilidades alimentarias?";
	String resultsSummary(String petName) => "Vale, basado en <b>$petName</b> (su edad, tamaño, etc.) y las respuestas que nos acabas de dar aquí, hemos reunido un par de dietas recomendadas para que lo consideres.";
	String responseNoFoodSensitivity(String petName) => "<b>$petName no</b> tiene ninguna sensibilidad alimentaria";
	String get foodTreatsDescription => "Aquí hay algunas golosinas recomendadas:";
	String get feedbackNegative => "<b>Lamento escuchar eso.</b> ¿Te gustaría <b>hablar con un veterinario</b> sobre esto?";
	String responseFoodSensitivities(String petName, String foodSensitivities, String lastFood) => "<b>$petName</b> tiene sensibilidad a <b>$foodSensitivities</b> y <b>$lastFood</b>";
	String foodOtherOptionDescription(String productName) => "Otra recomendación que se ajusta a tus criterios para la comida es <b>$productName</b>";
	String askPreferedFoodType(String petName) => "¿Prefieres alimentos enlatados o secos para <b>$petName</b>? (elige una de las siguientes opciones)";
	String get askFeedback => "¿Fue mi respuesta <b>útil</b>?";
	String init(String userName) => "¡Hola, <b>$userName</b>! Soy el ayudante de nutrición.\nAntes de poder ayudarte, necesitaré un poco de información.";
	String get resultsWarning => "Recuerda que estos resultados no están destinados a reemplazar el consejo veterinario profesional.";
	String askQuestionsProbeStart(String petName) => "Vale, para <b>$petName</b>. Excelente. Comencemos explorando algunas áreas clave de nutrición.";
	String get foodOtherOptions => "Otras opciones";
	String foodTopRecommendedDescription(String productName) => "Según lo que has dicho, te recomendaríamos <b>$productName</b>";
	String askHipJointsIssues(String petName) => "¿<b>$petName</b> tiene problemas de articulaciones o artritis?";
	String isForWeightManagement(String petName) => "Necesita <b>$petName</b> comida para mantener el peso?";
	String get channelChoice => "Vale, ¿cómo te gustaría conectarte con un miembro de nuestro equipo?";
	String get feedbackPositive => "<b>¡Genial!</b> Regresa cuando tengas una pregunta sobre <b>tu mascota</b>";
	String isOutdoor(String petName) => "Es <b>$petName</b> un gato de estar fuera de casa?";
	String responseFoodSensitivity(String petName, String foodSensitivity) => "<b>$petName</b> tiene una sensibilidad a <b>$foodSensitivity</b>";
	String askCeliac(String petName) => "Más específicamente, ¿<b>$petName</b> necesita una dieta libre de trigo o maíz?";
	String noFoodRecommended(String petName) => "No tenemos una recomendación basada en lo que nos has dicho sobre <b>$petName</b>.\n\nEl equipo brinda consejos gratuitos para ayudarte a elegir el mejor opciones de alimentos para <b>$petName</b>.\n\nHaz clic a continuación para comenzar.";
}

