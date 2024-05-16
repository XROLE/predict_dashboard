import 'package:intl/intl.dart';

class AppHelper {
  static double roundTo(
      {required double value, required int intCountAfterDecimal}) {
    return double.parse(value.toStringAsFixed(intCountAfterDecimal));
  }

  static String converInToDate(int val) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(val * 1000);
    DateFormat formatter = DateFormat('d MMM, yyyy');

    return formatter.format(dateTime);
  }
}
