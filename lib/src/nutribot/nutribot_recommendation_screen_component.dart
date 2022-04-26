import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/bloc/chat/nutribot_recommendations_bloc.dart';
import 'package:web_widget/src/nutribot/nutribot_recommendation_gallery_component.dart';
import 'package:web_widget/src/nutribot/nutribot_recommendation_item_component.dart';

@Component(
    selector: 'nutribot-recommendation-screen',
    templateUrl: 'nutribot_recommendation_screen_component.html',
    styleUrls: [
      'nutribot_recommendation_screen_component.css'
    ],
    providers: [],
    directives: [
      coreDirectives,
      GoBackComponent,
      NutribotRecommendationGalleryComponent,
      NutribotRecommendationItemComponent,
      layoutDirectives,
    ])
class NutribotRecommendationScreenComponent implements OnInit {
  final MessagesModel messages;
  final NutribotRecommendationBloc _recommendationsBloc;
  final AnalyticsService _analyticsService;

  NutribotRecommendationScreenComponent(this.messages, this._recommendationsBloc, this._analyticsService);

  @override
  void ngOnInit() {
    _analyticsService.screen.logFoodRecommendationDetails();
    _analyticsService.event.nutribot.logNutribotViewRecommendation();
    activeRecipe = recipe.productId;
  }

  @Input()
  NutribotRecommendationSetSuccess recommendationState;

  @Input()
  String activeRecipe;

  void clearRecommendation() => _recommendationsBloc.add(NutribotRecommendationClosed());

  FoodRecommended get foodRecommended => recommendationState.foodRecommended;
  String get petName => recommendationState.petName;
  RecipeOrTreat get recipe => foodRecommended.recipe;
  List<RecipeOrTreat> get treats => foodRecommended.treats;
  List<RecipeOrTreat> get recipeAndTreats => List.from([recipe])..addAll(treats);

  void activateTab(String productId) {
    activeRecipe = productId;
  }
}
