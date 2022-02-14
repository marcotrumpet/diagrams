import 'dart:math';

import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawArrowsBloc extends Bloc<DrawArrowsEvent, DrawArrowsState> {
  var startPoint = Offset.zero;
  // var mapStartPointArrowPath = <Offset, Path>{};
  var arrowModelList = <ArrowModel>[];
  var lastDrawedPoint = Offset.infinite;
  var lastPointTurn90 = Offset.infinite;
  var lastDrawedPath = Path();
  var arrowKey = const Key('');

  DrawArrowsBloc(DrawArrowsState initialState) : super(initialState) {
    on<DrawArrowsEvent>(
      (event, emit) {
        if (event.startPoint != null && event.arrowKey != null) {
          startNewArrow(event);
        }
        if (event.endPoint != null) {
          final newPath = calculatePath(event);

          arrowModelList = arrowModelList.map((e) {
            e.arrowKey == arrowKey;
            return e.copyWith(arrowPath: newPath, endPoint: event.endPoint);
          }).toList();

          final newArrowLists = <ArrowModel>[...arrowModelList];

          emit(
            DrawArrowsState(
              arrowModelList: newArrowLists,
            ),
          );
        }
      },
    );
  }

  void startNewArrow(DrawArrowsEvent event) {
    arrowModelList.add(
      ArrowModel(
        arrowPath: Path(),
        startPoint: event.startPoint!,
        endPoint: Offset.infinite,
        arrowKey: event.arrowKey!,
      ),
    );
    arrowKey = event.arrowKey!;
    startPoint = event.startPoint!;

    lastDrawedPath = Path();
    lastPointTurn90 = Offset.infinite;
    lastDrawedPoint = Offset.infinite;
  }

  Path calculatePath(DrawArrowsEvent event) {
    var path = Path();

    lastPointTurn90 =
        lastPointTurn90 == Offset.infinite ? startPoint : lastPointTurn90;

    var direction = (event.endPoint! - lastPointTurn90).direction;

    if (direction == 0 ||
        direction == pi / 2 ||
        direction == -pi / 2 ||
        direction == pi) {
      lastDrawedPoint = event.endPoint!;
      path
        ..moveTo(lastPointTurn90.dx, lastPointTurn90.dy)
        ..lineTo(event.endPoint!.dx, event.endPoint!.dy);
    } else {
      lastPointTurn90 = lastDrawedPoint;
      // path
      //   ..moveTo(lastPointTurn90.dx, lastPointTurn90.dy)
      //   ..lineTo(endPoint.dx, endPoint.dy);
    }

    lastDrawedPath.addPath(path, Offset.zero);

    return lastDrawedPath;
  }
}
