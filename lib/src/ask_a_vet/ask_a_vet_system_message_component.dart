import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

@Component(
    selector: 'ask-a-vet-system-message',
    templateUrl: 'ask_a_vet_system_message_component.html',
    directives: [coreDirectives],
    styleUrls: ['ask_a_vet_system_message_component.css'])
class AskAVetSystemMessageComponent {
  @Input()
  SimpleChatMessage viewModel;

  AskAVetSystemMessageComponent();
}
