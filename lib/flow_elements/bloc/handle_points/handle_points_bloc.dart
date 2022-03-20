import 'package:bloc/bloc.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'handle_points_bloc.freezed.dart';
part 'handle_points_event.dart';
part 'handle_points_state.dart';

class HandlePointsBloc extends Bloc<HandlePointsEvent, HandlePointsState> {
  final AddRemoveElementBloc addRemoveElementBloc;
  final DrawArrowsBloc drawArrowsBloc;

  var enablePanUpdate = true;
  ArrowModel? arrowEndPointFound;
  AbstractFlowElement? elementAnchorPointFound;
  Offset lastDrawnPoint = Offset.zero;
  HandlePointsBloc({
    required this.addRemoveElementBloc,
    required this.drawArrowsBloc,
  }) : super(const _Initial()) {
    void resetVariables() {
      lastDrawnPoint = Offset.zero;
      arrowEndPointFound = null;
      elementAnchorPointFound = null;
    }

    double roundBaseFifteen(double n) {
      var lowest = n - (n % 15);
      var highest = (n + 15) - ((n + 15) % 15);

      return (n - lowest).abs() <= (n - highest).abs() ? lowest : highest;
    }

    Offset normalizedStartPointToGrid(Offset point) {
      var newPoint = Offset(
        roundBaseFifteen(point.dx),
        roundBaseFifteen(point.dy),
      );

      return newPoint;
    }

    Offset normalizedPointToGrid(Offset point) {
      var newPoint =
          Offset((point.dx - point.dx % 15), (point.dy - point.dy % 15));

      return newPoint;
    }

    void onPanDown(Offset offset) {
      var newPoint = normalizedStartPointToGrid(offset);
      elementAnchorPointFound =
          addRemoveElementBloc.elementsList.firstWhereOrNull((e) =>
              e.anchorPointsModelMap!.anchorPointList.firstWhereOrNull((e) {
                return (e.anchorPointPositionRelativeToParent - newPoint)
                        .distanceSquared <=
                    450;
              }) !=
              null);

      arrowEndPointFound = drawArrowsBloc.arrowModelList
          .firstWhereOrNull((element) => (element.endPoint == newPoint));

      if (elementAnchorPointFound == null && arrowEndPointFound == null) {
        enablePanUpdate = false;
        resetVariables();
        return;
      }

      var startPointKey = elementAnchorPointFound
          ?.anchorPointsModelMap?.anchorPointList
          .firstWhereOrNull((element) =>
              (element.anchorPointPositionRelativeToParent - newPoint)
                  .distanceSquared <=
              450)
          ?.anchorPointKey;

      // TODO check if this is correct
      if (arrowEndPointFound != null) {
        drawArrowsBloc.add(
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
          endPointKey: UniqueKey(),
          arrowKey: UniqueKey(),
          startElement: elementAnchorPointFound,
          startPointKey: startPointKey,
        );
        // create new arrow given starting point matching flow element anchor point
        drawArrowsBloc.add(
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

    void onPanUpdate(Offset offset) {
      if (!enablePanUpdate) return;
      lastDrawnPoint = normalizedPointToGrid(offset);

      var currentArrow = drawArrowsBloc.arrowModelList
          .firstWhereOrNull(
              (element) => element.arrowKey == drawArrowsBloc.lastArrowDrawnKey)
          ?.copyWith(endPoint: lastDrawnPoint);

      drawArrowsBloc.add(
        DrawArrowsEvent(
          endPoint: lastDrawnPoint,
          arrowKey: arrowEndPointFound?.arrowKey ?? currentArrow?.arrowKey,
        ),
      );
    }

    void onPanEnd() {
      if (!enablePanUpdate) return;

      var endElementAnchorPointFound =
          addRemoveElementBloc.elementsList.firstWhereOrNull((e) =>
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
          drawArrowsBloc.add(
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
              drawArrowsBloc.arrowModelList.firstWhereOrNull(
                (element) =>
                    element.arrowKey == drawArrowsBloc.lastArrowDrawnKey,
              );

          if (_arrowModel == null) {
            resetVariables();
            return;
          }

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
          drawArrowsBloc.add(
            DrawArrowsAStarEvent(
              arrowModel: _arrowModel,
            ),
          );
        }
      }

      var currentArrow = drawArrowsBloc.arrowModelList
          .firstWhereOrNull(
              (element) => element.arrowKey == drawArrowsBloc.lastArrowDrawnKey)
          ?.copyWith(endPoint: lastDrawnPoint);

      if (arrowEndPointFound != null) {
        arrowEndPointFound = arrowEndPointFound?.copyWith(
          updateAStarPath: true,
          endPoint: lastDrawnPoint,
          endPointKey: UniqueKey(),
        );

        drawArrowsBloc.add(
          DrawArrowsEvent(
            endPoint: arrowEndPointFound!.endPoint,
            endPointKey: arrowEndPointFound!.endPointKey,
            arrowKey: arrowEndPointFound!.arrowKey,
          ),
        );

        drawArrowsBloc.add(
          DrawArrowsAStarEvent(
            arrowModel: arrowEndPointFound,
          ),
        );
      } else if (currentArrow != null) {
        currentArrow = currentArrow.copyWith(
          updateAStarPath: true,
          endPoint: lastDrawnPoint,
        );

        drawArrowsBloc.add(
          DrawArrowsEvent(
            endPoint: currentArrow.endPoint,
            endPointKey: currentArrow.endPointKey,
            arrowKey: currentArrow.arrowKey,
          ),
        );

        drawArrowsBloc.add(
          DrawArrowsAStarEvent(
            arrowModel: currentArrow,
          ),
        );
      }
      resetVariables();
    }

    on<HandlePointsEvent>((event, emit) {
      event.maybeWhen(
        panDown: onPanDown,
        panUpdate: onPanUpdate,
        panEnd: onPanEnd,
        orElse: () => null,
      );
    });
  }
}
