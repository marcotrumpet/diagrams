import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/rounded_rectangle/rounded_rectangle_custom_painter.dart';
import 'package:flutter/material.dart';

class RoundedRectangleFlowElement extends AbstractFlowElement {
  RoundedRectangleFlowElement({
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
    return Draggable<RoundedRectangleFlowElement>(
      data: this,
      child: buildChild(context, false),
      feedback: buildChild(context, false),
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
  AbstractFlowElement copyWith(
      {FlowTypes? flowType, Offset? offset, Key? elementKey, Path? path}) {
    return RoundedRectangleFlowElement(
      flowType: flowType ?? this.flowType,
      elementKey: elementKey ?? this.elementKey,
      offset: offset ?? this.offset,
      path: path ?? this.path,
    );
  }
}
