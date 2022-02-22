// ignore_for_file: unnecessary_this

import 'package:diagrams/common/grid_property_provider.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:touchable/touchable.dart';

class GridCustomPainter extends CustomPainter {
  final BuildContext context;
  final List<AbstractFlowElement>? flowElementsList;

  GridCustomPainter({
    required this.context,
    this.flowElementsList,
  });

  var enablePanUpdate = true;
  ArrowModel? arrowEndPointFound;
  AbstractFlowElement? elementAnchorPointFound;

  @override
  void paint(Canvas canvas, Size size) {
    var myCanvas = TouchyCanvas(context, canvas);

    var lineColor = Theme.of(context).dividerColor;

    var mainSquareSide = GetIt.I<GridPropertyProvider>().mainSquareSide;
    var secondarySquareSide =
        GetIt.I<GridPropertyProvider>().secondarySquareSide;

    var paintMainGrid = Paint()
      ..color = lineColor
      ..strokeWidth = GetIt.I<GridPropertyProvider>().mainStrokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var mainAnchorGrid = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var secondaryAnchorGrid = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var paintSecondaryGrid = Paint()
      ..color = lineColor.withOpacity(0.1)
      ..strokeWidth = GetIt.I<GridPropertyProvider>().secondaryStrokeWith
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Offset normalizedPointToGrid(Offset point) {
      var newPoint = Offset((point.dx - point.dx % 15).roundToDouble(),
          (point.dy - point.dy % 15).roundToDouble());

      return newPoint;
    }

    void onPanDown(DragDownDetails details) {
      var newPoint = normalizedPointToGrid(details.localPosition);
      elementAnchorPointFound = flowElementsList?.firstWhereOrNull((e) =>
          e.anchorPointsModelMap!.anchorPointList.firstWhereOrNull((e) {
            return (e.anchorPointPositionRelativeToParent - newPoint)
                    .distanceSquared <=
                450;
          }) !=
          null);

      arrowEndPointFound = context
          .read<DrawArrowsBloc>()
          .arrowModelList
          .firstWhereOrNull((element) => element.endPoint == newPoint);

      if (elementAnchorPointFound == null && arrowEndPointFound == null) {
        enablePanUpdate = false;
        return;
      }

      enablePanUpdate = true;

      this.context.read<DrawArrowsBloc>().add(
            DrawArrowsEvent(
              startPoint: newPoint,
              arrowKey: UniqueKey(),
              startElement: elementAnchorPointFound,
              startPointKey: elementAnchorPointFound
                  ?.anchorPointsModelMap?.anchorPointList
                  .firstWhereOrNull((element) =>
                      element.anchorPointPositionRelativeToParent == newPoint)
                  ?.anchorPointKey,
            ),
          );
    }

    void onPanUpdate(DragUpdateDetails details) {
      if (!enablePanUpdate) return;
      var newPoint = normalizedPointToGrid(details.localPosition);

      this.context.read<DrawArrowsBloc>().add(
            DrawArrowsEvent(
                endPoint: newPoint, arrowKey: arrowEndPointFound?.arrowKey),
          );
    }

    void onPanEnd(DragEndDetails details) {
      if (!enablePanUpdate) return;
      this.context.read<DrawArrowsBloc>().add(
            DrawArrowsAStarEvent(),
          );
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
        onPanDown: onPanDown,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
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
        onPanDown: onPanDown,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
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
          onPanDown: onPanDown,
          onPanUpdate: onPanUpdate,
          onPanEnd: onPanEnd,
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
          onPanDown: onPanDown,
          onPanUpdate: onPanUpdate,
          onPanEnd: onPanEnd,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
