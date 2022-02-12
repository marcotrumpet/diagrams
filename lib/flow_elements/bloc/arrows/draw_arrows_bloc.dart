import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawArrowsBloc extends Bloc<DrawArrowsEvent, DrawArrowsState> {
  DrawArrowsBloc(DrawArrowsState initialState) : super(initialState) {
    var startPoint = Offset.zero;
    var arrowPaths = <Offset, Path>{};

    on<DrawArrowsEvent>(
      (event, emit) {
        if (event.startPoint != null &&
            !arrowPaths.containsKey(event.startPoint)) {
          startPoint = event.startPoint!;
          arrowPaths.addAll({startPoint: Path()});
        }
        if (event.endPoint != null) {
          final newPath = Path()
            ..moveTo(startPoint.dx, startPoint.dy)
            ..lineTo(event.endPoint!.dx, event.endPoint!.dy)
            ..close();
          arrowPaths.update(startPoint, (value) => newPath);
          final newPathsLists = <Path>[...arrowPaths.values.toList()];
          emit(
            DrawArrowsState(
              arrowPaths: newPathsLists,
            ),
          );
        }
      },
    );
  }
}
