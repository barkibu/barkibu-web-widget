import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:web_widget/src/icons/icon_component.dart';
import 'package:angular_forms/src/directives/control_value_accessor.dart';

@Component(
  selector: 'widget-checkbox',
  templateUrl: 'checkbox_component.html',
  styleUrls: ['checkbox_component.css'],
  directives: [coreDirectives, IconComponent, formDirectives],
  providers: [
    ExistingProvider.forToken(ngValueAccessor, CheckboxComponent),
  ],
)
class CheckboxComponent extends ChangeHandler<bool> implements ControlValueAccessor<bool> {
  CheckboxComponent();

  @Input()
  bool checked = false;

  @Input()
  String id;

  void toggleChecked($event) => onChange($event.target.checked);

  @override
  void writeValue(bool newVal) {
    checked = newVal;
  }

  @override
  void registerOnTouched(TouchFunction callback) {}

  @override
  void onDisabledChanged(bool state) {}
}
