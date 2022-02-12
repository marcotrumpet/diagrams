// ignore_for_file: unnecessary_this

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
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var mainAnchorGrid = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var secondaryAnchorGrid = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var paintSecondaryGrid = Paint()
      ..color = lineColor.withOpacity(0.1)
      ..strokeWidth = 0.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset normalizedPointToGrid(Offset point) {
      var newPoint = Offset((point.dx - point.dx % 15).roundToDouble(),
          (point.dy - point.dy % 15).roundToDouble());

      return newPoint;
    }

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
          var newPoint = normalizedPointToGrid(details.localPosition);
          this.context.read<DrawArrowsBloc>().add(
                DrawArrowsEvent(startPoint: newPoint),
              );
        },
        onPanUpdate: (details) {
          var newPoint = normalizedPointToGrid(details.localPosition);
          this.context.read<DrawArrowsBloc>().add(
                DrawArrowsEvent(endPoint: newPoint),
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
        onPanDown: (details) {
          var newPoint = normalizedPointToGrid(details.localPosition);
          this.context.read<DrawArrowsBloc>().add(
                DrawArrowsEvent(startPoint: newPoint),
              );
        },
        onPanUpdate: (details) {
          var newPoint = normalizedPointToGrid(details.localPosition);
          this.context.read<DrawArrowsBloc>().add(
                DrawArrowsEvent(endPoint: newPoint),
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
          onPanDown: (details) {
            var newPoint = normalizedPointToGrid(details.localPosition);
            this.context.read<DrawArrowsBloc>().add(
                  DrawArrowsEvent(startPoint: newPoint),
                );
          },
          onPanUpdate: (details) {
            var newPoint = normalizedPointToGrid(details.localPosition);
            this.context.read<DrawArrowsBloc>().add(
                  DrawArrowsEvent(endPoint: newPoint),
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
          onPanDown: (details) {
            var newPoint = normalizedPointToGrid(details.localPosition);
            this.context.read<DrawArrowsBloc>().add(
                  DrawArrowsEvent(startPoint: newPoint),
                );
          },
          onPanUpdate: (details) {
            var newPoint = normalizedPointToGrid(details.localPosition);
            this.context.read<DrawArrowsBloc>().add(
                  DrawArrowsEvent(endPoint: newPoint),
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
  final List<Path> arrowPaths;

  ArrowCustomPainter({required this.arrowPaths});
  @override
  void paint(Canvas canvas, Size size) {
    var pointPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    for (var arrow in arrowPaths) {
      canvas.drawPath(arrow, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
