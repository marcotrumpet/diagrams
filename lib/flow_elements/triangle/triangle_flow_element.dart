import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/triangle/triangle_custom_painter.dart';
import 'package:flutter/material.dart';

class TriangleFlowElement extends AbstractFlowElement {
  TriangleFlowElement({
    required FlowTypes flowType,
    required Path path,
    Offset? offset,
    Key? elementKey,
  }) : super(
            flowType: flowType,
            elementKey: elementKey,
            offset: offset,
            path: path);

  @override
  Widget buildSideMenu(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        foregroundPainter: TriangleCustomPainter(path: path, context: context),
        child: Container(
          color: Colors.transparent,
          width: 90,
          height: 90,
        ),
      ),
    );
  }

  @override
  Widget concreteBuild(BuildContext context) {
    return Draggable<TriangleFlowElement>(
      data: this,
      child: buildSideMenu(context),
      feedback: buildSideMenu(context),
    );
  }

  @override
  AbstractFlowElement copyWith(
      {FlowTypes? flowType, Offset? offset, Key? elementKey, Path? path}) {
    return TriangleFlowElement(
      flowType: flowType ?? this.flowType,
      elementKey: elementKey ?? this.elementKey,
      offset: offset ?? this.offset,
      path: path ?? this.path,
    );
  }
}
