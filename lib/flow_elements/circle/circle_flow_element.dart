import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/circle/circle_custom_painter.dart';
import 'package:flutter/material.dart';

class CircleFlowElement extends AbstractFlowElement {
  CircleFlowElement({
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
    return Draggable<CircleFlowElement>(
      data: this,
      child: buildChild(context, false),
      feedback: buildChild(context, false),
    );
  }

  @override
  Widget buildChild(BuildContext context, bool small) {
    return RepaintBoundary(
      child: CustomPaint(
        foregroundPainter: CircleCustomPainter(path: path, context: context),
        child: Container(
          color: Colors.transparent,
          width: small ? 40 : 90,
          height: small ? 40 : 90,
        ),
      ),
    );
  }

  @override
  AbstractFlowElement copyWith(
      {FlowTypes? flowType, Offset? offset, Key? elementKey, Path? path}) {
    return CircleFlowElement(
      flowType: flowType ?? this.flowType,
      elementKey: elementKey ?? this.elementKey,
      offset: offset ?? this.offset,
      path: path ?? this.path,
    );
  }
}
