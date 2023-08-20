import 'package:intl/intl.dart';
import 'package:shared/src/constants/format/number_format_constants.dart';

class NumberFormatUtils {
  NumberFormatUtils._();

  static String formatYen(double price) {
    return NumberFormat.currency(symbol: "", decimalDigits: 0).format(price);
  }

  static String formatNumber(int number) {
    return NumberFormat(NumberFormatConstants.defaultFormat).format(number);
  }
}
