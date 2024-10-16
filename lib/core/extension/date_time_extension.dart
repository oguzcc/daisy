import 'package:daisy/core/config/core_strings.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Returns a string representing how long ago the date was.
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2022, 1, 1);
  /// print(date.timeAgoSince()); // Outputs: "1.5 years" (as of 2023)
  /// ```
  String timeAgoSince() {
    DateTime now = DateTime.now().toUtc();
    final difference = now.difference(this);

    if (difference.inDays >= 365) {
      final years = (difference.inDays / 365).toStringAsFixed(1);
      return '$years years';
    } else if (difference.inDays >= 30) {
      final months = (difference.inDays / 30).floor();
      return '$months months';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} days';
    } else {
      return '0 days';
    }
  }

  /// Returns a new DateTime with the time component set to midnight.
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 5, 15, 14, 30);
  /// print(date.getRawDateTime()); // Outputs: 2023-05-15 00:00:00.000
  /// ```
  DateTime getRawDateTime() {
    return DateTime(year, month, day);
  }

  /// Formats the date in European style (dd/MM/yyyy).
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 5, 15);
  /// print(date.formatDateTimeEuropean()); // Outputs: 15/05/2023
  /// ```
  String formatDateTimeEuropean() {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }

  /// Formats the date as day and abbreviated month.
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 5, 15);
  /// print(date.formatDateTimeForDueDate()); // Outputs: 15 May
  /// ```
  String formatDateTimeForDueDate() {
    final formatter = DateFormat('d MMM');
    return formatter.format(this);
  }

  /// Formats the date for create invoice due date.
  /// Returns 'Same Day' if the date is today, otherwise formats as day and abbreviated month.
  ///
  /// Example:
  /// ```dart
  /// final today = DateTime.now();
  /// print(today.formatDateTimeForCreateInvoiceDueDate()); // Outputs: Same Day
  ///
  /// final tomorrow = DateTime.now().add(Duration(days: 1));
  /// print(tomorrow.formatDateTimeForCreateInvoiceDueDate()); // Outputs: 16 May (if today is 15 May)
  /// ```
  String formatDateTimeForCreateInvoiceDueDate() {
    final now = DateTime.now().toUtc();
    if (now.getRawDateTime() == getRawDateTime()) {
      return 'Same Day';
    } else {
      final formatter = DateFormat('d MMM');
      return formatter.format(this);
    }
  }

  /// Formats the date and time in a user-friendly way based on how recent it is.
  ///
  /// Example:
  /// ```dart
  /// final now = DateTime.now();
  /// print(now.formatUserFriendly()); // Outputs: Today 14:30
  ///
  /// final yesterday = now.subtract(Duration(days: 1));
  /// print(yesterday.formatUserFriendly()); // Outputs: Yesterday 14:30
  ///
  /// final lastWeek = now.subtract(Duration(days: 6));
  /// print(lastWeek.formatUserFriendly()); // Outputs: Tuesday 14:30
  ///
  /// final lastMonth = now.subtract(Duration(days: 30));
  /// print(lastMonth.formatUserFriendly()); // Outputs: 15 April 14:30
  ///
  /// final lastYear = now.subtract(Duration(days: 400));
  /// print(lastYear.formatUserFriendly()); // Outputs: 15 April 2022 14:30
  /// ```
  String formatUserFriendly() {
    final localDate = toLocal();
    final now = DateTime.now();
    final difference = now.difference(localDate);

    if (difference.inDays == 0) {
      return '${CoreStrings.today} ${DateFormat('HH:mm').format(localDate)}';
    } else if (difference.inDays == 1) {
      return '${CoreStrings.yesterday} ${DateFormat('HH:mm').format(localDate)}';
    } else if (difference.inDays < 7) {
      return DateFormat('EEEE HH:mm').format(localDate);
    } else if (localDate.year == now.year) {
      return DateFormat('d MMMM HH:mm').format(localDate);
    } else {
      return DateFormat('d MMMM y HH:mm').format(localDate);
    }
  }
}
