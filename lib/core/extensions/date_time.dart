

import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toReadableDateTime() {
    return DateFormat('MMMM d, yyyy h:mm a').format(this);
  }
}
