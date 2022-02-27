import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:diagrams/flow_elements/rounded_rectangle/rounded_rectangle_custom_painter.dart';
import 'package:flutter/material.dart';

class RoundedRectangleFlowElement extends AbstractFlowElement {
  RoundedRectangleFlowElement({
    required FlowElementTypes flowType,
    required Path path,
    Offset? offset,
    Key? elementKey,
    AnchorPointModelMap? anchorPointsModelMap,
  }) : super(
          flowType: flowType,
          elementKey: elementKey,
          offset: offset,
          path: path,
          anchorPointsModelMap: anchorPointsModelMap,
        );

  @override
  Widget concreteBuild(BuildContext context) {
    return Draggable<RoundedRectangleFlowElement>(
      data: this,
      child: buildChild(context, false),
      feedback: buildChild(context, false),
      childWhenDragging: const SizedBox.shrink(),
      // onDragEnd: (details) {
      // TODO check if we can update A* path here
      // },
    );
  }

  @override
  Widget buildChild(BuildContext context, bool small) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: RoundedRectangleCustomPainter(path: path, context: context),
        child: Container(
          color: Colors.transparent,
          width: small ? 40 : 180,
          height: small ? 20 : 90,
        ),
      ),
    );
  }

  @override
  RoundedRectangleFlowElement copyWith({
    FlowElementTypes? flowType,
    Offset? offset,
    Key? elementKey,
    Path? path,
    AnchorPointModelMap? anchorPointsModelMap,
  }) {
    return RoundedRectangleFlowElement(
      flowType: flowType ?? this.flowType,
      elementKey: elementKey ?? this.elementKey,
      offset: offset ?? this.offset,
      path: path ?? this.path,
      anchorPointsModelMap: anchorPointsModelMap ?? this.anchorPointsModelMap,
    );
  }
}
