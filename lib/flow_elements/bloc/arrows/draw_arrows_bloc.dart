import 'dart:math';

import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawArrowsBloc extends Bloc<DrawArrowsEvent, DrawArrowsState> {
  var startPoint = Offset.zero;
  var mapStartPointArrowPath = <Offset, Path>{};
  var lastDrawedPoint = Offset.infinite;
  var lastPointTurn90 = Offset.infinite;
  var lastDrawedPath = Path();

  DrawArrowsBloc(DrawArrowsState initialState) : super(initialState) {
    on<DrawArrowsEvent>(
      (event, emit) {
        if (event.startPoint != null &&
            !mapStartPointArrowPath.containsKey(event.startPoint)) {
          startPoint = event.startPoint!;
          startNewArrow();
        }
        if (event.endPoint != null &&
            mapStartPointArrowPath.containsKey(startPoint)) {
          final newPath = calculatePath(event.endPoint!);

          mapStartPointArrowPath.update(startPoint, (value) => newPath);
          final newPathsLists = <Path>[
            ...mapStartPointArrowPath.values.toList()
          ];

          emit(
            DrawArrowsState(
              arrowPaths: newPathsLists,
            ),
          );
        }
      },
    );
  }

  void startNewArrow() {
    mapStartPointArrowPath.addAll({startPoint: Path()});

    lastDrawedPath = Path();
    lastPointTurn90 = Offset.infinite;
    lastDrawedPoint = Offset.infinite;
  }

  Path calculatePath(Offset endPoint) {
    var path = Path();

    lastPointTurn90 =
        lastPointTurn90 == Offset.infinite ? startPoint : lastPointTurn90;

    var direction = (endPoint - lastPointTurn90).direction;

    if (direction == 0 ||
        direction == pi / 2 ||
        direction == -pi / 2 ||
        direction == pi) {
      lastDrawedPoint = endPoint;
      path
        ..moveTo(lastPointTurn90.dx, lastPointTurn90.dy)
        ..lineTo(endPoint.dx, endPoint.dy);
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
