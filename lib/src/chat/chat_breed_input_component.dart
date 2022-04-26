import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:common_barkibu_dart/messages/messages_model.dart';
import 'package:common_barkibu_dart/viewmodels/chat/chat_viewmodel.dart';
import 'package:web_widget/src/chat/chat_control_events.dart';
import 'package:web_widget/src/chat/chat_streamed_events_control.dart';
import 'package:web_widget/src/form/autocomplete_input_component.dart';

@Component(
  selector: 'chat-breed-input',
  templateUrl: 'chat_breed_input_component.html',
  directives: [coreDirectives, formDirectives, AutoCompleteInputComponent],
  styleUrls: ['chat_breed_input_component.css'],
)
class ChatBreedInputComponent extends ChatStreamedEventsControls<ChatBreedConfirmed> {
  final MessagesModel messages;
  String breed;
  Map<String, dynamic> breedData;

  ChatBreedInputComponent(this.messages);

  @Input('chatViewModel')
  BreedSelectorViewModel chatViewModel;

  String get species => chatViewModel.data['species'];

  bool get isBreedDataNotEmpty => breedData != null;

  void onBreedConfirmed() {
    controlEventsController
        .add(ChatBreedConfirmed(chatViewModel.chatFlow, breed, breedData['breedUuid'], breedData['size']));
  }
}
