import 'dart:convert';

import 'package:flutter/services.dart';

extension ByteDataExtension on ByteData {
  String get asString {
    final buffer = this.buffer;
    final list = buffer.asUint8List(offsetInBytes, lengthInBytes);
    return utf8.decode(list);
  }
}
