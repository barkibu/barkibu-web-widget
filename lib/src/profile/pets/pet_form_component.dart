import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/bloc/chat/info_bloc.dart';
import 'package:web_widget/src/form/age_input_component.dart';
import 'package:web_widget/src/form/autocomplete_input_component.dart';
import 'package:web_widget/src/icons/icon_component.dart';
import 'package:web_widget/src/profile/pets/pet_form_model.dart';
import 'package:web_widget/src/widget_configuration.dart';

@Component(selector: 'pet-form', templateUrl: 'pet_form_component.html', styleUrls: [
  'pet_form_component.css'
], directives: [
  coreDirectives,
  formDirectives,
  IconComponent,
  AgeInputComponent,
  AutoCompleteInputComponent,
], exports: [])
class PetFormComponent implements OnInit, OnDestroy {
  final MessagesModel messages;
  final InfoBloc _infoBloc;
  final WidgetConfiguration _configuration;
  PetFormModel petForm;
  bool submitted = false;
  final validSubmitStream = StreamController<Pet>();
  Map<String, dynamic> breedData;

  @Input()
  Pet pet;

  @Output()
  Stream<Pet> get validSubmit => validSubmitStream.stream;

  @ViewChild(NgForm)
  NgForm formDirective;

  PetFormComponent(this.messages, this._infoBloc, this._configuration);

  bool get petBreedEnabled => _configuration.petBreedEnabled;
  @override
  void ngOnInit() {
    petForm = PetFormModel(pet);
  }

  @override
  void ngOnDestroy() {
    validSubmitStream.close();
  }

  void onSubmit() {
    submitted = true;
    if (formDirective.valid) {
      if (petBreedEnabled && breedData != null) {
        petForm.breedUuid = breedData['breedUuid'];
        petForm.size = breedData['size'];
      }
      validSubmitStream.add(petForm.toPet());
    }
  }

  String get neuteredLabel {
    if (petForm.sex == 'male') {
      return messages.petProfileMessages.formFieldsTitle.castrated;
    } else {
      return messages.petProfileMessages.formFieldsTitle.spayed;
    }
  }

  String get neuteredPlaceholder {
    if (petForm.sex == 'male') {
      return messages.petProfileMessages.formFieldsTitle.castrated;
    } else {
      return messages.petProfileMessages.formFieldsHint.spayed;
    }
  }

  bool shouldShowError(NgControl control) {
    if (control.valid == null) return false;
    return !control.valid && (control.touched || submitted);
  }

  bool isDropdownPlaceholderActive(NgControl control) {
    return control.pristine && isValueEmpty(control);
  }

  bool isValueEmpty(NgControl control) {
    if (control.value is String) {
      return control.value.isEmpty;
    } else {
      return control.value == null;
    }
  }

  void showSymptomInfo() {
    _infoBloc.add(AgeInfoOpened(species: petForm.species));
  }
}
