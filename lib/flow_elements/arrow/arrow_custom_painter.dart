import 'dart:math';
import 'dart:ui';

import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:diagrams/helpers/a_star_algorithm.dart';
import 'package:flutter/material.dart';

class ArrowCustomPainter extends CustomPainter {
  final ArrowModel? arrowModel;
  final bool updateAStarPath;

  ArrowCustomPainter({required this.arrowModel, this.updateAStarPath = false});
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
    var donePointPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    if (updateAStarPath) {
      var pathToFollow = <Offset>[];

      pathToFollow.addAll(
        AStarAlgorithm(
          start: arrowModel!.startPoint,
          end: arrowModel!.endPoint,
        ).findThePath(
          doneList: (value) {
            canvas.drawPoints(PointMode.points, value, donePointPaint);
          },
        ),
      );

      for (var i = 0; i < pathToFollow.length - 1; i++) {
        canvas.drawLine(pathToFollow[i], pathToFollow[i + 1], pointPaint);
      }

      if (pathToFollow.isEmpty) return;

      arrowPoint = pathToFollow.last;

      secondToLastPoint = pathToFollow[pathToFollow.length - 2];
    } else {
      var path = Path()
        ..moveTo(arrowModel!.startPoint.dx, arrowModel!.startPoint.dy)
        ..lineTo(arrowModel!.endPoint.dx, arrowModel!.endPoint.dy);

      canvas.drawPath(path, pointPaint);

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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
