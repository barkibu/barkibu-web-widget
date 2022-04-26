import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/shared/chat/chat_message_type_mapping.dart';
import 'package:web_widget/src/bloc/chat/nutribot_recommendations_bloc.dart';
import 'package:web_widget/src/card/card_component.dart';
import 'package:web_widget/src/icons/icon_component.dart';
import 'package:web_widget/src/navigation/widget_button_component.dart';
import 'package:web_widget/src/widget_configuration.dart';

@Component(
    selector: 'nutribot-recommendation-message',
    templateUrl: 'nutribot_recommendation_message_component.html',
    styleUrls: ['nutribot_recommendation_message_component.css'],
    changeDetection: ChangeDetectionStrategy.OnPush,
    providers: [
      ClassProvider(ChatMessageTypeMapping),
    ],
    directives: [
      coreDirectives,
      CardComponent,
      WidgetButtonComponent,
      IconComponent,
    ])
class NutribotRecommendationMessageComponent {
  final ChatMessageTypeMapping _messageTypeMapping;
  final WidgetConfiguration _config;
  final AnalyticsService _analyticsService;
  final NutribotRecommendationBloc _recommendationsBloc;
  final MessagesModel messages;

  NutribotRecommendationMessageComponent(
    this.messages,
    this._messageTypeMapping,
    this._recommendationsBloc,
    this._config,
    this._analyticsService,
  );

  @Input()
  NutribotRecommendationViewModel viewModel;

  FoodRecommended get foodRecommended => viewModel.data;
  RecipeOrTreat get recipe => foodRecommended.recipe;

  bool isContentOpened = false;

  bool get isBackImageNotEmpty => foodRecommended.recipe.backImage.full?.isNotEmpty;
  bool get isShortenNutribotJourneyEnabled => _config.nutribotRecommendationShortJourneyEnabled;

  List<RecipeOrTreat> get treats => foodRecommended.treats;

  String get petName => viewModel.petName;
  String get cardTitle => _messageTypeMapping.getMessageByType(viewModel.titleType);
  String get cardDescription =>
      _messageTypeMapping.getMessageByType(viewModel.descriptionType, data: {'productName': recipe.productName});

  bool get isTopRecommendation => viewModel.titleType == NutribotChatMessageType.foodTopRecommended;
  bool get isNutribotLinkExternalEvent => _config.externalLinksEventsEnabled;
  bool get isProductIdPresent => recipe.productId != null;
  String get recipeDescription => recipe.description;
  String get recipeIngredients => recipe.ingredients;

  void logNutribotClickBuy() => _analyticsService.event.nutribot.logNutribotClickBuy();
  void logNutribotLearnMoreOpened() => _analyticsService.event.nutribot.logNutribotViewRecommendation();

  void selectCard() {
    _recommendationsBloc
        .add(NutribotRecommendationOpened(title: cardTitle, petName: petName, foodRecommended: foodRecommended));
  }

  void toggleContent() {
    isContentOpened = true;
    _analyticsService.event.nutribot.logNutribotViewRecommendation();
  }
}
