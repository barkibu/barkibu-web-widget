import 'package:pageloader/html.dart';
import 'chat_controls_po.dart';
import 'chat_messages_po.dart';
import 'nutribot_recommendation_message_po.dart';

part 'nutribot_po.g.dart';

@PageObject()
@CheckTag('nutribot')
abstract class NutribotPO {
  NutribotPO();
  factory NutribotPO.create(PageLoaderElement context) = $NutribotPO.create;
  factory NutribotPO.lookup(PageLoaderSource context) = $NutribotPO.lookup;

  @ByCheckTag()
  ChatControlsPO get controls;

  @ByCheckTag()
  ChatMessagesPO get messages;

  @ByCss('widget-header go-back button')
  PageLoaderElement get _goBackButton;

  @ByCss('widget-header go-back .go-back-title')
  PageLoaderElement get _goBackTitle;

  @ByCss('nutribot-recommendation-screen')
  PageLoaderElement get _recommendationDetails;

  @ByCheckTag()
  List<NutribotRecommendationMessagePO> get _recommendationMessages;

  void openRecommendationCard(Map<String, dynamic> foodRecommended) {
    _findMessage(foodRecommended).learnMore();
  }

  void closeRecommendationCard() async {
    await _goBackButton.click();
  }

  bool hasRecommendationMessage(Map<String, dynamic> recommendation, {primary = false}) {
    return _findMessage(recommendation).hasCorrectRecommendationInfo(recommendation, primary);
  }

  bool showsRecommendationDetails({primary = false}) {
    final expectedTitle = primary ? 'Top Recommendation' : 'Other options';
    return _recommendationDetails.exists && _goBackTitle.innerText.contains(expectedTitle);
  }

  NutribotRecommendationMessagePO _findMessage(Map<String, dynamic> foodRecommended) {
    return _recommendationMessages.firstWhere((message) => message.hasProductName(foodRecommended));
  }
}
