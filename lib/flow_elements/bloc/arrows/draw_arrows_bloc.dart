import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawArrowsBloc extends Bloc<AbstractDrawArrowsEvent, DrawArrowsState> {
  // ignore: unused_field
  var _startPoint = Offset.zero;
  var _arrowModelList = <ArrowModel>[];
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
          }).toList();
        }
      },
    );

    on<DrawArrowsAStarEvent>(
      (event, emit) {
        // TODO double check this. Not sure why need this to provide a clean A* path
        // GetIt.I<GridPropertyProvider>().createGrid();
        // GetIt.I<GridPropertyProvider>().addNeighbors();
        //

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
      }).toList();
    });

    ArrowModel? findStartArrow(ArrowModel arrow, AnchorPointModel anchorPoint) {
      var arrowIndex = _arrowModelList.indexWhere(
        (element) =>
            element.startElement?.elementKey == arrow.startElement?.elementKey,
      );

      if (arrowIndex != -1) {
        var _tmpArrow = _arrowModelList.elementAt(arrowIndex);

        var _newStartPoint = anchorPoint.anchorPointPositionRelativeToParent;

        var _updatedTmpArrow = _tmpArrow.copyWith(
          startPoint: _newStartPoint,
          updateAStarPath: true,
        );

        _arrowModelList.removeAt(arrowIndex);
        _arrowModelList.add(_updatedTmpArrow);

        return _updatedTmpArrow;
      }

      return null;
    }

    ArrowModel? findEndArrow(ArrowModel arrow, AnchorPointModel anchorPoint) {
      var arrowIndex = _arrowModelList.indexWhere(
        (element) =>
            element.endElement?.elementKey == arrow.endElement?.elementKey,
      );

      if (arrowIndex != -1) {
        var _tmpArrow = _arrowModelList.elementAt(arrowIndex);

        var _newEndPoint = anchorPoint.anchorPointPositionRelativeToParent;

        var _updatedTmpArrow = _tmpArrow.copyWith(
          endPoint: _newEndPoint,
          updateAStarPath: true,
        );

        _arrowModelList.removeAt(arrowIndex);
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
    });
  }

  List<ArrowModel> get arrowModelList => _arrowModelList;

  Key get lastArrowDrawnKey => _arrowKey;
}
