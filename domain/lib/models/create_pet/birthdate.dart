import 'package:intl/intl.dart';
import 'package:time_machine/time_machine.dart';

const DATE_PARSE_FORMAT = 'yyyy-MM-dd';
const DATE_STRINGIFY_FORMAT = 'yyyy-MM-01';

class Birthdate {
  static int getYearsOld(String date) => _getPeriodUntilToday(date).years;
  static int getMonthOld(String date) => _getPeriodUntilToday(date).months;
  static int getDaysOld(String date) => _getPeriodUntilToday(date).days;

  static String substractOfToday(int years, int months) {
    final today = LocalDate.today();
    final period = Period(years: years, months: months);
    final substactDestination = today.subtract(period);

    return _toStringDate(substactDestination.toDateTimeUnspecified());
  }

  static Period _getPeriodUntilToday(String date) {
    final today = LocalDate.today();
    final pastDate = LocalDate.dateTime(toDateTime(date));

    return today.periodSince(pastDate);
  }

  static String _toStringDate(DateTime date) {
    final format = DateFormat(DATE_STRINGIFY_FORMAT);
    return format.format(date);
  }

  static DateTime toDateTime(String date) {
    final format = DateFormat(DATE_PARSE_FORMAT);
    return format.parse(date);
  }
}
