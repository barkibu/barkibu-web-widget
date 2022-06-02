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

class NutribotMessages {
	const NutribotMessages();
	String get readFullDescription => "Read More";
	BotMessagesNutribotMessages get botMessages => BotMessagesNutribotMessages(this);
	String get readShortDescription => "Read Less";
	String recommendedFor(String petName) => "Recommended for $petName";
	String get reportTitle => "Nutrition recommendation";
	String get primaryFood => "Primary food";
	String get treat => "Treat";
	String get title => "Food and Nutrition Finder";
	String  buyTreat(String productVendor) => "Buy now${productVendor != '' ? (' on ') + productVendor : ''}";
	String get treatIngredients => "Ingredients";
	String get treatInfo => "Product Information";
	String get treatHeader => "Click to view treat recommendations";
	String get productName => "Product name";
}

class BotMessagesNutribotMessages {
	final NutribotMessages _parent;
	const BotMessagesNutribotMessages(this._parent);
	String get helpNext => "What would you like to do next?";
	String get unexpectedError => "";
	String get foodTopRecommended => "Top Recommendation";
	String askDullCoatOrDrySkin(String petName) => "Does <b>$petName</b> have dry skin and/or a dull coat?";
	String askFoodSensitivity(String petName) => "Does <b>$petName</b> have sensitivities to any of these foods?";
	String resultsSummary(String petName) => "Ok, based on <b>$petName</b> (their age, size, etc.) and the answers you just gave us here, we recommend the following.";
	String responseNoFoodSensitivity(String petName) => "<b>$petName</b> does <b>not</b> have any food sensitivities";
	String get foodTreatsDescription => "Here are some recommended treats:";
	String get feedbackNegative => "<b>Sorry to hear that.</b> Would you like to <b>speak with a vet</b> about this?";
	String responseFoodSensitivities(String petName, String foodSensitivities, String lastFood) => "<b>$petName</b> has a sensitivity to <b>$foodSensitivities</b> and <b>$lastFood</b>";
	String foodOtherOptionDescription(String productName) => "Another recommendation that fits your criteria for food is <b>$productName</b>";
	String askPreferedFoodType(String petName) => "Lastly, do you prefer Wet or Dry food for <b>$petName</b>? (choose one of the options below)";
	String get askFeedback => "Was my answer <b>helpful</b>?";
	String init(String userName) => "Hello <b>$userName</b>! I’m the Nutrition Helper.\nBefore I can help you I’ll need a little info.";
	String get resultsWarning => "Remember that these results are not intended to replace professional veterinary advice.";
	String askQuestionsProbeStart(String petName) => "Ok, for <b>$petName</b>. Great. Let’s start by exploring some key nutrition areas.";
	String get foodOtherOptions => "Other options";
	String foodTopRecommendedDescription(String productName) => "Based on what you have said, we would recommend <b>$productName</b>";
	String askHipJointsIssues(String petName) => "Does <b>$petName</b> have joint issues/arthritis?";
	String isForWeightManagement(String petName) => "Does <b>$petName</b> need a food to help control their weight?";
	String get channelChoice => "Ok, how would you like to connect to a member of our team?";
	String get feedbackPositive => "<b>Great!</b> Come back any time you have a question about <b>your pet.</b>";
	String isOutdoor(String petName) => "Is <b>$petName</b> an outdoor cat?";
	String responseFoodSensitivity(String petName, String foodSensitivity) => "<b>$petName</b> has a sensitivity to <b>$foodSensitivity</b>";
	String askCeliac(String petName) => "More specifically, does <b>$petName</b> need a wheat-free or corn-free diet?";
	String noFoodRecommended(String petName) => "We’re sorry but we don’t have a recommendation based on your preferences for <b>$petName</b>.\n\nThe Vet team provides complimentary advice to help you choose the best food options for <b>$petName</b>.\n\nClick below to get started.";
}

