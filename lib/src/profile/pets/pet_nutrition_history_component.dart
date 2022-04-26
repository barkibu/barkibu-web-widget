import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/models/nutribot_consultation.dart';
import 'package:common_barkibu_dart/shared/chat/actions_chat.dart';
import 'package:web_widget/src/bloc/chat/nutribot_recommendations_bloc.dart';
import 'package:web_widget/src/nutribot/nutribot_recommendation_message_component.dart';
import 'package:web_widget/src/nutribot/nutribot_recommendation_screen_component.dart';

import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/layout/pet_title_component.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/spinner_overlay_component.dart';
import 'package:web_widget/src/bloc/chat/info_bloc.dart';
import 'package:web_widget/src/icons/icon_component.dart';
import 'package:web_widget/src/widget_configuration.dart';

class NutritionHistoryItem {
  final DateTime createdAt;
  final List<NutribotRecommendationViewModel> recommendationViewModels;

  NutritionHistoryItem(this.createdAt, this.recommendationViewModels);
}

NutribotHistoryBloc historyBlocFactory() => ServiceLocator.container<NutribotHistoryBloc>();
PetProfileBloc petProfileBlocFactory() => ServiceLocator.container<PetProfileBloc>();

@Component(
  selector: 'pet-nutrition-history',
  templateUrl: 'pet_nutrition_history_component.html',
  styleUrls: ['pet_nutrition_history_component.css'],
  directives: [
    coreDirectives,
    layoutDirectives,
    routerDirectives,
    GoBackComponent,
    SpinnerOverlayComponent,
    NutribotRecommendationMessageComponent,
    NutribotRecommendationScreenComponent,
    IconComponent,
    PetTitleComponent
  ],
  providers: [
    ClassProvider(InfoBloc),
    FactoryProvider(NutribotHistoryBloc, historyBlocFactory),
    FactoryProvider(PetProfileBloc, petProfileBlocFactory),
    ClassProvider(NutribotRecommendationBloc),
  ],
  exports: [RoutePaths],
  pipes: [DatePipe],
)
class PetNutritionHistoryComponent implements OnActivate, OnDestroy {
  final NutribotHistoryBloc historyBloc;
  final PetProfileBloc petProfileBloc;
  final NutribotRecommendationBloc nutribotRecommendationBloc;
  final MessagesModel messages;
  final Router router;
  final WidgetConfiguration _config;
  final AnalyticsService _analyticsService;

  List<NutritionHistoryItem> consultations;
  List<NutribotConsultation> _nutribotConsultations;

  Pet pet;
  NutritionHistoryItem selectedConsultation;
  int petId;
  NutribotRecommendationState recommendationState;

  bool get isRecommendationOpened => recommendationState is NutribotRecommendationSetSuccess;

  PetNutritionHistoryComponent(
    this.petProfileBloc,
    this.historyBloc,
    this.messages,
    this.router,
    this.nutribotRecommendationBloc,
    this._config,
    this._analyticsService,
  ) {
    historyBloc.listen(historyBlocListener);
    petProfileBloc.listen(petProfileBlocListener);
    nutribotRecommendationBloc.listen(recommendationsBlocListener);
  }

  @override
  void onActivate(_, RouterState current) async {
    _analyticsService.screen.logMyHistoryNutribotDates();
    petId = int.parse(current.parameters['id']);
    historyBloc.add(NutribotHistoryRequested(petId));
    petProfileBloc.add(PetProfileStarted((b) => b.petId = petId));
  }

  @override
  void ngOnDestroy() {
    historyBloc.close();
    petProfileBloc.close();
    nutribotRecommendationBloc.close();
  }

  void historyBlocListener(NutribotHistoryState state) {
    if (state is NutribotHistoryLoadSuccess) {
      _nutribotConsultations = state.nutribotConsultations;
      _buildConsultations();
    }
  }

  void petProfileBlocListener(PetProfileState state) async {
    if (state is PetProfileLoadSuccess) {
      pet = state.pets.first;
      _buildConsultations();
    }
  }

  void recommendationsBlocListener(NutribotRecommendationState state) {
    if (state is NutribotRecommendationEmpty && isRecommendationOpened) {
      _analyticsService.screen.logMyHistoryNutribotDetails();
    }
    recommendationState = state;
  }

  void _buildConsultations() {
    if (pet == null || _nutribotConsultations == null) {
      return;
    }
    consultations = _nutribotConsultations.map<NutritionHistoryItem>((consultation) {
      return NutritionHistoryItem(
        consultation.createdAt,
        ActionsChat().nutribotRecommendations(consultation.foodRecommendations, pet),
      );
    }).toList();
  }

  String get petProfilePath {
    return RoutePaths.petProfile.toUrl(parameters: {'id': petId.toString()});
  }

  bool get isConsultationSelected => selectedConsultation != null;
  String get dateFormat => _config.assessmentDateFormat;

  void selectConsultation(consultation) {
    _analyticsService.screen.logMyHistoryNutribotDetails();
    selectedConsultation = consultation;
  }

  void clearSelectedConsultation() {
    _analyticsService.screen.logMyHistoryNutribotDates();
    selectedConsultation = null;
  }
}
