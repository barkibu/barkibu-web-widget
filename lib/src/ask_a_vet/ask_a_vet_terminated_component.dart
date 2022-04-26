import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

@Component(
    selector: 'ask-a-vet-terminated',
    templateUrl: 'ask_a_vet_terminated_component.html',
    directives: [coreDirectives],
    styleUrls: ['ask_a_vet_terminated_component.css'])
class AskAVetTerminatedComponent {
  final MessagesModel messages;
  AskAVetTerminatedComponent(this.messages);
}
