import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate(DateTime date, {String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).format(date);
  }

  static String formatTime(DateTime date, {String format = 'HH:mm'}) {
    return DateFormat(format).format(date);
  }
}
