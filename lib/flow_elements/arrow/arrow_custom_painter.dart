import 'dart:math';

import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/helpers/a_star_algorithm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArrowCustomPainter extends CustomPainter {
  final ArrowModel? arrowModel;
  final BuildContext context;

  ArrowCustomPainter({required this.arrowModel, required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    if (arrowModel == null) return;

    var arrowPoint = Offset.zero;
    var secondToLastPoint = Offset.zero;

    var pointPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    var pointPaintWhileDrawing = Paint()
      ..color = Colors.black.withOpacity(0.5)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    if (arrowModel?.updateAStarPath ?? false) {
      // Reset updateAStarPath to let bloc force redraw after
      context.read<DrawArrowsBloc>().add(
            ResetArrowAStarStateEvent(arrowKey: arrowModel!.arrowKey),
          );

      var pathToFollow = <Offset>[];

      pathToFollow.addAll(
        AStarAlgorithm(
          start: arrowModel!.startPoint,
          end: arrowModel!.endPoint,
        ).findThePath(),
      );

      for (var i = 0; i < pathToFollow.length - 1; i++) {
        canvas.drawLine(pathToFollow[i], pathToFollow[i + 1], pointPaint);
      }

      if (pathToFollow.isEmpty) return;

      arrowPoint = pathToFollow.last;

      secondToLastPoint = pathToFollow[pathToFollow.length - 2];

      // calculate the tip of the arrow
      var direction = (arrowPoint - secondToLastPoint).direction;

      var arrowPointPath = Path();

      if (direction == 0) {
        // right
        arrowPointPath
          ..moveTo(arrowPoint.dx - 8, arrowPoint.dy + 8)
          ..lineTo(arrowPoint.dx, arrowPoint.dy)
          ..moveTo(arrowPoint.dx - 8, arrowPoint.dy - 8)
          ..lineTo(arrowPoint.dx, arrowPoint.dy)
          ..close();
      } else if (direction == pi / 2) {
        // down
        arrowPointPath
          ..moveTo(arrowPoint.dx - 8, arrowPoint.dy - 8)
          ..lineTo(arrowPoint.dx, arrowPoint.dy)
          ..moveTo(arrowPoint.dx + 8, arrowPoint.dy - 8)
          ..lineTo(arrowPoint.dx, arrowPoint.dy)
          ..close();
      } else if (direction == -pi / 2) {
        // up
        arrowPointPath
          ..moveTo(arrowPoint.dx - 8, arrowPoint.dy + 8)
          ..lineTo(arrowPoint.dx, arrowPoint.dy)
          ..moveTo(arrowPoint.dx + 8, arrowPoint.dy + 8)
          ..lineTo(arrowPoint.dx, arrowPoint.dy)
          ..close();
      } else if (direction == pi) {
        // left
        arrowPointPath
          ..moveTo(arrowPoint.dx + 8, arrowPoint.dy + 8)
          ..lineTo(arrowPoint.dx, arrowPoint.dy)
          ..moveTo(arrowPoint.dx + 8, arrowPoint.dy - 8)
          ..lineTo(arrowPoint.dx, arrowPoint.dy)
          ..close();
      }

      // draw pointy arrow
      canvas.drawPath(arrowPointPath, pointPaint);
    } else {
      var path = Path()
        ..moveTo(arrowModel!.startPoint.dx, arrowModel!.startPoint.dy)
        ..lineTo(arrowModel!.endPoint.dx, arrowModel!.endPoint.dy);

      canvas.drawPath(path, pointPaintWhileDrawing);

      if (path.computeMetrics().isEmpty ||
          path.computeMetrics().last.getTangentForOffset(0.0) == null) return;

      arrowPoint = path
          .computeMetrics()
          .last
          .getTangentForOffset(path.computeMetrics().last.length)!
          .position;

      secondToLastPoint =
          path.computeMetrics().last.getTangentForOffset(0.0)!.position;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
