import 'package:flutter/widgets.dart';
import 'package:flutter_extensions/build_context.dart';

extension GlobalKeyExtension on GlobalKey {
  Rect getRenderRect({RenderObject? ancestor, bool local = false}) {
    return currentContext?.getRenderRect(ancestor: ancestor, local: local) ?? Rect.zero;
  }
}
