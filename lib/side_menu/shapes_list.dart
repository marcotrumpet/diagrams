import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/basic_shapes.dart';
import 'package:diagrams/flow_elements/circle/circle_flow_element.dart';
import 'package:diagrams/flow_elements/rectangle/rectangle_flow_element.dart';
import 'package:diagrams/flow_elements/rounded_rectangle/rounded_rectangle_flow_element.dart';
import 'package:diagrams/flow_elements/triangle/triangle_flow_element.dart';
import 'package:flutter/material.dart';

final rectangle = RectangleFlowElement(
  flowType: FlowElementTypes.rectangle,
  path: rectangleShape,
);

final roundedRectangle = RoundedRectangleFlowElement(
  flowType: FlowElementTypes.roundedRectangle,
  path: roundedRectangleShape,
);

final triangle = TriangleFlowElement(
  flowType: FlowElementTypes.triangle,
  path: triangleShape,
);
final circle = CircleFlowElement(
  flowType: FlowElementTypes.circle,
  path: circleShape,
);

List<Draggable<AbstractFlowElement>> basicShapesList(BuildContext context) {
  return [
    Draggable<RectangleFlowElement>(
      hitTestBehavior: HitTestBehavior.opaque,
      data: rectangle,
      child: rectangle.buildChild(context, true),
      feedback: rectangle.buildChild(context, true),
    ),
    Draggable<RoundedRectangleFlowElement>(
      hitTestBehavior: HitTestBehavior.opaque,
      data: roundedRectangle,
      child: roundedRectangle.buildChild(context, true),
      feedback: roundedRectangle.buildChild(context, true),
    ),
    Draggable<TriangleFlowElement>(
      hitTestBehavior: HitTestBehavior.opaque,
      data: triangle,
      child: triangle.buildChild(context, true),
      feedback: triangle.buildChild(context, true),
    ),
    Draggable<CircleFlowElement>(
      hitTestBehavior: HitTestBehavior.opaque,
      data: circle,
      child: circle.buildChild(context, true),
      feedback: circle.buildChild(context, true),
    ),
  ];
}
