import 'package:angular/angular.dart';
import 'package:common_barkibu_dart/messages/messages.dart';
import 'package:web_widget/src/layout/layout.dart';
import 'package:web_widget/src/navigation/go_back_component.dart';
import 'package:web_widget/src/widget_configuration.dart';

@Component(
  selector: 'virtual-vet-info',
  templateUrl: 'virtual_vet_info_component.html',
  styleUrls: ['virtual_vet_info_component.css'],
  directives: [
    coreDirectives,
    layoutDirectives,
    GoBackComponent,
  ],
)
class VirtualVetInfoComponent {
  final MessagesModel messages;
  final WidgetConfiguration _configuration;

  VirtualVetInfoComponent(this.messages, this._configuration);

  String get brandName => _configuration.brandName;
}
