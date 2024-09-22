import 'dart:math';

import 'package:flutter/widgets.dart';

extension EdgeInsetsExtension on EdgeInsets {
  bool get isZero => left == 0 && top == 0 && right == 0 && bottom == 0;
  double get area => horizontal + vertical;

  EdgeInsets _create(num left, num top, num right, num bottom) {
    final l = max(0, left).toDouble();
    final t = max(0, top).toDouble();
    final r = max(0, right).toDouble();
    final b = max(0, bottom).toDouble();
    final val = EdgeInsets.fromLTRB(l, t, r, b);
    return val;
  }

  List<double> get ltrb => [left, top, right, bottom];

  EdgeInsets addHorizontal(num value) => _create(left + value, top, right + value, bottom);
  EdgeInsets addVertical(num value) => _create(left, top + value, right, bottom + value);
  EdgeInsets addLeft(num value) => _create(left + value, top, right, bottom);
  EdgeInsets addTop(num value) => _create(left, top + value, right, bottom);
  EdgeInsets addRight(num value) => _create(left, top, right + value, bottom);
  EdgeInsets addBottom(num value) => _create(left, top, right, bottom + value);

  EdgeInsets subHorizontal(num value) => _create(left - value, top, right - value, bottom);
  EdgeInsets subVertical(num value) => _create(left, top - value, right, bottom - value);
  EdgeInsets subLeft(num value) => _create(left - value, top, right, bottom);
  EdgeInsets subTop(num value) => _create(left, top - value, right, bottom);
  EdgeInsets subRight(num value) => _create(left, top, right - value, bottom);
  EdgeInsets subBottom(num value) => _create(left, top, right, bottom - value);

  EdgeInsets withHorizontal(num value) => _create(value, top, value, bottom);
  EdgeInsets withVertical(num value) => _create(left, value, right, value);
  EdgeInsets withLeft(num value) => _create(value, top, right, bottom);
  EdgeInsets withTop(num value) => _create(left, value, right, bottom);
  EdgeInsets withRight(num value) => _create(left, top, value, bottom);
  EdgeInsets withBottom(num value) => _create(left, top, right, value);
}
