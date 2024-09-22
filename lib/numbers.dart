import 'dart:math' as math;

import 'package:flutter/widgets.dart';

extension NumberExtension on num {
  /// Converts degrees to radians
  double get degToRad {
    return this * math.pi / 180;
  }

  /// Converts radians to degrees
  double get rad2deg {
    return this * 180 / math.pi;
  }

  bool toBool() {
    return this == 1;
  }

  Widget get hBox {
    return SizedBox(height: toDouble());
  }

  Widget get wBox {
    return SizedBox(width: toDouble());
  }

  Widget get box {
    return SizedBox(width: toDouble(), height: toDouble());
  }

  double progress(double min, double max, {bool clamp = true}) {
    final val = (this - min) / (max - min);
    if (clamp) {
      return val.clamp(0, 1);
    }
    return val;
  }

  double lerp(double min, double max) {
    return min + (max - min) * this;
  }

  double pow(num exp) {
    return math.pow(toDouble(), exp).toDouble();
  }

  double roundTo(int places) {
    return (this * 10.pow(places)).roundToDouble() / 10.pow(places);
  }

  bool equal(num other, double tolerance) {
    return (this - other).abs() < tolerance;
  }

  Offset get dx => Offset(toDouble(), 0);

  Offset get dy => Offset(0, toDouble());

  Offset get offset {
    return Offset(toDouble(), toDouble());
  }
}

extension NumPaddingExtension on num {
  double get val => toDouble();
  EdgeInsets get pAll => EdgeInsets.all(val);
  EdgeInsets get pHorizontal => EdgeInsets.symmetric(horizontal: val);
  EdgeInsets get pVertical => EdgeInsets.symmetric(vertical: val);
  EdgeInsets get pTop => EdgeInsets.only(top: val);
  EdgeInsets get pLeft => EdgeInsets.only(left: val);
  EdgeInsets get pRight => EdgeInsets.only(right: val);
  EdgeInsets get pBottom => EdgeInsets.only(bottom: val);
}

extension NumIterableExtension<T extends num> on Iterable<T> {
  T firstLower(T i, {bool clamp = true}) {
    List<T> list = List<T>.from(this)..add(i);
    list.sort();
    final index = list.indexOf(i);
    if (i == list.first) {
      if (clamp) {
        return list[index + 1];
      } else {
        return i;
      }
    } else {
      return list[index - 1];
    }
  }

  T firstHigher(T i, {bool clamp = true}) {
    List<T> list = List<T>.from(this)..add(i);
    list.sort();
    final index = list.indexOf(i);
    if (i == list.last) {
      if (clamp) {
        return list[index - 1];
      } else {
        return i;
      }
    } else {
      return list[index + 1];
    }
  }
}

extension DoubleListExtension on List<double> {
  double? get max {
    if (isEmpty) {
      return null;
    }
    return reduce(math.max);
  }
}
