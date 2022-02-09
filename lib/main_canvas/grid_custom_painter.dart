import 'package:flutter/material.dart';

class GridCustomPainter extends CustomPainter {
  final Color lineColor;

  GridCustomPainter({
    required this.lineColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = lineColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    var squareSide = 20.0;

    for (var i = 0; i < size.width / squareSide; i++) {
      Offset startingPoint = Offset(squareSide * i, 0);
      Offset endingPoint = Offset(squareSide * i, size.height);

      canvas.drawLine(startingPoint, endingPoint, paint);
    }

    for (var i = 0; i < size.height / squareSide; i++) {
      Offset startingPoint = Offset(0, squareSide * i);
      Offset endingPoint = Offset(size.width, squareSide * i);

      canvas.drawLine(startingPoint, endingPoint, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
