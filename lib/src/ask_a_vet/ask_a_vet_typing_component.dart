import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';
import 'package:web_widget/src/ask_a_vet/chat-member-name_component.dart';

@Component(
    selector: 'ask-a-vet-typing',
    templateUrl: 'ask_a_vet_typing_component.html',
    directives: [coreDirectives, ChatMemberNameComponent],
    styleUrls: ['ask_a_vet_typing_component.css'],
    pipes: [AsyncPipe])
class AskAVetTypingComponent {
  @Input()
  ChatWithVetConnectSuccess chatState;

  AskAVetTypingComponent();

  List<TwilioMember> get typingMembers => chatState.typingMembers;
}
