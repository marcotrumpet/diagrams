import 'dart:math';

import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DrawArrowsBloc extends Bloc<AbstractDrawArrowsEvent, DrawArrowsState> {
  var _startPoint = Offset.zero;
  // var mapStartPointArrowPath = <Offset, Path>{};
  var _arrowModelList = <ArrowModel>[];
  var _lastDrawedPoint = Offset.infinite;
  var _lastPointTurn90 = Offset.infinite;
  var _lastDrawedPath = Path();
  var _arrowKey = const Key('');

  DrawArrowsBloc(DrawArrowsState initialState) : super(initialState) {
    on<DrawArrowsEvent>(
      (event, emit) {
        if (event.startPoint != null && event.arrowKey != null) {
          startNewArrow(event);
        }
        if (event.endPoint != null) {
          final newPath = calculatePath(_startPoint, event.endPoint!);

          _arrowModelList = _arrowModelList.map((e) {
            if (e.arrowKey == _arrowKey) {
              return e.copyWith(arrowPath: newPath, endPoint: event.endPoint!);
            }
            return e;
          }).toList();

          final newArrowLists = <ArrowModel>[..._arrowModelList];

          emit(
            DrawArrowsState(
              arrowModelList: newArrowLists,
            ),
          );
        }
      },
    );

    on<UpdateArrowsEvent>((event, emit) {
      var arrowIndex = _arrowModelList.indexWhere((element) =>
          element.startElement?.elementKey == event.startElement?.elementKey);

      if (arrowIndex != -1) {
        var _tmpArrow = _arrowModelList.elementAt(arrowIndex);
        _arrowModelList.removeAt(arrowIndex);
        var _newStartPoint = event
                .startElement?.anchorPointsModelMap?.anchorPointList
                .firstWhereOrNull((element) =>
                    element.anchorPointKey == _tmpArrow.startPointKey)
                ?.anchorPointPositionRelativeToParent ??
            Offset.zero;
        var _updatedTmpArrow = _tmpArrow.copyWith(
            startPoint: _newStartPoint,
            arrowPath: calculatePath(_newStartPoint, _tmpArrow.endPoint,
                forceNewStartPoint: true));
        _arrowModelList.add(_updatedTmpArrow);

        final newArrowLists = <ArrowModel>[..._arrowModelList];

        emit(
          DrawArrowsState(
            arrowModelList: newArrowLists,
          ),
        );
      }
    });
  }

  void startNewArrow(DrawArrowsEvent event) {
    _arrowModelList.add(
      ArrowModel(
          arrowPath: Path(),
          startPoint: event.startPoint!,
          endPoint: Offset.infinite,
          arrowKey: event.arrowKey!,
          startElement: event.startElement,
          startPointKey: event.startPointKey!),
    );
    _arrowKey = event.arrowKey!;
    _startPoint = event.startPoint!;

    _lastDrawedPath = Path();
    _lastPointTurn90 = Offset.infinite;
    _lastDrawedPoint = Offset.infinite;
  }

  Path calculatePath(Offset startPoint, Offset endPoint,
      {bool forceNewStartPoint = false}) {
    var path = Path();

    if (forceNewStartPoint) {
      path.moveTo(startPoint.dx, startPoint.dy);

      _lastDrawedPath.computeMetrics().forEach((element) {
        var position = element.getTangentForOffset(0.0)?.position;
        if (position != null) {
          path.lineTo(position.dx, position.dy);
        }
      });

      return path;
    }
    _lastPointTurn90 =
        _lastPointTurn90 == Offset.infinite ? startPoint : _lastPointTurn90;

    var direction = (endPoint - _lastPointTurn90).direction;

    if (direction == 0 ||
        direction == pi / 2 ||
        direction == -pi / 2 ||
        direction == pi) {
      _lastDrawedPoint = endPoint;
      path
        ..moveTo(_lastPointTurn90.dx, _lastPointTurn90.dy)
        ..lineTo(endPoint.dx, endPoint.dy);
    } else {
      _lastPointTurn90 = _lastDrawedPoint;
    }

    _lastDrawedPath.addPath(path, Offset.zero);

    return _lastDrawedPath;
  }
}
// flutter: Offset(330.0, 360.0)
// flutter: Offset(255.0, 360.0)
