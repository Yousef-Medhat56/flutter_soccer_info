import 'dart:async';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Day {
  final String show;
  final String api;

  Day({required this.show, required this.api});
}

Future<List<Day>> getWeekDays(DateTime day) async {
  List<Day> formattedDays = [];

  await initializeDateFormatting("ar_SA");

  //the day in the middle
  DateTime middleDay = day;

  // the dtae of the first day in the array
  DateTime date1 = middleDay.subtract(const Duration(days: 2));

  var shownDateformatter = DateFormat("E d MMMM", "ar_SA");
  var apiDateformatter = DateFormat("y-M-d");

  for (var i = 0; i < 5; i++) {
    String formattedShow =
        shownDateformatter.format(date1.add(Duration(days: i)));
    String formattedApi = apiDateformatter.format(date1.add(Duration(days: i)));

    formattedDays.add(Day(show: formattedShow, api: formattedApi));
  }

  return formattedDays;
}
