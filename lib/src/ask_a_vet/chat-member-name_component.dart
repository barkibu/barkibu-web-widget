import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/common_barkibu_dart.dart';

@Component(
    selector: 'chat-member-name',
    templateUrl: 'chat-member-name_component.html',
    directives: [coreDirectives],
    changeDetection: ChangeDetectionStrategy.OnPush)
class ChatMemberNameComponent {
  final ChangeDetectorRef _changeDetectorRef;
  String memberFriendlyName = '';

  @Input()
  set member(TwilioMember member) {
    refreshMemberName(member);
  }

  Future<void> refreshMemberName(TwilioMember member) async {
    final twilioUser = await member.fetchUser();
    memberFriendlyName = twilioUser.friendlyName;
    _changeDetectorRef.markForCheck();
  }

  ChatMemberNameComponent(this._changeDetectorRef);
}
