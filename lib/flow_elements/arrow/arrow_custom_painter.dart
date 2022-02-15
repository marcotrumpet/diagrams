import 'dart:math';

import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:flutter/material.dart';

class ArrowCustomPainter extends CustomPainter {
  final List<ArrowModel> arrowModelList;

  ArrowCustomPainter({required this.arrowModelList});
  @override
  void paint(Canvas canvas, Size size) {
    var pointPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    if (arrowModelList.isEmpty) return;

    for (var arrow in arrowModelList) {
      canvas.drawPath(arrow.arrowPath, pointPaint);
    }

    var arrowPoint = arrowModelList.last.arrowPath
            .computeMetrics()
            .last
            .getTangentForOffset(
                arrowModelList.last.arrowPath.computeMetrics().last.length)
            ?.position ??
        Offset.zero;

    var lastSegmentPoint = arrowModelList.last.arrowPath
            .computeMetrics()
            .last
            .getTangentForOffset(0.0)
            ?.position ??
        Offset.zero;

    var direction = (arrowPoint - lastSegmentPoint).direction;

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

    canvas.drawPath(arrowPointPath, pointPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
