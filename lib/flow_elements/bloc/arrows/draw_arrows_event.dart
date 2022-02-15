import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:flutter/material.dart';

abstract class AbstractDrawArrowsEvent {}

class DrawArrowsEvent extends AbstractDrawArrowsEvent {
  final Offset? startPoint;
  final Offset? endPoint;
  final Key? arrowKey;
  final AbstractFlowElement? startElement;
  final Key? startPointKey;
  final Key? endPointKey;

  DrawArrowsEvent({
    this.startPoint,
    this.endPoint,
    this.arrowKey,
    this.startElement,
    this.startPointKey,
    this.endPointKey,
  });
}

class UpdateArrowsEvent extends AbstractDrawArrowsEvent {
  final AbstractFlowElement? startElement;

  UpdateArrowsEvent({this.startElement});
}
