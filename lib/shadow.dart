import 'package:flutter/widgets.dart';

extension BoxShadowListExtension on List<BoxShadow> {
  List<BoxShadow> copyWith({
    Color? color,
    Offset? offset,
    double? blurRadius,
  }) {
    return map((e) {
      return BoxShadow(
        color: color ?? e.color,
        offset: offset ?? e.offset,
        blurRadius: blurRadius ?? e.blurRadius,
      );
    }).toList();
  }
}
