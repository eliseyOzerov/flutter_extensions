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

  Rect getRenderRect({bool local = false}) {
    final RenderBox? renderBox = findRenderObject() as RenderBox?;
    if (renderBox == null) return Rect.zero;

    // Determine the ancestor based on the local flag
    final RenderObject? ancestor = local ? renderBox.parent : null;

    // Calculate the offset
    final Offset offset = renderBox.localToGlobal(Offset.zero, ancestor: ancestor);
    final Rect result = offset & renderBox.size;

    return result;
  }
}
