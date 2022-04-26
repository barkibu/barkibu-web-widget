import 'package:pageloader/html.dart';

part 'pet_form_po.g.dart';

@PageObject()
@CheckTag('pet-form')
abstract class PetFormPO {
  PetFormPO();
  factory PetFormPO.create(PageLoaderElement context) = $PetFormPO.create;

  @ById('name')
  PageLoaderElement get _name;

  @ById('species')
  PageLoaderElement get _species;

  @ById('sex')
  PageLoaderElement get _sex;

  @ById('neutered')
  PageLoaderElement get _neutered;

  @ById('years')
  PageLoaderElement get _years;

  @ById('months')
  PageLoaderElement get _months;

  @ByCss('select#species option')
  @WithInnerText('Dog')
  PageLoaderElement get _dogOption;

  @ByCss('select#sex option')
  @WithInnerText('Female')
  PageLoaderElement get _femaleOption;

  @ByCss('select#neutered option')
  @WithInnerText('Yes')
  PageLoaderElement get _neuteredOption;

  @ByCss('button.learn-more')
  @WithInnerText('Learn more')
  PageLoaderElement get _ageLearnMore;

  void ageLearnMore() async {
    await _ageLearnMore.click();
  }

  void fillInName(value) {
    _name.type(value);
  }

  void selectDogOption() {
    _dogOption.click();
  }

  void selectFemaleOption() {
    _femaleOption.click();
  }

  void selectNeuteredOption() {
    _neuteredOption.click();
  }

  Future<void> enterAge(int years, int months) async {
    await _years.clear();
    await _months.clear();
    await _years.type(years.toString());
    return _months.type(months.toString());
  }

  bool hasName(String name) {
    return _name.properties['value'] == name;
  }

  bool hasSpecies(String species) {
    return _species.properties['value'] == species;
  }

  bool hasSex(String sex) {
    return _sex.properties['value'] == sex;
  }

  bool hasNeutered(bool value) {
    final compareTo = value ? 'true' : 'false';
    return _neutered.properties['value'] == compareTo;
  }

  bool hasAge(int years, int months) {
    return _years.properties['value'] == years.toString() && _months.properties['value'] == months.toString();
  }
}
