import 'package:diagrams/flow_elements/abstract_custom_painter.dart';
import 'package:flutter/material.dart';

class RectangleCustomPainter extends AbstractCustomPainter {
  RectangleCustomPainter({required Path path, required BuildContext context})
      : super(path: path, context: context);
}

// class CP extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint _paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 4.0
//       ..style = PaintingStyle.stroke
//       ..strokeJoin = StrokeJoin.round;

//     var path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

//     Path dashPath = Path();

//     double dashWidth = 10.0;
//     double dashSpace = 5.0;
//     double distance = 0.0;

//     for (PathMetric pathMetric in path.computeMetrics()) {
//       while (distance < pathMetric.length) {
//         dashPath.addPath(
//           pathMetric.extractPath(distance, distance + dashWidth),
//           Offset.zero,
//         );
//         distance += dashWidth;
//         distance += dashSpace;
//       }
//     }
//     canvas.drawPath(dashPath, _paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
