import 'package:pageloader/html.dart';
import 'pet_form_po.dart';

part 'pet_create_po.g.dart';

@PageObject()
@CheckTag('pet-create')
abstract class PetCreatePO {
  PetCreatePO();
  factory PetCreatePO.create(PageLoaderElement context) = $PetCreatePO.create;

  @ByCheckTag()
  PetFormPO get petForm;

  @ByTagName('button')
  @WithInnerText('Save')
  PageLoaderElement get _saveButton;

  @ByTagName('widget-layout')
  List<PageLoaderElement> get _layout;

  void savePet() {
    _saveButton.click();
  }

  bool isFormHidden() {
    // Form is not removed from dom to save the form state.
    // There will be two widget-layouts elements and one will be hidden
    return _layout.first.properties['hidden'] == 'true';
  }
}
