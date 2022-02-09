import 'package:flutter/material.dart';

class GridCustomPainter extends CustomPainter {
  final Color lineColor;

  GridCustomPainter({
    required this.lineColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var paintMainGrid = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    var mainSquareSide = 60.0;

    var paintSecondaryGrid = Paint()
      ..color = lineColor.withOpacity(0.1)
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    var secondarySquareSide = 15.0;

    for (var i = 0; i < size.width / mainSquareSide; i++) {
      Offset mainGridStartingPoint = Offset(mainSquareSide * i, 0);
      Offset mainGridEndingPoint = Offset(mainSquareSide * i, size.height);

      canvas.drawLine(
          mainGridStartingPoint, mainGridEndingPoint, paintMainGrid);
    }

    for (var i = 0; i < size.height / mainSquareSide; i++) {
      Offset startingPoint = Offset(0, mainSquareSide * i);
      Offset endingPoint = Offset(size.width, mainSquareSide * i);

      canvas.drawLine(startingPoint, endingPoint, paintMainGrid);
    }

    for (var i = 0; i < size.width / secondarySquareSide; i++) {
      Offset secondaryGridStartingPoint = Offset(secondarySquareSide * i, 0);
      Offset secondaryGridEndingPoint =
          Offset(secondarySquareSide * i, size.height);

      canvas.drawLine(secondaryGridStartingPoint, secondaryGridEndingPoint,
          paintSecondaryGrid);
    }

    for (var i = 0; i < size.height / secondarySquareSide; i++) {
      Offset secondaryGridStartingPoint = Offset(0, secondarySquareSide * i);
      Offset secondaryGridEndingPoint =
          Offset(size.width, secondarySquareSide * i);

      canvas.drawLine(secondaryGridStartingPoint, secondaryGridEndingPoint,
          paintSecondaryGrid);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
