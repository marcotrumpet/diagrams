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
  required DragTargetDetails<AbstractFlowElement> details,
  required BuildContext context,
  required Offset offset,
  bool drawNewElement = true,
}) {
  AbstractFlowElement elementToManipulate;
  switch (details.data.flowType) {
    case FlowElementTypes.rectangle:
      elementToManipulate = (details.data as RectangleFlowElement).copyWith(
        offset: offset,
        elementKey: details.data.elementKey ?? UniqueKey(),
        path: details.data.path != rectangleShape
            ? details.data.path
            : rectangleShapeBig,
        anchorPointsModelMap: details.data.anchorPointsModelMap == null
            ? details.data.setAnchorPoints(offset, rectangleShapeBig)
            : details.data
                .updateAnchorPoints(details.data, offset, details.data.path),
      );
      break;
    case FlowElementTypes.roundedRectangle:
      elementToManipulate =
          (details.data as RoundedRectangleFlowElement).copyWith(
        offset: offset,
        elementKey: details.data.elementKey ?? UniqueKey(),
        path: roundedRectangleShapeBig,
        anchorPointsModelMap: details.data.anchorPointsModelMap == null
            ? details.data.setAnchorPoints(offset, roundedRectangleShapeBig)
            : details.data
                .updateAnchorPoints(details.data, offset, details.data.path),
      );
      break;
    case FlowElementTypes.triangle:
      elementToManipulate = (details.data as TriangleFlowElement).copyWith(
        offset: offset,
        elementKey: details.data.elementKey ?? UniqueKey(),
        path: triangleShapeBig,
        anchorPointsModelMap: details.data.anchorPointsModelMap == null
            ? details.data.setAnchorPoints(offset, triangleShapeBig)
            : details.data
                .updateAnchorPoints(details.data, offset, details.data.path),
      );
      break;
    case FlowElementTypes.circle:
      elementToManipulate = (details.data as CircleFlowElement).copyWith(
        offset: offset,
        elementKey: details.data.elementKey ?? UniqueKey(),
        path: circleShapeBig,
        anchorPointsModelMap: details.data.anchorPointsModelMap == null
            ? details.data.setAnchorPoints(offset, circleShapeBig)
            : details.data
                .updateAnchorPoints(details.data, offset, details.data.path),
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
