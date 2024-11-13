import 'package:intl/intl.dart';

class HelperDateTimeFormat {
  static String formatTime(String date) {
    return DateFormat.jm().format(DateTime.parse(date).toLocal());
  }

// Only day month and year
  static String formatDate(String date) {
    return DateFormat('d MMMM, y', 'es').format(DateTime.parse(date).toLocal());
  }

  static String formatDateTime(String date) {
    return DateFormat('hh:mm:s').format(DateTime.parse(date).toLocal());
  }

  static String formatDateTimeWithDay(String date) {
    DateTime localDateTime = DateTime.parse(date).toLocal();

    return DateFormat('EEEE, d MMMM', 'es')
        .add_jm()
        .format(localDateTime)
        .replaceAll('AM', 'a.m.')
        .replaceAll('PM', 'p.m.');
  }

  // Clock latest message, if it was sent today, show the time, if it was sent yesterday, show 'Ayer', if it
  // was sent before yesterday, show the date
  static String formatLatestMessage(String date) {
    DateTime localDateTime = DateTime.parse(date).toLocal();
    DateTime now = DateTime.now();

    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return formatTime(date);
    } else if (localDateTime.day == now.day - 1 &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return 'Ayer';
    } else {
      return DateFormat('d MMMM', 'es').format(localDateTime);
    }
  }
}
