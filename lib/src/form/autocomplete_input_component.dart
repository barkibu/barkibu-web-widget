import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_bloc/angular_bloc.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/material_input/material_auto_suggest_input.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/bloc/autocomplete/autocomplete.dart';
import 'package:angular_forms/src/directives/control_value_accessor.dart';
import 'package:common_barkibu_dart/domain/pet/get_breeds_use_case.dart';
import 'package:common_barkibu_dart/messages/messages_model.dart';
import 'package:common_barkibu_dart/models/breed.dart';
import 'package:common_barkibu_dart/service_locator.dart';
import 'package:throttling/throttling.dart';
import 'package:web_widget/src/widget_configuration.dart';

AutoCompleteBloc autoCompleteBloc() =>
    ServiceLocator.container<AutoCompleteBloc>(param1: ServiceLocator.container<GetBreedsUseCase>());

@Component(
  selector: 'autocomplete-input',
  templateUrl: 'autocomplete_input_component.html',
  styleUrls: ['autocomplete_input_component.css'],
  directives: [coreDirectives, formDirectives, MaterialAutoSuggestInputComponent, materialInputDirectives],
  providers: [
    FactoryProvider(AutoCompleteBloc, autoCompleteBloc),
    ExistingProvider.forToken(ngValueAccessor, AutoCompleteInputComponent),
    materialProviders
  ],
  pipes: [BlocPipe],
)
class AutoCompleteInputComponent extends ChangeHandler<String>
    with TouchHandler
    implements ControlValueAccessor<String>, OnInit, OnDestroy {
  final MessagesModel messages;
  final AutoCompleteBloc autoCompleteBloc;
  final WidgetConfiguration _config;
  final _breedDataController = StreamController();
  StreamSubscription autoCompleteBlocSubscription;
  AutoCompleteState blocState;
  bool loading = true;

  AutoCompleteInputComponent(this.messages, this.autoCompleteBloc, this._config);

  ItemRenderer<Breed> breedsNameRenderer = (dynamic breedObject) => breedObject.name;

  final Debouncing debouncer = Debouncing(duration: Duration(milliseconds: 500));

  ItemRenderer<Breed> get itemRenderer => breedsNameRenderer;

  String breed;

  String breedUuid;

  String size;

  @Input()
  String species;

  @Output()
  Stream get loadBreedData => _breedDataController.stream;

  String get label => messages.chatMessages.petBreedInputHint;

  String get emptyPlaceholder => messages.petProfileMessages.breedsNotFound;

  Breed get defaultOption => Breed(name: 'Other', key: 'other', size: null, breedUuid: '');

  @override
  void ngOnInit() {
    autoCompleteBlocSubscription = autoCompleteBloc.listen(autoCompleteBlocHandler);
  }

  @override
  void ngOnDestroy() {
    autoCompleteBlocSubscription.cancel();
  }

  void autoCompleteBlocHandler(AutoCompleteState state) {
    blocState = state;
    if (state is AutoCompleteLoadInProgress) {
      loading = true;
    } else if (state is AutoCompleteLoadSuccess) {
      loading = false;
      addDefaultOption(state);
    } else if (state is AutoCompleteLoadFailure) {
      addDefaultOption(state);
    }
  }

  void addDefaultOption(dynamic state) {
    state.items.insert(0, defaultOption);
  }

  void showAlgoliaBreeds(String query) {
    autoCompleteBloc.add(AutoCompleteRequested(
      (b) => b
        ..query = query
        ..params = {'species': species, 'locale': _config.locale},
    ));
  }

  void onKey(dynamic event) {
    if (event.key != 'Backspace') {
      String query = event.target.value;
      debouncer.debounce(() => showAlgoliaBreeds(query));
    }
  }

  void selectionChange(Breed breedChanged) {
    breedUuid = breedChanged?.breedUuid;
    if (breedUuid != null) {
      breed = breedChanged.name;
      breedUuid = breedChanged.breedUuid;
      size = breedChanged.size;
      _breedDataController.add(<String, dynamic>{'breedUuid': breedUuid, 'size': size});
      onChange(breed);
    }
  }

  @override
  void onDisabledChanged(bool isDisabled) {}

  @override
  void writeValue(String newValue) {
    if (newValue != null && newValue.isNotEmpty) {
      breed = newValue;
    }
  }
}
