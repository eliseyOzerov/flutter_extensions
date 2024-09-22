import 'dart:math';

import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;

  double textScale(double base) => mediaQuery.textScaler.scale(base);

  bool get isTablet {
    var queryData = MediaQuery.of(this);
    var screenSize = queryData.size;
    var diagonal = sqrt((screenSize.width * screenSize.width) + (screenSize.height * screenSize.height));
    // Assuming 600 dpi (dots per inch) is the threshold for a tablet
    var diagonalInches = diagonal / queryData.devicePixelRatio;
    return diagonalInches >= 7;
  }

  Rect getRenderRect({RenderObject? ancestor, bool local = false}) {
    final RenderBox? renderBox = findRenderObject() as RenderBox?;
    if (renderBox == null) return Rect.zero;
    final Offset offset = local ? renderBox.globalToLocal(Offset.zero, ancestor: ancestor) : renderBox.localToGlobal(Offset.zero, ancestor: ancestor);
    final Size size = renderBox.size;
    return offset & size;
  }
}
