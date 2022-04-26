import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_forms/src/directives/control_value_accessor.dart';
import 'package:common_barkibu_dart/messages/messages_model.dart';
import 'package:common_barkibu_dart/models/create_pet/birthdate.dart';

@Component(
  selector: 'widget-age-input',
  templateUrl: 'age_input_component.html',
  styleUrls: ['age_input_component.css'],
  directives: [coreDirectives, formDirectives],
  providers: [
    ExistingProvider.forToken(ngValueAccessor, AgeInputComponent),
  ],
)
class AgeInputComponent extends ChangeHandler<String> with TouchHandler implements ControlValueAccessor<String> {
  final MessagesModel messages;
  int months;
  int years;

  @Input()
  bool isInvalid = false;

  AgeInputComponent(this.messages);

  /// blur event listener set up [TouchHandler] is not fired,
  /// because this input can't be focused and focus event does not bubble up
  @HostListener('focusout')
  void focusOutHandler() => touchHandler();

  @override
  void writeValue(String newVal) {
    if (newVal != null && newVal.isNotEmpty) {
      months = Birthdate.getMonthOld(newVal);
      years = Birthdate.getYearsOld(newVal);
    }
  }

  @override
  void onDisabledChanged(bool state) {}

  void onMonthsChanged(int monthsValue) {
    // Using Future.delayed to allow angular correctly detect changes(in case value is out of range)
    // Changing value in the current event loop doesn't update the input value
    months = monthsValue;
    Future.delayed(Duration(milliseconds: 0), () {
      months = _ensureRange(months, 0, 11);
      _updateBirthday();
    });
  }

  void onYearsChanged(int yearsValue) {
    years = yearsValue;
    Future.delayed(Duration(milliseconds: 0), () {
      years = _ensureRange(years, 0, 99);
      _updateBirthday();
    });
  }

  void _updateBirthday() {
    if (years == null && months == null) {
      onChange(null);
    } else {
      onChange(Birthdate.substractOfToday(years ?? 0, months ?? 0));
    }
  }

  int _ensureRange(int value, int min, int max) {
    if (value == null) {
      return null;
    }
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }
}
