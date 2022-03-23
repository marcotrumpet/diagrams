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
  isSideMenu: true,
);

final roundedRectangle = RoundedRectangleFlowElement(
  flowType: FlowElementTypes.roundedRectangle,
  path: roundedRectangleShape,
  isSideMenu: true,
);

final triangle = TriangleFlowElement(
  flowType: FlowElementTypes.triangle,
  path: triangleShape,
  isSideMenu: true,
);
final circle = CircleFlowElement(
  flowType: FlowElementTypes.circle,
  path: circleShape,
  isSideMenu: true,
);

List<Draggable<AbstractFlowElement>> basicShapesList(BuildContext context) {
  return [
    Draggable<RectangleFlowElement>(
      hitTestBehavior: HitTestBehavior.opaque,
      data: rectangle,
      child: rectangle.buildChild(context),
      feedback: rectangle.buildChild(context),
    ),
    Draggable<RoundedRectangleFlowElement>(
      hitTestBehavior: HitTestBehavior.opaque,
      data: roundedRectangle,
      child: roundedRectangle.buildChild(context),
      feedback: roundedRectangle.buildChild(context),
    ),
    Draggable<TriangleFlowElement>(
      hitTestBehavior: HitTestBehavior.opaque,
      data: triangle,
      child: triangle.buildChild(context),
      feedback: triangle.buildChild(context),
    ),
    Draggable<CircleFlowElement>(
      hitTestBehavior: HitTestBehavior.opaque,
      data: circle,
      child: circle.buildChild(context),
      feedback: circle.buildChild(context),
    ),
  ];
}
