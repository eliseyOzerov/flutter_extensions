import 'package:better_extensions/build_context.dart';
import 'package:flutter/widgets.dart';

extension FocusNodeExtension on FocusNode {
  Rect getRenderRect({RenderObject? ancestor, bool local = false}) {
    return context?.getRenderRect(ancestor: ancestor, local: local) ?? Rect.zero;
  }
}
