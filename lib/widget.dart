import 'dart:ui';

import 'package:flutter/widgets.dart';

extension WidgetExtension on Widget {
  Widget withShadow(List<BoxShadow> shadows) {
    return Stack(
      children: [
        for (final shadow in shadows)
          Transform.translate(
            offset: shadow.offset,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaY: shadow.blurRadius, sigmaX: shadow.blurRadius, tileMode: TileMode.decal),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(shadow.color, BlendMode.srcIn),
                child: this,
              ),
            ),
          ),
        this,
      ],
    );
  }

  Widget withOpacity(double opacity) => Opacity(opacity: opacity, child: this);
  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);
  Widget centered() => align(Alignment.center);

  Widget expanded([int flex = 1]) => Expanded(flex: flex, child: this);
  Widget withPadding(EdgeInsetsGeometry padding) => Padding(padding: padding, child: this);

  Widget withRight(Widget right) => Row(children: [this, right]);
  Widget withLeft(Widget left) => Row(children: [left, this]);
  Widget withTop(Widget top) => Column(children: [top, this]);
  Widget withBottom(Widget bottom) => Column(children: [this, bottom]);

  Widget onScroll(Function(ScrollMetrics) onScroll) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          onScroll(notification.metrics);
        }
        return false;
      },
      child: this,
    );
  }

  Widget wrapIf(bool condition, Widget Function(Widget) wrapper) {
    return condition ? wrapper(this) : this;
  }

  Widget blur(double sigma, {CustomClipper<Path>? clipper}) {
    if (sigma == 0) return this;
    return ClipPath(
      clipper: clipper ?? const RectClipper(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: this,
      ),
    );
  }
}

class RectClipper extends CustomClipper<Path> {
  const RectClipper({
    this.radius = BorderRadius.zero,
    this.rect,
  });

  final BorderRadius radius;
  final Rect? rect;

  @override
  Path getClip(Size size) {
    final path = Path();
    final rrect = RRect.fromRectAndCorners(
      rect ?? Offset.zero & size,
      topLeft: radius.topLeft,
      topRight: radius.topRight,
      bottomLeft: radius.bottomLeft,
      bottomRight: radius.bottomRight,
    );
    path.addRRect(rrect);
    return path;
  }

  @override
  bool shouldReclip(covariant RectClipper oldClipper) => this != oldClipper;
}
