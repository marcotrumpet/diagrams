import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DrawArrowsBloc extends Bloc<AbstractDrawArrowsEvent, DrawArrowsState> {
  // ignore: unused_field
  var _startPoint = Offset.zero;
  var _arrowModelList = <ArrowModel>[];
  var _arrowKey = const Key('');

  DrawArrowsBloc(DrawArrowsState initialState) : super(initialState) {
    on<DrawArrowsEvent>(
      (event, emit) async {
        if (event.startPoint != null &&
            event.arrowKey != null &&
            event.startPointKey != null) {
          startNewArrow(event);
        }
        if (event.endPoint != null) {
          var endpointOfExistingArrow = _arrowModelList.firstWhereOrNull(
              (element) => element.endPoint == event.endPoint);

          if (endpointOfExistingArrow != null) {
            _arrowModelList = _arrowModelList.map((e) {
              if (e.arrowKey == endpointOfExistingArrow.arrowKey) {
                e.copyWith(endPoint: event.endPoint!);
              }
              return e;
            }).toList();
          } else {
            _arrowModelList = _arrowModelList.map((e) {
              if (e.arrowKey == (event.arrowKey ?? _arrowKey)) {
                return e.copyWith(endPoint: event.endPoint!);
              }
              return e;
            }).toList();
          }

          final newArrowLists = <ArrowModel>[..._arrowModelList];

          emit(
            DrawArrowsState(
              arrowModelList: newArrowLists,
            ),
          );
        }
      },
    );

    on<DrawArrowsAStarEvent>(
      (event, emit) => emit(
        DrawArrowsState(
          updateAStarPath: true,
          arrowModelList: _arrowModelList,
        ),
      ),
    );

    on<MovedFlowElementUpdateArrowsEvent>((event, emit) {
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
          // arrowPath: calculatePoints(
          //     //   _newStartPoint,
          //     //   _tmpArrow.endPoint,
          //     //   forceNewStartPoint: true,
          //     //   pathToUpdate: _tmpArrow.arrowPath,
          //     // ),
        );
        _arrowModelList.add(_updatedTmpArrow);

        final newArrowLists = <ArrowModel>[..._arrowModelList];

        emit(
          DrawArrowsState(
            arrowModelList: newArrowLists,
            updateAStarPath: true,
          ),
        );
      }
    });
  }

  List<ArrowModel> get arrowModelList => _arrowModelList;

  void startNewArrow(DrawArrowsEvent event) {
    _arrowModelList.add(
      ArrowModel(
          startPoint: event.startPoint!,
          endPoint: Offset.infinite,
          arrowKey: event.arrowKey!,
          startElement: event.startElement,
          startPointKey: event.startPointKey!),
    );
    _arrowKey = event.arrowKey!;
    _startPoint = event.startPoint!;
  }
}
