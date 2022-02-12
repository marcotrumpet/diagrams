import 'dart:ui';

import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touchable/touchable.dart';

class GridCustomPainter extends CustomPainter {
  final Color lineColor;
  final BuildContext context;

  GridCustomPainter({
    required this.lineColor,
    required this.context,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);

    var mainSquareSide = 60.0;
    var secondarySquareSide = 15.0;

    var paintMainGrid = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var mainAnchorGrid = Paint()
      ..color = Colors.red.withOpacity(0.3)
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var secondaryAnchorGrid = Paint()
      ..color = Colors.red.withOpacity(0.3)
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var paintSecondaryGrid = Paint()
      ..color = lineColor.withOpacity(0.1)
      ..strokeWidth = 1
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

      myCanvas.drawLine(
        mainGridStartingPoint,
        mainGridEndingPoint,
        mainAnchorGrid,
        onPanDown: (details) {
          // startingArrowPoint = details.localPosition;
        },
        onPanUpdate: (details) {
          var newPoint = Offset(
              (details.localPosition.dx - details.localPosition.dx % 15)
                  .roundToDouble(),
              details.localPosition.dy);
          // ignore: unnecessary_this
          this.context.read<DrawArrowsBloc>().add(
                DrawArrowsEvent(point: newPoint),
              );
        },
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

      myCanvas.drawLine(
        startingPoint,
        endingPoint,
        mainAnchorGrid,
        onPanUpdate: (details) {
          var newPoint = Offset(
              details.localPosition.dx,
              (details.localPosition.dy - details.localPosition.dy % 15)
                  .roundToDouble());
          // ignore: unnecessary_this
          this.context.read<DrawArrowsBloc>().add(
                DrawArrowsEvent(point: newPoint),
              );
        },
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

        myCanvas.drawLine(
          secondaryGridStartingPoint,
          secondaryGridEndingPoint,
          secondaryAnchorGrid,
          onPanUpdate: (details) {
            var newPoint = Offset(
                (details.localPosition.dx - details.localPosition.dx % 15)
                    .roundToDouble(),
                details.localPosition.dy);
            // ignore: unnecessary_this
            this.context.read<DrawArrowsBloc>().add(
                  DrawArrowsEvent(point: newPoint),
                );
          },
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

        myCanvas.drawLine(
          secondaryGridStartingPoint,
          secondaryGridEndingPoint,
          secondaryAnchorGrid,
          onPanUpdate: (details) {
            var newPoint = Offset(
                details.localPosition.dx,
                (details.localPosition.dy - details.localPosition.dy % 15)
                    .roundToDouble());
            // ignore: unnecessary_this
            this.context.read<DrawArrowsBloc>().add(
                  DrawArrowsEvent(point: newPoint),
                );
          },
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ArrowCustomPainter extends CustomPainter {
  final List<Offset> points;

  ArrowCustomPainter({required this.points});
  @override
  void paint(Canvas canvas, Size size) {
    var _pointPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    canvas.drawPoints(PointMode.lines, points, _pointPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
