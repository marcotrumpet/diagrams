import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/basic_shapes.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/flow_elements/circle/circle_flow_element.dart';
import 'package:diagrams/flow_elements/rectangle/rectangle_flow_element.dart';
import 'package:diagrams/flow_elements/rounded_rectangle/rounded_rectangle_flow_element.dart';
import 'package:diagrams/flow_elements/triangle/triangle_flow_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

Offset calcNewOffset(
    DragTargetDetails<AbstractFlowElement> details, GlobalKey gridKey) {
  final parent = gridKey.currentContext?.findRenderObject() as RenderBox;
  Offset childRelativeToParent = parent.globalToLocal(details.offset);
  final newOffset = Offset(
    childRelativeToParent.dx.clamp(
        childRelativeToParent.dx - (childRelativeToParent.dx % 15),
        childRelativeToParent.dx - (childRelativeToParent.dx % 15)),
    childRelativeToParent.dx.clamp(
        childRelativeToParent.dy - (childRelativeToParent.dy % 15),
        childRelativeToParent.dy - (childRelativeToParent.dy % 15)),
  );
  return newOffset;
}

/// Check if flow element is already in list checking his element key
bool isElementInList({
  required BuildContext context,
  required AbstractFlowElement element,
}) {
  var founded = context
          .read<AddRemoveElementBloc>()
          .elementsList
          .firstWhereOrNull((e) => e.elementKey == element.elementKey) !=
      null;
  return founded;
}

/// [drawNewElement] set to 'false' mean that the flow element moved so no need
/// to draw another one
void handleFlowElements({
  required AbstractFlowElement element,
  required BuildContext context,
  required Offset offset,
  bool drawNewElement = true,
}) {
  AbstractFlowElement elementToManipulate;
  switch (element.flowType) {
    case FlowElementTypes.rectangle:
      elementToManipulate = (element as RectangleFlowElement).copyWith(
        offset: offset,
        elementKey: element.elementKey ?? UniqueKey(),
        path: element.path != rectangleShape ? element.path : rectangleShapeBig,
        anchorPointsModelMap: element.anchorPointsModelMap == null
            ? element.setAnchorPoints(offset, rectangleShapeBig)
            : element.updateAnchorPoints(element, offset, element.path),
        dimensionPointModelMap: drawNewElement
            ? null
            : element.updateDimensionPoints(offset, element.path),
      );
      break;
    case FlowElementTypes.roundedRectangle:
      elementToManipulate = (element as RoundedRectangleFlowElement).copyWith(
        offset: offset,
        elementKey: element.elementKey ?? UniqueKey(),
        path: element.path != roundedRectangleShape
            ? element.path
            : roundedRectangleShapeBig,
        anchorPointsModelMap: element.anchorPointsModelMap == null
            ? element.setAnchorPoints(offset, roundedRectangleShapeBig)
            : element.updateAnchorPoints(element, offset, element.path),
        dimensionPointModelMap: drawNewElement
            ? null
            : element.updateDimensionPoints(offset, element.path),
      );
      break;
    case FlowElementTypes.triangle:
      elementToManipulate = (element as TriangleFlowElement).copyWith(
        offset: offset,
        elementKey: element.elementKey ?? UniqueKey(),
        path: element.path != triangleShape ? element.path : triangleShapeBig,
        anchorPointsModelMap: element.anchorPointsModelMap == null
            ? element.setAnchorPoints(offset, triangleShapeBig)
            : element.updateAnchorPoints(element, offset, element.path),
        dimensionPointModelMap: drawNewElement
            ? null
            : element.updateDimensionPoints(offset, element.path),
      );
      break;
    case FlowElementTypes.circle:
      elementToManipulate = (element as CircleFlowElement).copyWith(
        offset: offset,
        elementKey: element.elementKey ?? UniqueKey(),
        path: element.path != circleShape ? element.path : circleShapeBig,
        anchorPointsModelMap: element.anchorPointsModelMap == null
            ? element.setAnchorPoints(offset, circleShapeBig)
            : element.updateAnchorPoints(element, offset, element.path),
        dimensionPointModelMap: drawNewElement
            ? null
            : element.updateDimensionPoints(offset, element.path),
      );
      break;
  }
  if (drawNewElement) {
    context.read<AddRemoveElementBloc>().add(
          AddElementEvent(elementToManipulate: elementToManipulate),
        );
  } else {
    context.read<AddRemoveElementBloc>().add(
          MoveElementEvent(elementToManipulate: elementToManipulate),
        );
  }
  context.read<DrawArrowsBloc>().add(
        MovedFlowElementUpdateArrowsEvent(element: elementToManipulate),
      );
}
