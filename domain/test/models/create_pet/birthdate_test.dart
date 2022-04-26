import 'package:common_barkibu_dart/models/create_pet/birthdate.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

void main() {
  group('#getYearsOld', () {
    final date = DateTime.now().subtract(Duration(days: 366 * 3));
    final dateFormatted = DateFormat('yyyy-MM-dd').format(date);
    test('Returns the number of year passed', () => expect(Birthdate.getYearsOld(dateFormatted), 3));
  });

  group('#getMonthOld', () {
    final date = DateTime.now().subtract(Duration(days: 31));
    final dateFormatted = DateFormat('yyyy-MM-dd').format(date);
    test('Returns the number of months passed', () => expect(Birthdate.getMonthOld(dateFormatted), 1));
  });

  group('#substractOfToday', () {
    final now = DateTime.now();
    final midMonth = DateTime(now.year, now.month, 15);
    final aMonthAgo = DateFormat('yyyy-MM-01').format(midMonth.subtract(Duration(days: 31)));
    final aYearAgo = DateFormat('yyyy-MM-01').format(midMonth.subtract(Duration(days: 365)));
    test('Returns a date a month ago', () => expect(Birthdate.substractOfToday(0, 1), aMonthAgo));
    test('Returns a date a year ago', () => expect(Birthdate.substractOfToday(1, 0), aYearAgo));
  });
}
