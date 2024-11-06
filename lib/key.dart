import 'package:better_extensions/build_context.dart';
import 'package:flutter/widgets.dart';

extension GlobalKeyExtension on GlobalKey {
  Rect getRenderRect({bool local = false}) {
    return currentContext?.getRenderRect(local: local) ?? Rect.zero;
  }
}
