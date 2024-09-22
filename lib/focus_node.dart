import 'package:flutter/widgets.dart';
import 'package:flutter_extensions/build_context.dart';

extension FocusNodeExtension on FocusNode {
  Rect getRenderRect({RenderObject? ancestor, bool local = false}) {
    return context?.getRenderRect(ancestor: ancestor, local: local) ?? Rect.zero;
  }
}
