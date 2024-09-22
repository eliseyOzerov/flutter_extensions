import 'package:flutter/rendering.dart';

extension StringExtension on String {
  /// Returns a boolean representation for this string
  bool get asBool {
    if (toLowerCase() == "true") {
      return true;
    } else if (toLowerCase() == "false") {
      return false;
    }
    throw FormatException(
      "Invalid string format, couldn't convert to boolean: $this",
    );
  }

  String get capitalize {
    return toUpperCase()[0] + substring(1);
  }

  String get decapitalize {
    return toLowerCase()[0] + substring(1);
  }

  String or(String fill) {
    if (isEmpty) {
      return fill;
    }
    return this;
  }

  String take(int count, {bool ellipsis = true, String fill = "", bool useRunes = false}) {
    if (useRunes) {
      final length = runes.length;
      if (length <= count) {
        return this;
      }
      return "${String.fromCharCodes(runes.toList().sublist(0, count))}${ellipsis ? "..." : ""}$fill";
    }
    if (length <= count) {
      return this;
    }
    return "${substring(0, count)}${ellipsis ? "..." : ""}$fill";
  }

  /// Returns -1, 0, 1 if this version is less than, equal to, or greater than the other
  int compareVersion(String other) {
    final regExpV = RegExp(r'(\d+)\.(\d+)\.(\d+)');
    final thisV = regExpV.firstMatch(this)?.group(0) ?? "";
    final otherV = regExpV.firstMatch(other)?.group(0) ?? "";
    if (thisV.isEmpty && otherV.isEmpty) {
      return 0;
    } else if (thisV.isEmpty) {
      return -1;
    } else if (otherV.isEmpty) {
      return 1;
    }
    final List<String> thisParts = thisV.split(".");
    final List<String> otherParts = otherV.split(".");

    while (thisParts.length < otherParts.length) {
      thisParts.add("0");
    }
    while (otherParts.length < thisParts.length) {
      otherParts.add("0");
    }
    try {
      for (int i = 0; i < thisParts.length; i++) {
        final int thisPart = int.parse(thisParts[i]);
        final int otherPart = int.parse(otherParts[i]);
        if (thisPart < otherPart) {
          return -1;
        } else if (thisPart > otherPart) {
          return 1;
        }
      }
    } catch (e) {
      print("Error parsing version: $e");
    }
    return 0;
  }

  Color? get hexColor {
    final integer = int.tryParse(replaceAll("#", ""), radix: 16);
    if (integer != null) {
      return Color.fromARGB(255, (integer >> 16) & 0xff, (integer >> 08) & 0xff, (integer >> 00) & 0xff);
    }
    return null;
  }
}
