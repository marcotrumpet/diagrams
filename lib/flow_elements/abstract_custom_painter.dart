import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AbstractCustomPainter extends CustomPainter {
  final Path path;
  final BuildContext context;

  AbstractCustomPainter({required this.path, required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    var borderPaint = Paint()
      ..color = Theme.of(context).unselectedWidgetColor.withOpacity(1.0)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    var backgroundPaint = Paint()..color = Theme.of(context).canvasColor;

    canvas.drawPath(path, backgroundPaint);
    canvas.drawPath(path, borderPaint);
    canvas.clipPath(path);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DotLineCustomPainter extends CustomPainter {
  final Path path;
  final BuildContext context;

  DotLineCustomPainter({required this.path, required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()
      ..color = Theme.of(context).disabledColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    var newPath = path;

    var boundsPath = Path()..addRect(newPath.getBounds());

    Path dashPath = Path();

    double dashWidth = 8.0;
    double dashSpace = 5.0;
    double distance = 0.0;

    for (PathMetric pathMetric in boundsPath.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth;
        distance += dashSpace;
      }
    }

    canvas.drawPath(dashPath, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
