import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawArrowsBloc extends Bloc<DrawArrowsEvent, DrawArrowsState> {
  DrawArrowsBloc(DrawArrowsState initialState) : super(initialState) {
    var points = <Offset>[];

    on<DrawArrowsEvent>(
      (event, emit) {
        points.add(event.point);
        final List<Offset> newList = [];
        newList.addAll(points);
        emit(DrawArrowsState(points: newList));
      },
    );
  }
}
