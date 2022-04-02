import 'package:diagrams/bloc/add_remove_element/add_remove_element_event.dart';
import 'package:diagrams/common/app_extensions.dart';
import 'package:diagrams/common/grid_property_provider.dart';
import 'package:diagrams/common/update_barrier_model.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

class AddRemoveElementBloc
    extends Bloc<AbstractAddRemoveElementEvent, List<AbstractFlowElement>> {
  List<AbstractFlowElement> elementsList = [];
  AddRemoveElementBloc(List<AbstractFlowElement> initialState)
      : super(initialState) {
    on<AddStartingPointToAnchorElementEvent>((event, emit) {
      //find arrow model list for the specific anchor point
      var arrowModelStart = event
          .elementToManipulate.anchorPointsModelMap?.anchorPointList
          .firstWhereOrNull((element) =>
              element.anchorPointKey ==
              event.arrowModelLinkedToElement.startPointKey)
          ?.arrowModelStart;

      // add the new arrow model linked to element to the list
      arrowModelStart = [
        ...arrowModelStart ?? [],
        event.arrowModelLinkedToElement
      ];

      // update the arrow model list with new arrow
      var anchorPointListUpdated = event
          .elementToManipulate.anchorPointsModelMap?.anchorPointList
          .map((e) {
        if (e.anchorPointKey == event.arrowModelLinkedToElement.startPointKey) {
          e = e.copyWith(arrowModelStart: arrowModelStart);
          return e;
        }
        return e;
      }).toList();

      var elementUpdated = event.elementToManipulate.copyWith(
        anchorPointsModelMap: event.elementToManipulate.anchorPointsModelMap
            ?.copyWith(anchorPointList: anchorPointListUpdated!),
      );

      // refresh elements list with updated element
      elementsList
          .removeWhere((el) => el.elementKey == elementUpdated.elementKey);
      elementsList.add(elementUpdated);

      // Make sure this is not needed anymore
      //
      GetIt.I<GridPropertyProvider>().updateGridBarriers(
        UpdateBarrierModel(
          abstractFlowElement: event.elementToManipulate,
          endPointsToExclude: event.arrowModelLinkedToElement.startPoint
              .calcSurroundingPoints(),
        ),
      );

      final List<AbstractFlowElement> newList = [...elementsList];

      emit(newList);
    });

    on<AddEndingPointToAnchorElementEvent>((event, emit) {
      //find arrow model list for the specific anchor point
      var arrowModelEnd = event
          .elementToManipulate.anchorPointsModelMap?.anchorPointList
          .firstWhereOrNull((element) =>
              element.anchorPointKey ==
              event.arrowModelLinkedToElement.endPointKey)
          ?.arrowModelEnd;

      // add the new arrow model linked to element to the list
      arrowModelEnd = [...arrowModelEnd ?? [], event.arrowModelLinkedToElement];

      // update the arrow model list with new arrow
      var anchorPointListUpdated = event
          .elementToManipulate.anchorPointsModelMap?.anchorPointList
          .map((e) {
        if (e.anchorPointKey == event.arrowModelLinkedToElement.endPointKey) {
          e = e.copyWith(arrowModelEnd: arrowModelEnd);
          return e;
        }
        return e;
      }).toList();

      var elementUpdated = event.elementToManipulate.copyWith(
        anchorPointsModelMap: event.elementToManipulate.anchorPointsModelMap
            ?.copyWith(anchorPointList: anchorPointListUpdated!),
      );

      // refresh elements list with updated element
      elementsList
          .removeWhere((el) => el.elementKey == elementUpdated.elementKey);
      elementsList.add(elementUpdated);

      var end = event.arrowModelLinkedToElement.endPoint;
      GetIt.I<GridPropertyProvider>().updateGridBarriers(
        UpdateBarrierModel(
          abstractFlowElement: event.elementToManipulate,
          endPointsToExclude: end.calcSurroundingPoints(),
        ),
      );

      final List<AbstractFlowElement> newList = [...elementsList];

      emit(newList);
    });

    on<AddElementEvent>((event, emit) {
      elementsList.add(event.elementToManipulate);
      final List<AbstractFlowElement> newList = [...elementsList];
      GetIt.I<GridPropertyProvider>().updateGridBarriers(
        UpdateBarrierModel(
          abstractFlowElement: event.elementToManipulate,
        ),
      );
      emit(newList);
    });

    on<RemoveElementEvent>(
      (event, emit) {
        elementsList.removeWhere((element) =>
            element.elementKey == event.elementToManipulate.elementKey);
        final List<AbstractFlowElement> newList = [...elementsList];
        GetIt.I<GridPropertyProvider>().updateGridBarriers(
          UpdateBarrierModel(
            abstractFlowElement: event.elementToManipulate,
          ),
        );
        emit(newList);
      },
    );

    on<ScaleElementEvent>(
      ((event, emit) {
        elementsList.removeWhere((element) =>
            element.elementKey == event.elementToManipulate.elementKey);
        elementsList.add(event.elementToManipulate);
        final List<AbstractFlowElement> newList = [...elementsList];
        emit(newList);
      }),
    );

    on<MoveElementEvent>((event, emit) {
      elementsList.removeWhere((element) =>
          element.elementKey == event.elementToManipulate.elementKey);
      elementsList.add(event.elementToManipulate);
      final List<AbstractFlowElement> newList = [...elementsList];

      var pointsToExclude = <Offset>[];
      for (AnchorPointModel anchorPoint
          in event.elementToManipulate.anchorPointsModelMap?.anchorPointList ??
              []) {
        if (anchorPoint.arrowModelEnd?.isNotEmpty ?? false) {
          pointsToExclude.addAll(anchorPoint.anchorPointPositionRelativeToParent
              .calcSurroundingPoints());
        }
        if (anchorPoint.arrowModelStart?.isNotEmpty ?? false) {
          anchorPoint.arrowModelStart?.forEach((element) {
            pointsToExclude.addAll(element.endPoint.calcSurroundingPoints());
          });
        }
      }
      GetIt.I<GridPropertyProvider>().updateGridBarriers(
        UpdateBarrierModel(
          abstractFlowElement: event.elementToManipulate,
          endPointsToExclude: pointsToExclude,
        ),
      );
      emit(newList);
    });

    on<RefreshLinkedArrowInsideElements>((event, emit) {
      elementsList = elementsList.map(
        (element) {
          var _anchors = <AnchorPointModel>[];
          for (AnchorPointModel anchor
              in element.anchorPointsModelMap?.anchorPointList ?? []) {
            _anchors.add(
              anchor.copyWith(
                arrowModelEnd: anchor.arrowModelEnd?.map(
                  (el) {
                    if (el.arrowKey == event.arrowModel.arrowKey) {
                      return event.arrowModel;
                    }
                    return el;
                  },
                ).toList(),
                arrowModelStart: anchor.arrowModelStart?.map(
                  (el) {
                    if (el.arrowKey == event.arrowModel.arrowKey) {
                      return event.arrowModel;
                    }
                    return el;
                  },
                ).toList(),
              ),
            );
          }
          element = element.copyWith(
            anchorPointsModelMap: element.anchorPointsModelMap
                ?.copyWith(anchorPointList: _anchors),
          );

          return element;
          // elementsList.removeWhere((el) => el.elementKey == element.elementKey);
          // elementsList.add(element);
        },
      ).toList();

      final List<AbstractFlowElement> newList = [...elementsList];

      emit(newList);
    });
  }
}
