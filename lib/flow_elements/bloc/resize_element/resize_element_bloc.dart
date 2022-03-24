import 'package:bloc/bloc.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resize_element_bloc.freezed.dart';
part 'resize_element_event.dart';
part 'resize_element_state.dart';

class ResizeElementBloc extends Bloc<ResizeElementEvent, ResizeElementState> {
  final DrawArrowsBloc drawArrowsBloc;
  final AddRemoveElementBloc addRemoveElementBloc;
  ResizeElementBloc({
    required this.drawArrowsBloc,
    required this.addRemoveElementBloc,
  }) : super(const _Initial()) {
    var mapScale = <Key, Offset>{};
    var mapElementOffset = <Key, Offset>{};

    on<ResizeElementEvent>((event, emit) {
      event.maybeWhen(
        orElse: () => null,
        resize: (element, offset, alignment) {
          var _offset = offset;
          var _elementOffset = Offset.zero;

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

          if (!mapScale.containsKey(element.elementKey)) {
            mapScale.addAll({
              element.elementKey!: _offset,
            });
          } else {
            mapScale[element.elementKey!] =
                mapScale[element.elementKey!]! + _offset;
          }

          if (!mapElementOffset.containsKey(element.elementKey)) {
            mapElementOffset.addAll({
              element.elementKey!: _elementOffset,
            });
          } else {
            mapElementOffset[element.elementKey!] =
                mapElementOffset[element.elementKey!]! + _elementOffset;
          }

          var scale = mapScale[element.elementKey!]!;
          var elementOffset = mapElementOffset[element.elementKey!]!;

          var _bounds = element.path.getBounds();
          var resizedPath = element.path.transform(
            Matrix4.diagonal3Values(
              1 + scale.dx / _bounds.width,
              1 + scale.dy / _bounds.height,
              0,
            ).storage,
          );
          var dimensionPointModelMap =
              element.updateDimensionPoints(scale, resizedPath);
          var anchorPointsModelMap =
              element.updateAnchorPoints(element, scale, resizedPath);

          var resizedElement = element.copyWith(
            anchorPointsModelMap: anchorPointsModelMap,
            dimensionPointModelMap: dimensionPointModelMap,
            path: resizedPath,
            offset: (element.offset ?? Offset.zero) + elementOffset,
          );

          // addRemoveElementBloc.add(
          //   MoveElementEvent(elementToManipulate: resizedElement),
          // );

          // drawArrowsBloc.add(
          //   MovedFlowElementUpdateArrowsEvent(element: resizedElement),
          // );

          emit(ResizeElementState.resized(element: resizedElement));
        },
        clearMap: (elementKey) {
          mapScale.remove(elementKey);
        },
      );
    });
  }
}
