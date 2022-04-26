import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/chat/chat_component.dart';
import 'package:web_widget/src/icons/icon_component.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/navigation/spinner_component.dart';
import 'package:web_widget/src/route_paths.dart';
import 'package:web_widget/src/widget_configuration.dart';

PetProfileBloc petProfileBlocFactory() => ServiceLocator.container<PetProfileBloc>();
AssessmentHistoryBloc assessmentHistoryBlocFactory() => ServiceLocator.container<AssessmentHistoryBloc>();
NutribotHistoryBloc nutribotHistoryBlocFactory() => ServiceLocator.container<NutribotHistoryBloc>();

@Component(
  selector: 'pet-history',
  templateUrl: 'pet_history_component.html',
  styleUrls: ['pet_history_component.css'],
  directives: [
    coreDirectives,
    layoutDirectives,
    routerDirectives,
    GoBackComponent,
    SpinnerComponent,
    IconComponent,
  ],
  providers: [
    FactoryProvider(AssessmentHistoryBloc, assessmentHistoryBlocFactory),
    FactoryProvider(NutribotHistoryBloc, nutribotHistoryBlocFactory),
  ],
  exports: [RoutePaths],
)
class PetHistoryComponent implements AfterChanges, OnDestroy {
  final WidgetConfiguration _configuration;
  final MessagesModel messages;
  final AssessmentHistoryBloc assessmentHistoryBloc;
  final NutribotHistoryBloc nutribotHistoryBloc;

  @Input()
  Pet pet;

  int aivetAssessmentCount;
  int askAVetAssessmentCount;
  int nutribotConsultationsCount;

  bool get nutribotEnabled => _configuration.nutribotEnabled ?? false;
  bool get aivetEnabled => _configuration.aivetEnabled ?? true;
  bool get askAVetDirectlyEnabled => _configuration.askAVetDirectlyEnabled ?? false;

  String get petAssessmentsPath => RoutePaths.petAssessments.toUrl(parameters: {'id': pet?.id.toString()});
  String get petAskAVetHistoryPath => RoutePaths.petAssessments.toUrl(
        parameters: {'id': pet?.id.toString()},
        queryParameters: {'filter': ChatComponent.askAVetFlow},
      );
  String get petNutritionHistoryPath => RoutePaths.petNutritionHistory.toUrl(parameters: {'id': pet?.id.toString()});

  PetHistoryComponent(
    this.messages,
    this.assessmentHistoryBloc,
    this.nutribotHistoryBloc,
    this._configuration,
  ) {
    assessmentHistoryBloc.listen(assessmentHistoryListener);
    nutribotHistoryBloc.listen(nutribotHistoryListener);
  }

  @override
  void ngAfterChanges() {
    if (pet == null) {
      return;
    }
    assessmentHistoryBloc.add(AssessmentHistoryRequested(pet.id));
    if (nutribotEnabled) {
      nutribotHistoryBloc.add(NutribotHistoryRequested(pet.id));
    }
  }

  @override
  void ngOnDestroy() {
    assessmentHistoryBloc.close();
    nutribotHistoryBloc.close();
  }

  void assessmentHistoryListener(final AssessmentHistoryState state) {
    if (state is AssessmentHistoryLoadSuccess) {
      aivetAssessmentCount = state.aivetAssessments.length;
      askAVetAssessmentCount = state.askAVetAssessments.length;
    }
  }

  void nutribotHistoryListener(NutribotHistoryState state) {
    if (state is NutribotHistoryLoadSuccess) {
      nutribotConsultationsCount = state.nutribotConsultations.length;
    }
  }

  String get appName => _configuration.appName;
}
