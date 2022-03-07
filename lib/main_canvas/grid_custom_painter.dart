// ignore_for_file: unnecessary_this

import 'package:diagrams/common/grid_property_provider.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_event.dart';
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
  final AddRemoveElementBloc addRemoveElementBloc;

  GridCustomPainter({
    required this.context,
    required this.addRemoveElementBloc,
    this.flowElementsList,
  });

  var enablePanUpdate = true;
  ArrowModel? arrowEndPointFound;
  AbstractFlowElement? elementAnchorPointFound;
  Offset lastDrawnPoint = Offset.zero;

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

      var startPointKey = elementAnchorPointFound
          ?.anchorPointsModelMap?.anchorPointList
          .firstWhereOrNull((element) =>
              element.anchorPointPositionRelativeToParent == newPoint)
          ?.anchorPointKey;

      // TODO check if this is correct
      if (arrowEndPointFound != null) {
        context.read<DrawArrowsBloc>().add(
              DrawArrowsEvent(
                endPoint: newPoint,
                arrowKey: arrowEndPointFound?.arrowKey,
              ),
            );
      }

      if (startPointKey != null) {
        var newArrow = ArrowModel(
          startPoint: newPoint,
          endPoint: Offset.infinite,
          arrowKey: UniqueKey(),
          startElement: elementAnchorPointFound,
          startPointKey: startPointKey,
        );

        // create new arrow given starting point matching flow element anchor point
        context.read<DrawArrowsBloc>().add(
              StartNewArrowEvent(
                arrowModel: newArrow,
              ),
            );

        // update flow element with anchor point matching created arrow
        addRemoveElementBloc.add(
          AddStartingPointToAnchorElementEvent(
            elementToManipulate: elementAnchorPointFound!,
            arrowModelLinkedToElement: newArrow,
          ),
        );

        enablePanUpdate = true;
      }
    }

    void onPanUpdate(DragUpdateDetails details) {
      if (!enablePanUpdate) return;
      lastDrawnPoint = normalizedPointToGrid(details.localPosition);

      context.read<DrawArrowsBloc>().add(
            DrawArrowsEvent(
              endPoint: lastDrawnPoint,
              arrowKey: arrowEndPointFound?.arrowKey,
            ),
          );
    }

    void onPanEnd(DragEndDetails details) {
      if (!enablePanUpdate) return;

      var endElementAnchorPointFound = flowElementsList?.firstWhereOrNull((e) =>
          e.anchorPointsModelMap!.anchorPointList.firstWhereOrNull((e) {
            return (e.anchorPointPositionRelativeToParent - lastDrawnPoint)
                    .distanceSquared <=
                450;
          }) !=
          null);

      if (endElementAnchorPointFound != null) {
        var anchorPointPosition = Offset.zero;

        var endPointKey = endElementAnchorPointFound
            .anchorPointsModelMap?.anchorPointList
            .firstWhereOrNull((element) {
          if ((element.anchorPointPositionRelativeToParent - lastDrawnPoint)
                  .distanceSquared <=
              450) {
            anchorPointPosition = element.anchorPointPositionRelativeToParent;
            return true;
          }
          return false;
        })?.anchorPointKey;
        if (endPointKey != null) {
          context.read<DrawArrowsBloc>().add(
                DrawArrowsEvent(
                  endPoint: anchorPointPosition,
                  endPointKey: endPointKey,
                  endElement: endElementAnchorPointFound,
                  arrowKey: arrowEndPointFound?.arrowKey,
                ),
              );

          // need this to update also here endPointKey value. Previous bloc call to DrawArrowsEvent
          // isn't updated yet so the value is still the old one
          var _arrowModel = arrowEndPointFound ??
              context.read<DrawArrowsBloc>().arrowModelList.firstWhereOrNull(
                    (element) =>
                        element.arrowKey ==
                        context.read<DrawArrowsBloc>().lastArrowDrawnKey,
                  );

          if (_arrowModel == null) return;

          _arrowModel = _arrowModel.copyWith(
            endPointKey: endPointKey,
            endElement: endElementAnchorPointFound,
            updateAStarPath: true,
          );

          addRemoveElementBloc.add(
            AddEndingPointToAnchorElementEvent(
              elementToManipulate: endElementAnchorPointFound,
              arrowModelLinkedToElement: _arrowModel,
            ),
          );

          // apply A* after everything
          context.read<DrawArrowsBloc>().add(
                DrawArrowsAStarEvent(
                  arrowModel: _arrowModel,
                ),
              );
        }
      }

      if (arrowEndPointFound != null) {
        arrowEndPointFound =
            arrowEndPointFound?.copyWith(updateAStarPath: true);
        context.read<DrawArrowsBloc>().add(
              DrawArrowsAStarEvent(
                arrowModel: arrowEndPointFound,
              ),
            );
      }
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
