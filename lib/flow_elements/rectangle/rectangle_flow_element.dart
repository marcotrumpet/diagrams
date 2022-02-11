import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/rectangle/rectangle_custom_painter.dart';
import 'package:flutter/material.dart';

class RectangleFlowElement extends AbstractFlowElement {
  RectangleFlowElement({
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
  Widget concreteBuild(BuildContext context) {
    return Draggable<RectangleFlowElement>(
      data: this,
      child: buildSideMenu(context),
      feedback: buildSideMenu(context),
    );
  }

  @override
  Widget buildSideMenu(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        foregroundPainter: RectangleCustomPainter(path: path, context: context),
        child: Container(
          color: Colors.transparent,
          width: 180,
          height: 90,
        ),
      ),
    );
  }

  @override
  AbstractFlowElement copyWith(
      {FlowTypes? flowType, Offset? offset, Key? elementKey, Path? path}) {
    return RectangleFlowElement(
      flowType: flowType ?? this.flowType,
      elementKey: elementKey ?? this.elementKey,
      offset: offset ?? this.offset,
      path: path ?? this.path,
    );
  }
}
