import 'package:diagrams/common/grid/grid_property_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class GridCustomPainter extends CustomPainter {
  final BuildContext context;

  GridCustomPainter({
    required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var lineColor = Theme.of(context).dividerColor;

    var mainSquareSide = GetIt.I<GridPropertyProvider>().mainSquareSide;
    var secondarySquareSide =
        GetIt.I<GridPropertyProvider>().secondarySquareSide;

    var paintMainGrid = Paint()
      ..color = lineColor
      ..strokeWidth = GetIt.I<GridPropertyProvider>().mainStrokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var paintSecondaryGrid = Paint()
      ..color = lineColor.withOpacity(0.1)
      ..strokeWidth = GetIt.I<GridPropertyProvider>().secondaryStrokeWith
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < size.width / mainSquareSide; i++) {
      Offset mainGridStartingPoint = Offset(mainSquareSide * i, 0);
      Offset mainGridEndingPoint = Offset(mainSquareSide * i, size.height);

      canvas.drawLine(
        mainGridStartingPoint,
        mainGridEndingPoint,
        paintMainGrid,
      );
    }

    for (var i = 0; i < size.height / mainSquareSide; i++) {
      Offset startingPoint = Offset(0, mainSquareSide * i);
      Offset endingPoint = Offset(size.width, mainSquareSide * i);

      canvas.drawLine(
        startingPoint,
        endingPoint,
        paintMainGrid,
      );
    }

    for (var i = 0; i < size.width / secondarySquareSide; i++) {
      if ((secondarySquareSide * i) % 60 != 0) {
        Offset secondaryGridStartingPoint = Offset(secondarySquareSide * i, 0);
        Offset secondaryGridEndingPoint =
            Offset(secondarySquareSide * i, size.height);

        canvas.drawLine(
          secondaryGridStartingPoint,
          secondaryGridEndingPoint,
          paintSecondaryGrid,
        );
      }
    }

    for (var i = 0; i < size.height / secondarySquareSide; i++) {
      if ((secondarySquareSide * i) % 60 != 0) {
        Offset secondaryGridStartingPoint = Offset(0, secondarySquareSide * i);
        Offset secondaryGridEndingPoint =
            Offset(size.width, secondarySquareSide * i);

        canvas.drawLine(
          secondaryGridStartingPoint,
          secondaryGridEndingPoint,
          paintSecondaryGrid,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
