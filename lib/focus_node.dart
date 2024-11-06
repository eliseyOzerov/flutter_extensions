import 'package:better_extensions/build_context.dart';
import 'package:flutter/widgets.dart';

extension FocusNodeExtension on FocusNode {
  Rect getRenderRect({bool local = false}) {
    return context?.getRenderRect(local: local) ?? Rect.zero;
  }
}
