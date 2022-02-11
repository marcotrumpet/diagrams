import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/basic_shapes.dart';
import 'package:diagrams/flow_elements/circle/circle_flow_element.dart';
import 'package:diagrams/flow_elements/rectangle/rectangle_flow_element.dart';
import 'package:diagrams/flow_elements/rounded_rectangle/rounded_rectangle_flow_element.dart';
import 'package:diagrams/flow_elements/triangle/triangle_flow_element.dart';
import 'package:flutter/material.dart';

final rectangle = RectangleFlowElement(
  flowType: FlowTypes.rectangle,
  elementKey: UniqueKey(),
  path: rectangleShape,
);

final roundedRectangle = RoundedRectangleFlowElement(
  flowType: FlowTypes.roundedRectangle,
  elementKey: UniqueKey(),
  path: roundedRectangleShape,
);

final triangle = TriangleFlowElement(
  flowType: FlowTypes.triangle,
  elementKey: UniqueKey(),
  path: triangleShape,
);
final circle = CircleFlowElement(
  flowType: FlowTypes.circle,
  elementKey: UniqueKey(),
  path: circleShape,
);

List<Draggable<AbstractFlowElement>> basicShapesList(BuildContext context) {
  return [
    Draggable<RectangleFlowElement>(
      hitTestBehavior: HitTestBehavior.opaque,
      data: rectangle,
      child: rectangle.buildSideMenu(context),
      feedback: rectangle.buildSideMenu(context),
    ),
    Draggable<RoundedRectangleFlowElement>(
      hitTestBehavior: HitTestBehavior.opaque,
      data: roundedRectangle,
      child: roundedRectangle.buildSideMenu(context),
      feedback: roundedRectangle.buildSideMenu(context),
    ),
    Draggable<TriangleFlowElement>(
      hitTestBehavior: HitTestBehavior.opaque,
      data: triangle,
      child: triangle.buildSideMenu(context),
      feedback: triangle.buildSideMenu(context),
    ),
    Draggable<CircleFlowElement>(
      hitTestBehavior: HitTestBehavior.opaque,
      data: circle,
      child: circle.buildSideMenu(context),
      feedback: circle.buildSideMenu(context),
    ),
  ];
}
