import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Shortcut to format the string
  String format([String? format]) {
    return DateFormat(format, "en-GB").format(this);
  }

  /// Returns parametric iso8601 string
  String iso({
    bool showDate = true,
    bool showTime = false,
    bool useTimezone = false,
  }) {
    final String date = toIso8601String().split("T")[0];
    final String time = toIso8601String().split("T")[1].split('.')[0];
    String res = '';
    if (showDate) {
      res += date;
    }
    if (showTime) {
      res += time;
    }
    if (useTimezone) {
      res += "Z";
    }
    return res;
  }

  String smartFormat({bool showTime = false, bool use24h = true}) {
    String date;
    if (isToday) {
      date = "Today";
    } else if (isTomorrow) {
      date = "Tomorrow";
    } else if (isYesterday) {
      date = "Yesterday";
    } else if (isBefore(DateTime.now().addDays(7)) && isAfter(DateTime.now().addDays(-7))) {
      date = DateFormat("EEEE").format(this);
    } else if (isBefore(DateTime.now().addYears(1).startOfYear)) {
      date = DateFormat("d MMM").format(this);
    } else {
      date = DateFormat("d MMM y").format(this);
    }
    if (showTime) {
      return "$date, ${format(use24h ? "HH:mm" : "h:mm a")}";
    } else {
      return date;
    }
  }

  /// Returns this as 'dd.mm.yyyy, hh:mm'.
  String asDateTimeSI() {
    final String minute_ = minute.toString().length > 1 ? minute.toString() : '0$minute';

    return '$day.$month.$year, $hour:$minute_';
  }

  /// Returns this as 'hh:mm:ss'.
  String asTime() {
    final String minute_ = minute.toString().length > 1 ? minute.toString() : '0$minute';
    final String second_ = second.toString().length > 1 ? second.toString() : '0$second';

    return '$hour:$minute_:$second_';
  }

  DateTime asUTC() {
    return DateTime.utc(year, month, day, hour, minute, second, millisecond, microsecond);
  }

  int get daySecond {
    return hour * 3600 + minute * 60 + second;
  }

  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  DateTime get startOfWeek {
    return DateTime(year, month, day - (weekday - 1));
  }

  DateTime get startOfMonth {
    return DateTime(year, month, 1);
  }

  DateTime get startOfYear {
    return DateTime(year, 1, 1);
  }

  DateTime get endOfMonth {
    return DateTime(year, month + 1, 0);
  }

  int get weekOfYear {
    final DateTime firstDayOfYear = DateTime(year, 1, 1);
    final int days = difference(firstDayOfYear).inDays;
    return (days / 7).ceil();
  }

  bool get isYesterday {
    return DateTime.now().addDays(-1).isSameDay(this);
  }

  bool get isToday {
    return DateTime.now().isSameDay(this);
  }

  bool get isTomorrow {
    return DateTime.now().addDays(1).isSameDay(this);
  }

  bool get isMonday {
    return weekday == DateTime.monday;
  }

  bool get isTuesday {
    return weekday == DateTime.tuesday;
  }

  bool get isWednesday {
    return weekday == DateTime.wednesday;
  }

  bool get isThursday {
    return weekday == DateTime.thursday;
  }

  bool get isFriday {
    return weekday == DateTime.friday;
  }

  bool get isSaturday {
    return weekday == DateTime.saturday;
  }

  bool get isSunday {
    return weekday == DateTime.sunday;
  }

  bool get isWeekend {
    return isSaturday || isSunday;
  }

  int get daysInMonth {
    return DateTime(year, month + 1, 0).day;
  }

  /// Returns the number of unique weeks in the month, not just a division by 7.
  int get weeksInMonth {
    final firstWeekDays = 7 - startOfMonth.weekday - 1;
    final lastWeekDays = endOfMonth.weekday;
    final wholeWeeks = (daysInMonth - firstWeekDays - lastWeekDays) ~/ 7;
    return wholeWeeks + 2;
  }

  List<DateTime> get daysInWeekList {
    return List.generate(7, (index) => startOfWeek.addDays(index));
  }

  List<DateTime> get daysInMonthList {
    return List.generate(daysInMonth, (index) => startOfMonth.addDays(index));
  }

  DateTime addYears(int years) {
    return DateTime(year + years, month, day, hour, minute, second, millisecond, microsecond);
  }

  DateTime addMonths(int months) {
    return DateTime(year, month + months, day, hour, minute, second, millisecond, microsecond);
  }

  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  DateTime addHours(int hours) {
    return add(Duration(hours: hours));
  }

  DateTime addMinutes(int minutes) {
    return add(Duration(minutes: minutes));
  }

  DateTime addSeconds(int seconds) {
    return add(Duration(seconds: seconds));
  }

  DateTime addMilliseconds(int milliseconds) {
    return add(Duration(milliseconds: milliseconds));
  }

  bool isSameDay(DateTime other) {
    return startOfDay == other.startOfDay;
  }

  bool isSameWeek(DateTime other) {
    return startOfWeek == other.startOfWeek;
  }

  bool isSameMonth(DateTime other) {
    return startOfMonth == other.startOfMonth;
  }

  DateTime roundToMillisecond() {
    return DateTime(year, month, day, hour, minute, second, millisecond);
  }

  DateTime roundToSecond() {
    return DateTime(year, month, day, hour, minute, second);
  }

  DateTime roundToMinute() {
    return DateTime(year, month, day, hour, minute);
  }

  DateTime roundToHour() {
    return DateTime(year, month, day, hour);
  }

  int yearsDiff(DateTime other) {
    DateTime earlierDate = isBefore(other) ? this : other;
    DateTime laterDate = isBefore(other) ? other : this;

    int yearDiff = laterDate.year - earlierDate.year;

    if (laterDate.month < earlierDate.month || (laterDate.month == earlierDate.month && laterDate.day < earlierDate.day)) {
      yearDiff--;
    }

    return yearDiff;
  }

  int toAge() {
    return yearsDiff(DateTime.now());
  }
}
