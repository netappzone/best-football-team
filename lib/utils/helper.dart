import 'package:intl/intl.dart';

class Helper {
  /// Formats the [DateTime] object to `yyyy-MM-dd` string format.
  static String formatYYYYMMDD(DateTime dateTime) {
    final dateFilterDateFormat = DateFormat('yyyy-MM-dd');
    return dateFilterDateFormat.format(dateTime);
  }
}
