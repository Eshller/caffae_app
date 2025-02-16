// import 'package:caffae_app/src/export/providers.dart';
// import 'package:intl/intl.dart';

// class TextScreen extends StatefulWidget {
//   const TextScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<TextScreen> createState() => _TextScreenState();
// }

// class _TextScreenState extends State<TextScreen> {
//   DateTime selectedDate = DateTime.now();
//   TimeOfDay selectedTime = TimeOfDay.now();
//   DateTime dateTime = DateTime.now();
//   bool showDate = false;
//   bool showTime = false;
//   bool showDateTime = false;

//   // Select for Date
//   Future<DateTime> _selectDate(BuildContext context) async {
//     final selected = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2025),
//     );
//     if (selected != null && selected != selectedDate) {
//       setState(() {
//         selectedDate = selected;
//       });
//     }
//     return selectedDate;
//   }

// // Select for Time
//   Future<TimeOfDay> _selectTime(BuildContext context) async {
//     final selected = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//     );
//     if (selected != null && selected != selectedTime) {
//       setState(() {
//         selectedTime = selected;
//       });
//     }
//     return selectedTime;
//   }
//   // select date time picker

//   Future _selectDateTime(BuildContext context) async {
//     final date = await _selectDate(context);
//     if (date == null) return;
//     if (context.mounted) {
//       final time = await _selectTime(context);
//       if (time == null) return;
//       setState(() {
//         dateTime = DateTime(
//           date.year,
//           date.month,
//           date.day,
//           time.hour,
//           time.minute,
//         );
//       });
//     }
//   }

//   String getDate() {
//     // ignore: unnecessary_null_comparison
//     if (selectedDate == null) {
//       return 'select date';
//     } else {
//       return DateFormat('MMM d, yyyy').format(selectedDate);
//     }
//   }

//   String getDateTime() {
//     // ignore: unnecessary_null_comparison
//     if (dateTime == null) {
//       return 'select date timer';
//     } else {
//       return DateFormat('yyyy-MM-dd HH: ss a').format(dateTime);
//     }
//   }

//   String getTime(TimeOfDay tod) {
//     final now = DateTime.now();

//     final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
//     final format = DateFormat.jm();
//     return format.format(dt);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Date Timer Picker'),
//         centerTitle: true,
//         backgroundColor: Colors.teal,
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   _selectDate(context);
//                   showDate = true;
//                 },
//                 child: const Text('Date Picker'),
//               ),
//             ),
//             showDate ? Center(child: Text(getDate())) : const SizedBox(),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   _selectTime(context);
//                   showTime = true;
//                 },
//                 child: const Text('Timer Picker'),
//               ),
//             ),
//             showTime
//                 ? Center(child: Text(getTime(selectedTime)))
//                 : const SizedBox(),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   _selectDateTime(context);
//                   showDateTime = true;
//                 },
//                 child: const Text('Select Date and Time Picker'),
//               ),
//             ),
//             showDateTime
//                 ? Center(child: Text(getDateTime()))
//                 : const SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DateTimerPicker {
//    DateTime selectedDate = DateTime.now();
//   TimeOfDay selectedTime = TimeOfDay.now();
//   DateTime dateTime = DateTime.now();
//   bool showDate = false;
//   bool showTime = false;
//   bool showDateTime = false;

//   // Select for Date
//   Future<DateTime> _selectDate(BuildContext context) async {
//     final selected = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2025),
//     );
//     if (selected != null && selected != selectedDate) {
//       setState(() {
//         selectedDate = selected;
//       });
//     }
//     return selectedDate;
//   }

// // Select for Time
//   Future<TimeOfDay> _selectTime(BuildContext context) async {
//     final selected = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//     );
//     if (selected != null && selected != selectedTime) {
//       setState(() {
//         selectedTime = selected;
//       });
//     }
//     return selectedTime;
//   }
//   // select date time picker

//   Future _selectDateTime(BuildContext context) async {
//     final date = await _selectDate(context);
//     if (date == null) return;

//     final time = await _selectTime(context);

//     if (time == null) return;
//     setState(() {
//       dateTime = DateTime(
//         date.year,
//         date.month,
//         date.day,
//         time.hour,
//         time.minute,
//       );
//     });
//   }

//   String getDate() {
//     // ignore: unnecessary_null_comparison
//     if (selectedDate == null) {
//       return 'select date';
//     } else {
//       return DateFormat('MMM d, yyyy').format(selectedDate);
//     }
//   }

//   String getDateTime() {
//     // ignore: unnecessary_null_comparison
//     if (dateTime == null) {
//       return 'select date timer';
//     } else {
//       return DateFormat('yyyy-MM-dd HH: ss a').format(dateTime);
//     }
//   }

//   String getTime(TimeOfDay tod) {
//     final now = DateTime.now();

//     final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
//     final format = DateFormat.jm();
//     return format.format(dt);
//   }
// }
