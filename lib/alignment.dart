import 'package:flutter/widgets.dart';
import 'package:flutter_extensions/offset.dart';

extension AlignmentExtension on Alignment {
  static List<Alignment> get top => [Alignment.topLeft, Alignment.topCenter, Alignment.topRight];
  static List<Alignment> get center => [Alignment.centerLeft, Alignment.center, Alignment.centerRight];
  static List<Alignment> get bottom => [Alignment.bottomLeft, Alignment.bottomCenter, Alignment.bottomRight];
  static List<Alignment> get left => [Alignment.topLeft, Alignment.centerLeft, Alignment.bottomLeft];
  static List<Alignment> get right => [Alignment.topRight, Alignment.centerRight, Alignment.bottomRight];

  static const List<Alignment> circle = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerRight,
    Alignment.bottomRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.centerLeft,
    Alignment.center,
  ];

  static const List<Alignment> circleFine = [
    Alignment.topLeft,
    Alignment(-0.5, -1),
    Alignment.topCenter,
    Alignment(0.5, -1),
    Alignment.topRight,
    Alignment(1, -0.5),
    Alignment.centerRight,
    Alignment(1, 0.5),
    Alignment.bottomRight,
    Alignment(0.5, 1),
    Alignment.bottomCenter,
    Alignment(-0.5, 1),
    Alignment.bottomLeft,
    Alignment(-1, 0.5),
    Alignment.centerLeft,
    Alignment(-1, -0.5),
    Alignment.center,
  ];

  static const List<Alignment> square = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomRight,
    Alignment.bottomLeft,
  ];

  bool get isTop => y == -1;
  bool get isBottom => y == 1;
  bool get isCenterV => y == 0;
  bool get isCenterH => x == 0;
  bool get isCenter => isCenterH && isCenterV;
  bool get isLeft => x == -1;
  bool get isRight => x == 1;

  List<double> distances(List<Alignment> anchors, Size size) {
    return anchors.map((a) => a.alongSize(size).distanceTo(alongSize(size))).toList();
  }

  Alignment getClosest(List<Alignment> anchors, Size size) {
    final distances = this.distances(anchors, size);
    final minDistance = distances.reduce((value, element) => value < element ? value : element);
    final index = distances.indexOf(minDistance);
    return anchors[index];
  }

  Offset get asOffset => Offset(x, y);
}
