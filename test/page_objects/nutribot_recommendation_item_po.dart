import 'package:pageloader/html.dart';
part 'nutribot_recommendation_item_po.g.dart';

@PageObject()
@CheckTag('nutribot-recommendation-item')
abstract class NutribotRecommendationItemPO {
  NutribotRecommendationItemPO();
  factory NutribotRecommendationItemPO.create(PageLoaderElement context) = $NutribotRecommendationItemPO.create;

  @ByCss('.product-name')
  PageLoaderElement get _productName;

  @ByTagName('a')
  @WithInnerText('Buy now')
  PageLoaderElement get _buyNowLink;

  @ByTagName('button')
  @WithInnerText('Buy now')
  PageLoaderElement get _buyNowButton;

  bool hasProductName(String productName) {
    return _productName.innerText == productName;
  }

  void clickBuyNowButton() async {
    await _buyNowButton.click();
  }

  bool hasBuyNowLink(String href) {
    return _buyNowLink.attributes['href'] == href;
  }
}
