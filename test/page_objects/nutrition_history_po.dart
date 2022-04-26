import 'package:pageloader/html.dart';
import 'nutribot_recommendation_message_po.dart';
import 'nutribot_recommendation_item_po.dart';

part 'nutrition_history_po.g.dart';

@PageObject()
@CheckTag('pet-nutrition-history')
abstract class NutritionHistoryPO {
  NutritionHistoryPO();
  factory NutritionHistoryPO.create(PageLoaderElement context) = $NutritionHistoryPO.create;
  factory NutritionHistoryPO.lookup(PageLoaderSource context) = $NutritionHistoryPO.lookup;

  @ByTagName('li')
  List<PageLoaderElement> get _nutritionItems;

  @ByTagName('Button')
  List<PageLoaderElement> get _nutritionLinks;

  @ByCss('widget-header go-back button')
  PageLoaderElement get _goBackButton;

  @ByCss('widget-header go-back .go-back-title')
  PageLoaderElement get _goBackTitle;

  @ByCss('nutribot-recommendation-screen')
  PageLoaderElement get _recommendationDetails;

  @ByCheckTag()
  List<NutribotRecommendationMessagePO> get _recommendationMessages;

  @ByCheckTag()
  List<NutribotRecommendationItemPO> get _recommendationItems;

  bool hasNutritionItem(String nutritionConsultationDateString) {
    assert(nutritionConsultationDateString != null);
    return _nutritionItems.any((item) => item.innerText.contains(nutritionConsultationDateString));
  }

  void openNutritionConsultation(String nutritionConsultationDateString) async {
    assert(nutritionConsultationDateString != null);
    await _nutritionLinks.firstWhere((link) => link.innerText.contains(nutritionConsultationDateString)).click();
  }

  bool hasRecommendationMessage(Map<String, dynamic> recommendation, {primary = false}) {
    return _findMessage(recommendation).hasCorrectRecommendationInfo(recommendation, primary);
  }

  void openRecommendationCard(Map<String, dynamic> foodRecommended) {
    _findMessage(foodRecommended).learnMore();
  }

  void closeRecommendationCard() async {
    await _goBackButton.click();
  }

  bool showsRecommendationDetails({primary = false}) {
    final expectedTitle = primary ? 'Top Recommended' : 'Other options';
    return _recommendationDetails.exists && _goBackTitle.innerText.contains(expectedTitle);
  }

  NutribotRecommendationMessagePO _findMessage(Map<String, dynamic> foodRecommended) {
    return _recommendationMessages.firstWhere((message) => message.hasProductName(foodRecommended));
  }

  NutribotRecommendationItemPO getRecommendationItem(String productName) {
    return _recommendationItems.firstWhere((item) => item.hasProductName(productName));
  }
}
