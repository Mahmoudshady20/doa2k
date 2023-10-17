import 'package:intl/intl.dart';

class MyDateUtils {

  static String formatTaskDate(DateTime date){
    var formatter = DateFormat("yyyy-MMM-dd");
    return formatter.format(date);
  }
  static DateTime dateOnly(DateTime date){
    return DateTime(
      date.year,
      date.month,
      date.day
    );
  }
}


// static DateTime dateOnly(DateTime input){
// // return date only
// return DateTime(
// input.year,
// input.month,
// input.day
// );
// }