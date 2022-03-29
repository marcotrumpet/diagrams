import 'package:bloc/bloc.dart';
import 'package:diagrams/common/app_extensions.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resize_element_bloc.freezed.dart';
part 'resize_element_event.dart';
part 'resize_element_state.dart';

class ResizeElementBloc extends Bloc<ResizeElementEvent, ResizeElementState> {
  final AddRemoveElementBloc addRemoveElementBloc;
  var mapScale = <Key, Offset>{};
  var mapElementOffset = <Key, Offset>{};
  ResizeElementBloc({required this.addRemoveElementBloc})
      : super(const _Initial()) {
    void _clearMap(Key elementKey) {
      mapScale.remove(elementKey);
      mapElementOffset.remove(elementKey);
    }

    on<ResizeElementEvent>((event, emit) {
      event.maybeWhen(
        orElse: () => null,
        resizing: (abstractElementKey, offset, alignment) {
          var _offset = offset;
          var _elementOffset = Offset.zero;

          var abstractElement = addRemoveElementBloc.elementsList.firstWhere(
              (element) => element.elementKey == abstractElementKey);

          var _bounds = abstractElement.path.getBounds();

          if (alignment == Alignment.bottomCenter) {
            _offset = Offset(0, _offset.dy);
          } else if (alignment == Alignment.centerRight) {
            _offset = Offset(_offset.dx, 0);
          } else if (alignment == Alignment.centerLeft) {
            _offset = Offset(-_offset.dx, 0);
            _elementOffset = Offset(-_offset.dx, 0);
          } else if (alignment == Alignment.topCenter) {
            _offset = Offset(0, -_offset.dy);
            _elementOffset = Offset(0, -_offset.dy);
          } else if (alignment == Alignment.topLeft) {
            _offset = Offset(-_offset.dx, -_offset.dy);
            _elementOffset = Offset(-_offset.dx, -_offset.dy);
          } else if (alignment == Alignment.topRight) {
            _offset = Offset(_offset.dx, -_offset.dy);
            _elementOffset = Offset(0, -_offset.dy);
          } else if (alignment == Alignment.bottomLeft) {
            _offset = Offset(-_offset.dx, _offset.dy);
            _elementOffset = Offset(-_offset.dx, 0);
          }

          if (!mapScale.containsKey(abstractElement.elementKey)) {
            mapScale.addAll({
              abstractElement.elementKey!: Offset(
                  _offset.dx + _bounds.width, _offset.dy + _bounds.height),
            });
          } else {
            mapScale[abstractElement.elementKey!] =
                mapScale[abstractElement.elementKey]! + _offset;
          }

          if (!mapElementOffset.containsKey(abstractElement.elementKey)) {
            mapElementOffset.addAll({
              abstractElement.elementKey!:
                  _elementOffset + abstractElement.offset!,
            });
          } else {
            mapElementOffset[abstractElement.elementKey!] =
                mapElementOffset[abstractElement.elementKey]! + _elementOffset;
          }

          var scale = (mapScale[abstractElement.elementKey]!)
              .normalizedPointToClosestGrid();
          var elementOffset = mapElementOffset[abstractElement.elementKey]!
              .normalizedPointToClosestGrid();

          double scaleX = (scale.dx / _bounds.width);

          double scaleY = (scale.dy / _bounds.height);

          if (scaleX.isNaN ||
              scaleY.isNaN ||
              scaleX.isInfinite ||
              scaleY.isInfinite ||
              scaleX == 0 ||
              scaleY == 0) return;

          var resizedPath = abstractElement.path.transform(
            Matrix4.diagonal3Values(
              scaleX,
              scaleY,
              0,
            ).storage,
          );

          var anchorPointsModelMap = abstractElement.updateAnchorPoints(
            abstractElement,
            abstractElement.offset! + elementOffset,
            resizedPath,
          );
          var dimensionPointModelMap = abstractElement.updateDimensionPoints(
            abstractElement.offset! + elementOffset,
            resizedPath,
          );

          var resizedElement = abstractElement.copyWith(
            anchorPointsModelMap: anchorPointsModelMap,
            dimensionPointModelMap: dimensionPointModelMap,
            path: resizedPath,
            offset: elementOffset,
          );

          emit(ResizeElementState.resizing(element: resizedElement));
        },
        resizeEnd: (elementKey) {
          var savedElement = addRemoveElementBloc.elementsList
              .firstWhere((e) => e.elementKey == elementKey);

          _clearMap(savedElement.elementKey!);

          emit(ResizeElementState.resizeEnd(element: savedElement));
        },
        clearMap: _clearMap,
      );
    });
  }
}
