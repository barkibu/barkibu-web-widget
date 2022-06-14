import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/pipes/ellipsis_pipe.dart';
import 'package:web_widget/src/widget_configuration.dart';
import 'package:web_widget/src/widget_window/parent_window_service.dart';

@Component(
    selector: 'nutribot-recommendation-item',
    templateUrl: 'nutribot_recommendation_item_component.html',
    styleUrls: [
      'nutribot_recommendation_item_component.css'
    ],
    providers: [],
    directives: [
      coreDirectives,
      WidgetButtonComponent,
    ],
    pipes: [
      EllipsisPipe
    ])
class NutribotRecommendationItemComponent {
  final MessagesModel messages;
  final WidgetConfiguration _config;
  final ParentWindowService _parentWindow;
  final AnalyticsService _analyticsService;
  bool ingredientsExpanded = false;
  bool descriptionExpanded = false;

  NutribotRecommendationItemComponent(this.messages, this._config, this._parentWindow, this._analyticsService);

  @Input()
  RecipeOrTreat recipeOrTreat;

  // this will change after modifying the backend to get vendor name
  // should be like recipeOrTreat.vendorName !=null ?
  // recipeOrTreat.vendorName : _config.buyNowWithVendorName
  String get vendorName => _config.buyNowWithVendorName;

  int get cutOff => 220;

  void toggleDescriptionExpanded() => descriptionExpanded = !descriptionExpanded;
  void toggleIngredientsExpanded() => ingredientsExpanded = !ingredientsExpanded;
  bool get isDescriptionTruncated {
    return recipeOrTreat.description != null && recipeOrTreat.description.length > cutOff;
  }

  bool get isIngredientsTruncated {
    return recipeOrTreat.ingredients != null && recipeOrTreat.ingredients.length > cutOff;
  }

  String get ingredientsToggleText {
    if (ingredientsExpanded) {
      return messages.nutribotMessages.readShortDescription;
    } else {
      return messages.nutribotMessages.readFullDescription;
    }
  }

  String get descriptionToggleText {
    if (descriptionExpanded) {
      return messages.nutribotMessages.readShortDescription;
    } else {
      return messages.nutribotMessages.readFullDescription;
    }
  }

  bool get isNutribotLinkExternalEvent => _config.externalLinksEventsEnabled;
  bool get isProductIdPresent => recipeOrTreat.productId != null;
  void notifyNutribotProductRequested() {
    logNutribotClickBuy();
    _parentWindow.notifyNutribotProductRequested(
      recipeOrTreat.buyUrl,
      recipeOrTreat.productName,
      recipeOrTreat.productId,
    );
  }

  void logNutribotClickBuy() => _analyticsService.event.nutribot.logNutribotClickBuy();
}
