import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:diagrams/flow_elements/dimension_points/dimension_point_model.dart';
import 'package:diagrams/flow_elements/triangle/triangle_custom_painter.dart';
import 'package:flutter/material.dart';

class TriangleFlowElement extends AbstractFlowElement {
  TriangleFlowElement({
    required FlowElementTypes flowType,
    required Path path,
    Offset? offset,
    Key? elementKey,
    AnchorPointModelMap? anchorPointsModelMap,
    DimensionPointModelMap? dimensionPointModelMap,
    isSideMenu = false,
  }) : super(
          flowType: flowType,
          elementKey: elementKey,
          offset: offset,
          path: path,
          anchorPointsModelMap: anchorPointsModelMap,
          dimensionPointModelMap: dimensionPointModelMap,
          isSideMenu: isSideMenu,
        );

  @override
  Widget buildChild(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        foregroundPainter: TriangleCustomPainter(path: path, context: context),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }

  @override
  Widget concreteBuild(BuildContext context) {
    return Draggable<TriangleFlowElement>(
      data: this,
      child: buildChild(context),
      feedback: buildChild(context),
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
    DimensionPointModelMap? dimensionPointModelMap,
  }) {
    return TriangleFlowElement(
      flowType: flowType ?? this.flowType,
      elementKey: elementKey ?? this.elementKey,
      offset: offset ?? this.offset,
      path: path ?? this.path,
      anchorPointsModelMap: anchorPointsModelMap ?? this.anchorPointsModelMap,
      dimensionPointModelMap:
          dimensionPointModelMap ?? this.dimensionPointModelMap,
    );
  }
}
