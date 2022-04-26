import 'package:pageloader/html.dart';
part 'nutribot_recommendation_message_po.g.dart';

@PageObject()
@CheckTag('nutribot-recommendation-message')
abstract class NutribotRecommendationMessagePO {
  NutribotRecommendationMessagePO();
  factory NutribotRecommendationMessagePO.create(PageLoaderElement context) = $NutribotRecommendationMessagePO.create;

  @ByCss('.recipe-description')
  PageLoaderElement get _recipeDescription;

  @ByCss('.treats-list')
  PageLoaderElement get _treatsList;

  @ByTagName('button')
  @WithInnerText('Learn more')
  PageLoaderElement get _learnMore;

  bool hasProductName(Map<String, dynamic> foodRecommended) {
    return _recipeDescription.innerText.contains(foodRecommended['recipe']['productName']);
  }

  bool hasCorrectRecommendationInfo(Map<String, dynamic> foodRecommended, bool primary) {
    return _hasCorrectTitle(foodRecommended, primary) && hasCorrectTreats(foodRecommended);
  }

  void learnMore() async {
    await _learnMore.click();
  }

  bool _hasCorrectTitle(Map<String, dynamic> foodRecommended, bool primary) {
    final expectedTitle = primary ? 'Top Recommendation' : 'Other options';
    return _recipeDescription.innerText.contains(expectedTitle);
  }

  bool hasCorrectTreats(Map<String, dynamic> foodRecommended) {
    return (foodRecommended['treats'] as List<Map<String, dynamic>>).every((treat) {
      return _treatsList.innerText.contains(treat['treat']['productName']);
    });
  }
}
