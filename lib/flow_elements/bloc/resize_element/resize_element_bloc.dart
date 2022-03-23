import 'package:bloc/bloc.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resize_element_bloc.freezed.dart';
part 'resize_element_event.dart';
part 'resize_element_state.dart';

class ResizeElementBloc extends Bloc<ResizeElementEvent, ResizeElementState> {
  ResizeElementBloc() : super(const _Initial()) {
    var mapScale = <Key, Offset>{};

    on<ResizeElementEvent>((event, emit) {
      event.maybeWhen(
        orElse: () => null,
        resize: (element, offset) {
          if (!mapScale.containsKey(element.elementKey)) {
            mapScale.addAll({
              element.elementKey!: offset,
            });
          } else {
            mapScale[element.elementKey!] =
                mapScale[element.elementKey!]! + offset;
          }

          var scale = mapScale[element.elementKey!]!;

          debugPrint(scale.toString());

          var _bounds = element.path.getBounds();
          var resizedPath = element.path.transform(Matrix4.diagonal3Values(
                  1 + scale.dx / _bounds.width,
                  1 + scale.dy / _bounds.height,
                  0)
              .storage);
          var dimensionPointModelMap =
              element.updateDimensionPoints(scale, resizedPath);
          var anchorPointsModelMap =
              element.updateAnchorPoints(element, scale, resizedPath);

          var resizedElement = element.copyWith(
            anchorPointsModelMap: anchorPointsModelMap,
            dimensionPointModelMap: dimensionPointModelMap,
            path: resizedPath,
          );

          emit(ResizeElementState.resized(element: resizedElement));
        },
        clearMap: (elementKey) {
          mapScale.remove(elementKey);
        },
      );
    });
  }
}
