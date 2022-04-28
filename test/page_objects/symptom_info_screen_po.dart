import 'package:pageloader/html.dart';

part 'symptom_info_screen_po.g.dart';

@PageObject()
@CheckTag('info-screen')
abstract class SymptomInfoScreenPO {
  SymptomInfoScreenPO();
  factory SymptomInfoScreenPO.create(PageLoaderElement context) = $SymptomInfoScreenPO.create;
  factory SymptomInfoScreenPO.lookup(PageLoaderSource context) = $SymptomInfoScreenPO.lookup;

  @ByCss('.symptom-info-title')
  PageLoaderElement get _title;

  @ByCss('.symptom-info-article')
  PageLoaderElement get _description;

  @ByCss('table.symptom-info-article')
  PageLoaderElement get _ageTable;

  @ByTagName('terms-of-service-vetinsight')
  PageLoaderElement get _termsOfService;

  @ByCss('go-back button')
  PageLoaderElement get _goBack;

  void goBack() async {
    await _goBack.click();
  }

  bool showsInfo(String name, String description) {
    return _title.innerText == name && _description.innerText == description;
  }

  bool showsAgeInfo(String species) {
    return _title.innerText == "How do I find out my ${species}'s age?" && _ageTable.exists;
  }

  bool showsTerms() {
    return _termsOfService.exists;
  }
}
