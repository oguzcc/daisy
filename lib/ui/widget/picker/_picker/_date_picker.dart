part of '../picker.dart';

// class _DatePicker extends StatefulWidget {
//   final List<DateTime> availableDates;

//   _DatePicker({required this.availableDates});

//   @override
//   _DatePickerState createState() => _DatePickerState();
// }

// class _DatePickerState extends State<_DatePicker> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now().toUtc();
//   DateTime? _selectedDay;

//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar(
//       firstDay: DateTime.utc(2010, 10, 16),
//       lastDay: DateTime.utc(2030, 3, 14),
//       focusedDay: _focusedDay,
//       calendarFormat: _calendarFormat,
//       selectedDayPredicate: (day) {
//         return isSameDay(_selectedDay, day);
//       },
//       onDaySelected: (selectedDay, focusedDay) {
//         if (widget.availableDates.any((date) => isSameDay(date, selectedDay))) {
//           setState(() {
//             _selectedDay = selectedDay;
//             _focusedDay = focusedDay;
//           });
//         }
//       },
//       calendarStyle: CalendarStyle(
//         canMarkersOverflow: true,
//         todayDecoration: BoxDecoration(
//           color: Colors.blue,
//           shape: BoxShape.circle,
//         ),
//         selectedDecoration: BoxDecoration(
//           color: AppColors.primary,
//           shape: BoxShape.circle,
//         ),
//       ),
//       calendarBuilders: CalendarBuilders(
//         markerBuilder: (context, date, events) {
//           if (widget.availableDates
//               .any((availableDate) => isSameDay(availableDate, date))) {
//             return Positioned(
//               right: 1,
//               bottom: 1,
//               child: Container(
//                 width: 6.0,
//                 height: 6.0,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: AppColors.primary,
//                 ),
//               ),
//             );
//           }
//           return Container();
//         },
//       ),
//       onFormatChanged: (format) {
//         if (_calendarFormat != format) {
//           setState(() {
//             _calendarFormat = format;
//           });
//         }
//       },
//       onPageChanged: (focusedDay) {
//         _focusedDay = focusedDay;
//       },
//     );
//   }
// }
