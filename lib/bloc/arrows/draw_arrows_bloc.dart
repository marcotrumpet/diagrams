import 'package:diagrams/bloc/arrows/arrow_model.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DrawArrowsBloc extends Bloc<AbstractDrawArrowsEvent, DrawArrowsState> {
  // ignore: unused_field
  var _startPoint = Offset.zero;
  var _arrowModelList = <ArrowModel>{};
  var _arrowKey = const Key('');

  DrawArrowsBloc(DrawArrowsState initialState) : super(initialState) {
    on<StartNewArrowEvent>(
      (event, emit) {
        _arrowModelList.add(event.arrowModel);
        _arrowKey = event.arrowModel.arrowKey;
        _startPoint = event.arrowModel.startPoint;
      },
    );

    on<DrawArrowsEvent>(
      (event, emit) async {
        if (event.endPoint != null) {
          // find arrow corresponding to key [event.key], if none update the last drawn [_arrowKey]
          _arrowModelList = _arrowModelList.map((e) {
            if (e.arrowKey == (event.arrowKey ?? _arrowKey)) {
              e = e.copyWith(
                endPoint: event.endPoint!,
                endPointKey: event.endPointKey,
                endElement: event.endElement,
              );
              emit(
                DrawArrowsState(
                  arrowModel: e,
                ),
              );
              return e;
            }
            return e;
          }).toSet();
        }
      },
    );

    on<DrawArrowsAStarEvent>(
      (event, emit) {
        _arrowModelList.removeWhere(
          (element) => element.arrowKey == event.arrowModel!.arrowKey,
        );
        _arrowModelList.add(event.arrowModel!);
        emit(
          DrawArrowsState(
            arrowModel: event.arrowModel,
          ),
        );
      },
    );

    on<ResetArrowAStarStateEvent>((event, emit) {
      _arrowModelList = _arrowModelList.map((e) {
        if (e.arrowKey == event.arrowKey) {
          return e.copyWith(updateAStarPath: false);
        }
        return e;
      }).toSet();
    });

    ArrowModel? findStartArrow(ArrowModel arrow, AnchorPointModel anchorPoint) {
      var _tmpArrow = _arrowModelList.firstWhereOrNull(
        (element) =>
            element.startElement?.elementKey == arrow.startElement?.elementKey,
      );

      if (_tmpArrow != null) {
        var _newStartPoint = anchorPoint.anchorPointPositionRelativeToParent;

        var _updatedTmpArrow = _tmpArrow.copyWith(
          startPoint: _newStartPoint,
          updateAStarPath: true,
        );

        _arrowModelList
            .removeWhere((element) => element.arrowKey == _tmpArrow.arrowKey);
        _arrowModelList.add(_updatedTmpArrow);

        return _updatedTmpArrow;
      }

      return null;
    }

    ArrowModel? findEndArrow(ArrowModel arrow, AnchorPointModel anchorPoint) {
      var _tmpArrow = _arrowModelList.firstWhereOrNull(
        (element) =>
            element.endElement?.elementKey == arrow.endElement?.elementKey,
      );

      if (_tmpArrow != null) {
        var _newEndPoint = anchorPoint.anchorPointPositionRelativeToParent;

        var _updatedTmpArrow = _tmpArrow.copyWith(
          endPoint: _newEndPoint,
          updateAStarPath: true,
        );

        _arrowModelList
            .removeWhere((element) => element.arrowKey == _tmpArrow.arrowKey);
        _arrowModelList.add(_updatedTmpArrow);

        return _updatedTmpArrow;
      }

      return null;
    }

    on<MovedFlowElementUpdateArrowsEvent>((event, emit) {
      for (AnchorPointModel anchorPoint
          in event.element?.anchorPointsModelMap?.anchorPointList ?? []) {
        // on element move update arrow starts from specific element
        for (ArrowModel arrowStart in anchorPoint.arrowModelStart ?? []) {
          var updatedStartArrow = findStartArrow(arrowStart, anchorPoint);

          if (updatedStartArrow == null) break;

          emit(
            DrawArrowsState(
              arrowModel: updatedStartArrow,
            ),
          );
        }

        // on element move update arrow ends from specific element
        for (ArrowModel arrowEnd in anchorPoint.arrowModelEnd ?? []) {
          var updatedEndArrow = findEndArrow(arrowEnd, anchorPoint);

          if (updatedEndArrow == null) break;

          emit(
            DrawArrowsState(
              arrowModel: updatedEndArrow,
            ),
          );
        }
      }

      for (var arrow in _arrowModelList) {
        for (var point in arrow.currentArrowPath ?? []) {
          if (event.element?.path
                  .getBounds()
                  .inflate(15)
                  .translate(
                      event.element!.offset!.dx, event.element!.offset!.dy)
                  .contains(point) ??
              false) {
            emit(
              DrawArrowsState(
                arrowModel: arrow.copyWith(updateAStarPath: true),
              ),
            );
            break;
          }
        }
      }
    });

    on<SavePathToArrowEvent>((event, emit) {
      var arrow = _arrowModelList.firstWhereOrNull(
        (element) => element.arrowKey == event.arrowKey,
      );
      if (arrow == null) return;

      arrow = arrow.copyWith(currentArrowPath: event.arrowPath);

      _arrowModelList
          .removeWhere((element) => element.arrowKey == arrow!.arrowKey);
      _arrowModelList.add(arrow);
    });

    on<RemoveArrowStartingFromPointEvent>((event, emit) {
      for (var arrowKey in event.arrowKeys) {
        _arrowModelList.removeWhere((element) => element.arrowKey == arrowKey);
        emit(
          DrawArrowsState.remove(
            arrowKey: arrowKey,
          ),
        );
      }
    });

    on<UpdateArrowModelEvent>((event, emit) {
      var _arrow = _arrowModelList.firstWhereOrNull(
          (element) => element.arrowKey == event.model.arrowKey);

      if (_arrow == null) return;

      var newArrow = _arrow.copyWith(
        startPoint: event.model.startPoint,
        endPoint: event.model.endPoint,
      );

      _arrowModelList
          .removeWhere((element) => element.arrowKey == _arrow.arrowKey);
      _arrowModelList.add(newArrow);
    });

    on<ClearAllArrowEvent>(
      (event, emit) {
        arrowModelList.clear();

        emit(const DrawArrowsState.removeAll());
      },
    );
  }

  Set<ArrowModel> get arrowModelList => _arrowModelList;

  Key get lastArrowDrawnKey => _arrowKey;
}
