import 'dart:math' as math;

import 'package:flutter/rendering.dart';

extension RectExtension on Rect {
  Rect rotate(double radians, {Offset? origin}) {
    final Matrix4 matrix = Matrix4.identity();

    // Translate to the origin.
    matrix.translate(origin?.dx ?? 0, origin?.dy ?? 0);

    // Rotate.
    matrix.rotateZ(radians);

    // Translate back.
    matrix.translate(-(origin?.dx ?? 0), -(origin?.dy ?? 0));

    return MatrixUtils.transformRect(matrix, this);
  }

  double get area => width * height;

  static Rect fromLine(Offset a, Offset b, double width) {
    final angle = (b - a).direction;
    final topLeft = a.translate(-width / 2 * math.cos(angle), -width / 2 * math.sin(angle));
    final bottomRight = b.translate(width / 2 * math.cos(angle), width / 2 * math.sin(angle));
    return Rect.fromPoints(topLeft, bottomRight);
  }

  Offset get offset => Offset(left, top);

  /// Returns the intersection of this rectangle and the given rectangle. The resulting padding will return 0.0 for all values where the rectangles do not overlap.
  /// Each overflow will be positive in it's direction.
  EdgeInsets overflow(Rect other) {
    final double top = ((this.top - other.top) * (-1)).clamp(0, double.infinity);
    final double left = ((this.left - other.left) * (-1)).clamp(0, double.infinity);
    final double bottom = ((other.bottom - this.bottom) * (-1)).clamp(0, double.infinity);
    final double right = ((other.right - this.right) * (-1)).clamp(0, double.infinity);
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }

  Rect shrink(EdgeInsets padding) {
    return Rect.fromLTRB(left + padding.left, top + padding.top, right - padding.right, bottom - padding.bottom);
  }

  RRect toRRect(double radius, {double inflate = 0}) {
    return RRect.fromRectAndRadius(this.inflate(inflate), Radius.circular(radius + inflate));
  }
}
