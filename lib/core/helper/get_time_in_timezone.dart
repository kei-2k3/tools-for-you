import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

String getTimeInTimezone(String timezoneName) {
  try {
    final location = tz.getLocation(timezoneName);
    final now = tz.TZDateTime.now(location);
    return DateFormat.jm().format(now);
  } catch (e) {
    return "Invalid timezone";
  }
}
