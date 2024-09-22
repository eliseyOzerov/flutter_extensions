import 'dart:math' as math;

import 'package:flutter/widgets.dart';

extension OffsetExtension on Offset {
  /// Alignment goes from (-1, -1) to (1, 1)
  /// This method converts an Offset with (0,0) to (1,1) to an Alignment
  Alignment toAlignment(Rect rect) {
    return Alignment(
      (dx / rect.size.width) * 2 - 1,
      (dy / rect.size.height) * 2 - 1,
    );
  }

  double distanceTo(Offset other) {
    return (this - other).distance;
  }

  Offset normalize() {
    // Find the maximum absolute value between x and y
    double maxComponent = math.max(dx.abs(), dy.abs());

    // Avoid division by zero
    if (maxComponent == 0) {
      return const Offset(0, 0);
    }

    // Normalize the offset to the range -1 to 1
    double normalizedX = dx / maxComponent;
    double normalizedY = dy / maxComponent;

    return Offset(normalizedX, normalizedY);
  }

  Offset abs() {
    return Offset(dx.abs(), dy.abs());
  }

  Offset multiply(Offset other) {
    return Offset(dx * other.dx, dy * other.dy);
  }

  double angleTo(Offset other) {
    // Calculate the angle between this offset and the other offset
    double angle = math.atan2(other.dy - dy, other.dx - dx);

    // Convert radians to degrees
    double degrees = angle * 180 / math.pi;

    // Normalize the angle to be between 0 and 360 degrees
    if (degrees < 0) {
      degrees += 360;
    }

    return degrees;
  }

  List<double> toList() {
    return [dx, dy];
  }
}

extension ListOffsetExtension on List<Offset> {
  Offset get average {
    double x = 0;
    double y = 0;
    for (final offset in this) {
      x += offset.dx;
      y += offset.dy;
    }
    return Offset(x / length, y / length);
  }
}
