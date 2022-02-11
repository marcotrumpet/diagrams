import 'package:flutter/material.dart';

abstract class AbstractCustomPainter extends CustomPainter {
  final Path path;
  final BuildContext context;

  AbstractCustomPainter({required this.path, required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    var borderPaint = Paint()
      ..color = Theme.of(context).toggleableActiveColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    var backgroundPaint = Paint()..color = Theme.of(context).primaryColor;
    canvas.drawPath(path, backgroundPaint);
    canvas.drawPath(path, borderPaint);
    canvas.clipPath(path);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
