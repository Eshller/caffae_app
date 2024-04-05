import 'package:intl/intl.dart';

// String convertTimestampToRealTime(int timestamp) {
//   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
//   String formattedTime = DateFormat('d MMM y', 'en_US').format(dateTime);
//   return formattedTime;
// }

String convertTimestampToRealTime(int timestamp) {
  // Convert microseconds to milliseconds
  int millisecondsSinceEpoch = timestamp ~/ 1000;

  DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  String formattedTime = DateFormat('d MMM y', 'en_US').format(dateTime);
  return formattedTime;
}
