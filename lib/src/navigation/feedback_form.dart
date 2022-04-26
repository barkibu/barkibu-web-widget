import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:common_barkibu_dart/services/ip_tools_service.dart';
import 'package:web_widget/src/widget_configuration.dart';

class FeedbackForm {
  final NavigationService _navigationService;
  final WidgetConfiguration _config;
  final ipToolService = ServiceLocator.container<IpToolsService>();

  FeedbackForm(this._navigationService, this._config);

  void open(Pet pet, User user, bool aivetOnly, int conditionsShown, bool aivetHelpful, String consultationId,
      int symptomArticlesShown) async {
    var country = await ipToolService.getCountryName() ?? 'Undefined';
    var version = _config.version;
    var interface = 'widget';
    final query = '?pet_parent_id=${user.id}'
        '&pet_id=${pet.id}&species=${pet.species}&pet_age_range=${pet.birthdate}'
        '&aivet_only=$aivetOnly&conditions_shown=$conditionsShown&aivet_helpful=$aivetHelpful&consultation_id=$consultationId&country=$country&version=$version&interface=$interface&symptom_article_shown=$symptomArticlesShown';
    _navigationService.launchUrl('$feedbackUrl$query');
  }

  String get feedbackUrl {
    if (_config.locale == 'es') {
      return _config.spanishFeedbackUrl;
    } else {
      return _config.englishFeedbackUrl;
    }
  }
}
