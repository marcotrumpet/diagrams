import 'dart:math';
import 'dart:ui';

import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/helpers/a_star/a_star_algorithm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArrowCustomPainter extends CustomPainter {
  final ArrowModel? arrowModel;
  final BuildContext context;

  ArrowCustomPainter({required this.arrowModel, required this.context});

  Offset midPoint(Offset start, Offset end) {
    return Offset((start.dx + end.dx) / 2, (start.dy + end.dy) / 2);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (arrowModel == null) return;

    var arrowPoint = Offset.zero;
    var secondToLastPoint = Offset.zero;

    var pointPaint = Paint()
      ..color = Theme.of(context).unselectedWidgetColor.withOpacity(1.0)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    var pointPaintWhileDrawing = Paint()
      ..color = Theme.of(context).disabledColor
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    var test = Paint()
      ..color = Colors.red
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

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

      context.read<DrawArrowsBloc>().add(
            SavePathToArrowEvent(
              arrowKey: arrowModel!.arrowKey,
              arrowPath: pathToFollow,
            ),
          );

      var _direction = double.infinity;
      var pointsWhereTurn = <Offset>[];

      for (var i = 0; i < pathToFollow.length - 1; i++) {
        if (i + 1 < pathToFollow.length) {
          var newDirection = (pathToFollow[i + 1] - pathToFollow[i]).direction;
          if (newDirection != _direction) {
            pointsWhereTurn.add(pathToFollow[i]);

            _direction = newDirection;
          }
        }
        canvas.drawLine(pathToFollow[i], pathToFollow[i + 1], pointPaint);
      }

      // Draw middle point of paths' segments
      //
      // for (var i = 0; i < pointsWhereTurn.length; i++) {
      //   if (i + 1 >= pointsWhereTurn.length) {
      //     var _midPoint = midPoint(pointsWhereTurn[i], arrowModel!.endPoint);
      //     canvas.drawPoints(PointMode.points, [_midPoint], test);
      //   } else {
      //     var _midPoint = midPoint(pointsWhereTurn[i], pointsWhereTurn[i + 1]);
      //     canvas.drawPoints(PointMode.points, [_midPoint], test);
      //   }
      // }

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

      // Update arrowModel inside linked anchorPoints
      context.read<DrawArrowsBloc>().add(
            UpdateArrowModelEvent(model: arrowModel!),
          );
      context.read<AddRemoveElementBloc>().add(
            RefreshLinkedArrowInsideElements(arrowModel: arrowModel!),
          );
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
