import 'package:intl/intl.dart';

class FormatDate {
  static String selectedDateYYYYMMDD(DateTime date) =>
      DateFormat('yyyy-MM-dd').format(date);

  static String ddMMYYYYHHmmss(DateTime date) =>
      DateFormat("dd-MM-yyyy HH:mm:ss").format(date);

  static String date(String date) =>
      DateFormat.yMMMd('en_US').format(DateTime.parse(date));

  static DateTime convertTimeToAMPMDate({required String rawTime}) =>
      DateFormat("HH:mm").parse(rawTime);

  static String convertTimeToAMPM({required String rawTime}) =>
      DateFormat.jm().format(DateFormat("HH:mm:ss")
          .parse(rawTime)); //ex: convert from 10:45:00 to 10:45 AM

  static String convertTimeFromAMPM({required String rawTime}) =>
      DateFormat("HH:mm:ss").format(DateFormat.jm()
          .parse(rawTime)); //ex: convert from 10:45 AM to 10:45:00
}
