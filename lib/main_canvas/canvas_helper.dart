import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_event.dart';
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
    case FlowTypes.rectangle:
      return context.read<AddRemoveElementBloc>().add(
            AddElementEvent(
              elementToManipulate:
                  (details.data as RectangleFlowElement).copyWith(
                offset: offset,
                elementKey: UniqueKey(),
              ),
            ),
          );
    case FlowTypes.roundedRectangle:
      return context.read<AddRemoveElementBloc>().add(
            AddElementEvent(
              elementToManipulate:
                  (details.data as RoundedRectangleFlowElement).copyWith(
                offset: offset,
                elementKey: UniqueKey(),
              ),
            ),
          );
    case FlowTypes.triangle:
      return context.read<AddRemoveElementBloc>().add(
            AddElementEvent(
              elementToManipulate:
                  (details.data as TriangleFlowElement).copyWith(
                offset: offset,
                elementKey: UniqueKey(),
              ),
            ),
          );
    case FlowTypes.circle:
      return context.read<AddRemoveElementBloc>().add(
            AddElementEvent(
              elementToManipulate: (details.data as CircleFlowElement).copyWith(
                offset: offset,
                elementKey: UniqueKey(),
              ),
            ),
          );
  }
}
