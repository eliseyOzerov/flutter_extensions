import 'package:flutter/widgets.dart';

extension SizeExtension on Size {
  Offset get center => Offset(width / 2, height / 2);
  Size shrink(EdgeInsets padding) => Size(width - padding.horizontal, height - padding.vertical);
  BoxConstraints get constraints => BoxConstraints.tight(this);
  SizedBox box() => SizedBox.fromSize(size: this);
}
