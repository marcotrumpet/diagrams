import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:diagrams/flow_elements/triangle/triangle_custom_painter.dart';
import 'package:flutter/material.dart';

class TriangleFlowElement extends AbstractFlowElement {
  TriangleFlowElement({
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
  Widget buildChild(BuildContext context, bool small) {
    return RepaintBoundary(
      child: CustomPaint(
        foregroundPainter: TriangleCustomPainter(path: path, context: context),
        child: Container(
          color: Colors.transparent,
          width: small ? 40 : 90,
          height: small ? 40 : 90,
        ),
      ),
    );
  }

  @override
  Widget concreteBuild(BuildContext context) {
    return Draggable<TriangleFlowElement>(
      data: this,
      child: buildChild(context, false),
      feedback: buildChild(context, false),
      childWhenDragging: const SizedBox.shrink(),
    );
  }

  @override
  TriangleFlowElement copyWith({
    FlowElementTypes? flowType,
    Offset? offset,
    Key? elementKey,
    Path? path,
    AnchorPointModelMap? anchorPointsModelMap,
  }) {
    return TriangleFlowElement(
      flowType: flowType ?? this.flowType,
      elementKey: elementKey ?? this.elementKey,
      offset: offset ?? this.offset,
      path: path ?? this.path,
      anchorPointsModelMap: anchorPointsModelMap ?? this.anchorPointsModelMap,
    );
  }
}
