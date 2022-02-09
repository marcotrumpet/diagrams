import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/rectangle/rectangle_flow_element.dart';
import 'package:diagrams/flow_elements/rounded_rectangle/rounded_rectangle_flow_element.dart';
import 'package:flutter/material.dart';

final rectangle = RectangleFlowElement(
  flowType: FlowTypes.rectangle,
  elementKey: UniqueKey(),
);

final roundedRectangle = RoundedRectangleFlowElement(
  flowType: FlowTypes.roundedRectangle,
  elementKey: UniqueKey(),
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
  ];
}
