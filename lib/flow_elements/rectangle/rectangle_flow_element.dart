import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/rectangle/rectangle_custom_painter.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rectangle_flow_element.freezed.dart';

@freezed
class RectangleFlowElement
    with _$RectangleFlowElement
    implements AbstractFlowElement {
  const RectangleFlowElement._();

  const factory RectangleFlowElement({
    required FlowTypes flowType,
    Offset? offset,
    Key? elementKey,
  }) = _RectangleFlowElement;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Transform.translate(
        key: elementKey,
        offset: offset ?? const Offset(0, 0),
        child: Draggable<RectangleFlowElement>(
          data: this,
          child: buildSideMenu(context),
          feedback: buildSideMenu(context),
        ),
      ),
    );
  }

  @override
  Widget buildSideMenu(BuildContext context) {
    return CustomPaint(
      size: const Size(60, 40),
      painter: RectangleCustomPainter(Theme.of(context).toggleableActiveColor),
    );
  }
}
