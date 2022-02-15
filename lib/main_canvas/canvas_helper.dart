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

void handleFlowElements(DragTargetDetails<AbstractFlowElement> details,
    BuildContext context, Offset offset) {
  switch (details.data.flowType) {
    case FlowElementTypes.rectangle:
      final elementToManipulate =
          (details.data as RectangleFlowElement).copyWith(
        offset: offset,
        elementKey: details.data.elementKey ?? UniqueKey(),
        path: rectangleShapeBig,
        anchorPointsModelMap: details.data.anchorPointsModelMap == null
            ? details.data.setAnchorPoints(offset, rectangleShapeBig)
            : details.data
                .updateAnchorPoints(details.data, offset, rectangleShapeBig),
      );
      context.read<AddRemoveElementBloc>().add(
            AddElementEvent(
              elementToManipulate: elementToManipulate,
            ),
          );
      context.read<DrawArrowsBloc>().add(
            UpdateArrowsEvent(startElement: elementToManipulate),
          );
      break;
    case FlowElementTypes.roundedRectangle:
      context.read<AddRemoveElementBloc>().add(
            AddElementEvent(
              elementToManipulate:
                  (details.data as RoundedRectangleFlowElement).copyWith(
                offset: offset,
                elementKey: details.data.elementKey ?? UniqueKey(),
                path: roundedRectangleShapeBig,
                anchorPointsModelMap:
                    details.data.setAnchorPoints(offset, rectangleShapeBig),
              ),
            ),
          );
      break;
    case FlowElementTypes.triangle:
      context.read<AddRemoveElementBloc>().add(
            AddElementEvent(
              elementToManipulate:
                  (details.data as TriangleFlowElement).copyWith(
                offset: offset,
                elementKey: details.data.elementKey ?? UniqueKey(),
                path: triangleShapeBig,
                anchorPointsModelMap:
                    details.data.setAnchorPoints(offset, rectangleShapeBig),
              ),
            ),
          );
      break;
    case FlowElementTypes.circle:
      context.read<AddRemoveElementBloc>().add(
            AddElementEvent(
              elementToManipulate: (details.data as CircleFlowElement).copyWith(
                offset: offset,
                elementKey: details.data.elementKey ?? UniqueKey(),
                path: circleShapeBig,
                anchorPointsModelMap:
                    details.data.setAnchorPoints(offset, rectangleShapeBig),
              ),
            ),
          );
      break;
  }
}
