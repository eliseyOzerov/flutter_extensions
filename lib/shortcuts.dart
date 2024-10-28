import 'package:flutter/material.dart';

// --------- Padding Shortcuts --------- //

EdgeInsets pZero() => EdgeInsets.zero;
EdgeInsets pAll(num value) => EdgeInsets.all(value.toDouble());
EdgeInsets pHorizontal(num value) => EdgeInsets.symmetric(horizontal: value.toDouble());
EdgeInsets pVertical(num value) => EdgeInsets.symmetric(vertical: value.toDouble());
EdgeInsets pSymmetric(num horizontal, num vertical) => EdgeInsets.symmetric(horizontal: horizontal.toDouble(), vertical: vertical.toDouble());
EdgeInsets pTop(num value) => EdgeInsets.only(top: value.toDouble());
EdgeInsets pLeft(num value) => EdgeInsets.only(left: value.toDouble());
EdgeInsets pRight(num value) => EdgeInsets.only(right: value.toDouble());
EdgeInsets pBottom(num value) => EdgeInsets.only(bottom: value.toDouble());
EdgeInsets pLTRB(num left, num top, num right, num bottom) => EdgeInsets.fromLTRB(left.toDouble(), top.toDouble(), right.toDouble(), bottom.toDouble());

// --------- SizedBox Shortcuts --------- //

SizedBox wBox(num width) => SizedBox(width: width.toDouble());
SizedBox hBox(num height) => SizedBox(height: height.toDouble());
SizedBox box(num size) => SizedBox(width: size.toDouble(), height: size.toDouble());

// --------- BorderSide Shortcuts --------- //

BorderSide bs({num width = 1, Color color = Colors.black, double strokeAlign = BorderSide.strokeAlignInside}) =>
    BorderSide(width: width.toDouble(), color: color, strokeAlign: strokeAlign);

// --------- Border Shortcuts --------- //

Border bAll({num width = 1, Color color = Colors.black, double strokeAlign = BorderSide.strokeAlignInside}) =>
    Border.all(width: width.toDouble(), color: color, strokeAlign: strokeAlign);
Border bTop({num width = 1, Color color = Colors.black, double strokeAlign = BorderSide.strokeAlignInside}) =>
    Border(top: bs(width: width, color: color, strokeAlign: strokeAlign));
Border bLeft({num width = 1, Color color = Colors.black, double strokeAlign = BorderSide.strokeAlignInside}) =>
    Border(left: bs(width: width.toDouble(), color: color, strokeAlign: strokeAlign));
Border bRight({num width = 1, Color color = Colors.black, double strokeAlign = BorderSide.strokeAlignInside}) =>
    Border(right: bs(width: width.toDouble(), color: color, strokeAlign: strokeAlign));
Border bBottom({num width = 1, Color color = Colors.black, double strokeAlign = BorderSide.strokeAlignInside}) =>
    Border(bottom: bs(width: width.toDouble(), color: color, strokeAlign: strokeAlign));
Border bBottomRight({num width = 1, Color color = Colors.black, double strokeAlign = BorderSide.strokeAlignInside}) =>
    Border(bottom: bs(width: width.toDouble(), color: color, strokeAlign: strokeAlign), right: bs(width: width.toDouble(), color: color, strokeAlign: strokeAlign));
Border bBottomLeft({num width = 1, Color color = Colors.black, double strokeAlign = BorderSide.strokeAlignInside}) =>
    Border(bottom: bs(width: width.toDouble(), color: color, strokeAlign: strokeAlign), left: bs(width: width.toDouble(), color: color, strokeAlign: strokeAlign));
Border bTopLeft({num width = 1, Color color = Colors.black, double strokeAlign = BorderSide.strokeAlignInside}) =>
    Border(top: bs(width: width.toDouble(), color: color, strokeAlign: strokeAlign), left: bs(width: width.toDouble(), color: color, strokeAlign: strokeAlign));
Border bTopRight({num width = 1, Color color = Colors.black, double strokeAlign = BorderSide.strokeAlignInside}) =>
    Border(top: bs(width: width.toDouble(), color: color, strokeAlign: strokeAlign), right: bs(width: width.toDouble(), color: color, strokeAlign: strokeAlign));
Border bSymmetric({BorderSide horizontal = BorderSide.none, BorderSide vertical = BorderSide.none}) => Border.symmetric(horizontal: horizontal, vertical: vertical);

// --------- BorderRadius Shortcuts --------- //

BorderRadius brAll(num radius) => BorderRadius.all(Radius.circular(radius.toDouble()));
BorderRadius brOnly([num? topLeft, num? topRight, num? bottomLeft, num? bottomRight]) => BorderRadius.only(
      topLeft: topLeft != null ? Radius.circular(topLeft.toDouble()) : Radius.zero,
      topRight: topRight != null ? Radius.circular(topRight.toDouble()) : Radius.zero,
      bottomLeft: bottomLeft != null ? Radius.circular(bottomLeft.toDouble()) : Radius.zero,
      bottomRight: bottomRight != null ? Radius.circular(bottomRight.toDouble()) : Radius.zero,
    );
BorderRadius brLeft(num radius) => brOnly(radius, null, radius, null);
BorderRadius brRight(num radius) => brOnly(null, radius, null, radius);
BorderRadius brTop(num radius) => brOnly(radius, radius);
BorderRadius brBottom(num radius) => brOnly(null, null, radius, radius);
BorderRadius brTopLeft(num radius) => brOnly(radius);
BorderRadius brTopRight(num radius) => brOnly(null, radius);
BorderRadius brBottomLeft(num radius) => brOnly(null, null, radius);
BorderRadius brBottomRight(num radius) => brOnly(null, null, null, radius);

// --------- BoxConstraints Shortcuts --------- //

BoxConstraints bcFixed(num width, num height) => BoxConstraints.tight(Size(width.toDouble(), height.toDouble()));
BoxConstraints bcLoose(num width, num height) => BoxConstraints.loose(Size(width.toDouble(), height.toDouble()));
BoxConstraints bcExpandWidth(num height) => BoxConstraints.expand(height: height.toDouble());
BoxConstraints bcExpandWidthLoose(num maxHeight) => BoxConstraints(maxHeight: maxHeight.toDouble(), minHeight: 0, minWidth: double.infinity, maxWidth: double.infinity);

// --------- Post frame callback --------- //

void postFrame(VoidCallback callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}
