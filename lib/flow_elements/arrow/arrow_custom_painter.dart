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

    for (var arrow in arrowModelList) {
      canvas.drawPath(arrow.arrowPath, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
