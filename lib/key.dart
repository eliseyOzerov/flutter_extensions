import 'package:better_extensions/build_context.dart';
import 'package:flutter/widgets.dart';

extension GlobalKeyExtension on GlobalKey {
  Rect getRenderRect({RenderObject? ancestor, bool local = false}) {
    return currentContext?.getRenderRect(ancestor: ancestor, local: local) ?? Rect.zero;
  }
}
