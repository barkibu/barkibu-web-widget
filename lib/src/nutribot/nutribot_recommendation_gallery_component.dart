import 'dart:async';

import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

@Component(
    selector: 'nutribot-recommendation-gallery',
    templateUrl: 'nutribot_recommendation_gallery_component.html',
    styleUrls: ['nutribot_recommendation_gallery_component.css'],
    providers: [],
    directives: [coreDirectives, NgClass])
class NutribotRecommendationGalleryComponent {
  final MessagesModel messages;
  final _recipeSelectController = StreamController();

  NutribotRecommendationGalleryComponent(
    this.messages,
  );

  @Input()
  List<RecipeOrTreat> recipeAndTreats;

  @Input()
  RecipeOrTreat recipe;

  @Input()
  List<RecipeOrTreat> treats;

  @Input()
  String petName;

  @Output()
  Stream get onRecipeSelect => _recipeSelectController.stream;

  @Output()
  void recipeSelect(String recipeId) {
    _recipeSelectController.add(recipeId);
  }
}
