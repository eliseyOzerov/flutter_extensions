extension DurationExtension on Duration {
  /// Returns a [String] representation of [this] in hh:mm:ss format.
  String format({bool showHours = true}) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    final days = (inDays > 0) ? "$inDays" : "";
    final hours = (inHours > 0) ? twoDigits(inHours.remainder(24)) : "00";
    final minutes = (inMinutes > 0) ? twoDigits(inMinutes.remainder(60)) : "00";
    final seconds = (inSeconds > 0) ? twoDigits(inSeconds.remainder(60)) : "00";

    if (days.isNotEmpty) {
      return "${days}d ${hours}h ${minutes}m";
    } else {
      return "${showHours ? "$hours:" : ''}$minutes:$seconds";
    }
  }
}
