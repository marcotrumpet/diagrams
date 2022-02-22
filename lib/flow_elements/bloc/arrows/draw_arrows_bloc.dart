import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/helpers/a_star_algorithm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawArrowsBloc extends Bloc<AbstractDrawArrowsEvent, DrawArrowsState> {
  var _startPoint = Offset.zero;
  // var mapStartPointArrowPath = <Offset, Path>{};
  // var _arrowModelList = <ArrowModel>[];
  // var _lastDrawedPoint = Offset.infinite;
  // var _lastPointTurn90 = Offset.infinite;
  // var _lastDrawedPath = Path();
  ArrowModel? arrowModel;
  // var _arrowKey = const Key('');
  // var _segmentJumped = false;

  DrawArrowsBloc(DrawArrowsState initialState) : super(initialState) {
    on<DrawArrowsEvent>(
      (event, emit) async {
        if (event.startPoint != null &&
            event.arrowKey != null &&
            event.startPointKey != null) {
          startNewArrow(event);
        }
        if (event.endPoint != null) {
          final newPoints = [_startPoint, event.endPoint!];
          // final newPoints = await calculatePoints(_startPoint, event.endPoint!);
          arrowModel = arrowModel?.copyWith(
              arrowPath: newPoints, endPoint: event.endPoint!);

          final newArrow = arrowModel;

          emit(
            DrawArrowsState(
              arrowModel: newArrow,
            ),
          );
        }
      },
    );

    on<DrawArrowsAStarEvent>(
      (event, emit) => emit(
        DrawArrowsState(
          updateAStarPath: true,
          arrowModel: arrowModel,
        ),
      ),
    );

    on<UpdateArrowsEvent>((event, emit) {
      // var arrowIndex = _arrowModelList.indexWhere((element) =>
      //     element.startElement?.elementKey == event.startElement?.elementKey);

      // if (arrowIndex != -1) {
      //   var _tmpArrow = _arrowModelList.elementAt(arrowIndex);
      //   _arrowModelList.removeAt(arrowIndex);
      //   var _newStartPoint = event
      //           .startElement?.anchorPointsModelMap?.anchorPointList
      //           .firstWhereOrNull((element) =>
      //               element.anchorPointKey == _tmpArrow.startPointKey)
      //           ?.anchorPointPositionRelativeToParent ??
      //       Offset.zero;
      //   var _updatedTmpArrow = _tmpArrow.copyWith(
      //     startPoint: _newStartPoint,
      //     // arrowPath: calculatePoints(
      //     //   _newStartPoint,
      //     //   _tmpArrow.endPoint,
      //     //   forceNewStartPoint: true,
      //     //   pathToUpdate: _tmpArrow.arrowPath,
      //     // ),
      //   );
      //   _arrowModelList.add(_updatedTmpArrow);

      //   final newArrowLists = <ArrowModel>[..._arrowModelList];

      //   emit(
      //     DrawArrowsState(
      //       arrowModelList: newArrowLists,
      //     ),
      //   );
      // }
    });
  }

  void startNewArrow(DrawArrowsEvent event) {
    arrowModel = ArrowModel(
      arrowPath: [],
      startPoint: event.startPoint!,
      endPoint: Offset.infinite,
      arrowKey: event.arrowKey!,
      startElement: event.startElement,
      startPointKey: event.startPointKey!,
    );
    // _arrowKey = event.arrowKey!;
    _startPoint = event.startPoint!;

    // _lastDrawedPath = Path();
    // _lastPointTurn90 = Offset.infinite;
    // _lastDrawedPoint = Offset.infinite;
    // _segmentJumped = false;
  }

  Future<Iterable<Offset>> calculatePoints(
    Offset startPoint,
    Offset endPoint, {
    bool forceNewStartPoint = false,
    Path? pathToUpdate,
  }) async {
    // var path = Path();

    // if (forceNewStartPoint && pathToUpdate != null) {
    //   path.moveTo(startPoint.dx, startPoint.dy);

    //   if (pathToUpdate.computeMetrics().isNotEmpty) {
    //     var startPointOfPathToUpdate = pathToUpdate
    //         .computeMetrics()
    //         .first
    //         .getTangentForOffset(0.0)
    //         ?.position;

    //     if (startPointOfPathToUpdate != null) {
    //       path.lineTo(startPointOfPathToUpdate.dx, startPointOfPathToUpdate.dy);
    //     }
    //   }

    //   pathToUpdate.computeMetrics().forEach((element) {
    //     path.addPath(
    //         element.extractPath(0, element.length, startWithMoveTo: true),
    //         Offset.zero);
    //   });

    //   path.lineTo(endPoint.dx, endPoint.dy);

    //   return path;
    // }

    // path
    //   ..moveTo(startPoint.dx, startPoint.dy)
    //   ..lineTo(endPoint.dx, endPoint.dy);

    // _lastDrawedPath.addPath(path, Offset.zero);

    // _lastDrawedPath.close();

    // final debounce = Debouncer(milliseconds: 300);
    var pathToFollow = <Offset>[];

    // await debounce.run(() {
    // });
    pathToFollow.addAll(AStarAlgorithm(
      start: startPoint,
      end: endPoint,
    ).findThePath());

    return pathToFollow;
  }
}
