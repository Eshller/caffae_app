import 'package:intl/intl.dart';

String formatDate(String inputDate) {
  // Split the input date string into month, day, and year parts
  List<String> dateParts = inputDate.split('/');

  // Extract the day, month, and year from the date parts
  int day = int.parse(dateParts[1]);
  int month = int.parse(dateParts[0]);
  int year = int.parse(dateParts[2]);

  // Create a DateTime object from the extracted parts
  DateTime dateTime = DateTime(year, month, day);

  // Create a date format pattern for "day month year"
  const String dayMonthYearFormat = 'd MMMM y';

  // Format the DateTime object using the defined pattern
  String formattedDate = DateFormat(dayMonthYearFormat).format(dateTime);

  return formattedDate;
}

String getNextTime(String currentTime) {
  // Parse the current time string to a DateTime object
  DateFormat format = DateFormat('hh:mm a');
  DateTime dateTime = format.parse(currentTime);

  // Calculate the next time by adding one hour to the current time
  DateTime nextDateTime = dateTime.add(const Duration(hours: 1));

  // Format and return the next time as a string
  return DateFormat('hh:mm a').format(nextDateTime);
}
