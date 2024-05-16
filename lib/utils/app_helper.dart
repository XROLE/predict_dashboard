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

  static String converDateTimeToString(DateTime val) {
    DateFormat formatter = DateFormat('d MMM, yyyy');

    return formatter.format(val);
  }

  static String? numberInputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }
    if (!RegExp(r'^\d+(\.\d+)?$').hasMatch(value)) {
      return 'Please enter only numbers';
    }
    return null;
  }
}
