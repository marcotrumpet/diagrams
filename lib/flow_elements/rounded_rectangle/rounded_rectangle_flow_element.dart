import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/rounded_rectangle/rounded_rectangle_custom_painter.dart';
import 'package:flutter/material.dart';

class RoundedRectangleFlowElement extends AbstractFlowElement {
  RoundedRectangleFlowElement({
    required FlowTypes flowType,
    Offset? offset,
    Key? elementKey,
  }) : super(flowType: flowType, elementKey: elementKey, offset: offset);

  @override
  Widget concreteBuild(BuildContext context) {
    return Draggable<RoundedRectangleFlowElement>(
      data: this,
      child: buildSideMenu(context),
      feedback: buildSideMenu(context),
    );
  }

  @override
  Widget buildSideMenu(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        size: const Size(180, 90),
        painter: RoundedRectangleCustomPainter(
            Theme.of(context).toggleableActiveColor),
      ),
    );
  }

  @override
  AbstractFlowElement copyWith(
      {FlowTypes? flowType, Offset? offset, Key? elementKey}) {
    return RoundedRectangleFlowElement(
      flowType: flowType ?? this.flowType,
      elementKey: elementKey ?? this.elementKey,
      offset: offset ?? this.offset,
    );
  }
}
