import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/rounded_rectangle/rounded_rectangle_custom_painter.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rounded_rectangle_flow_element.freezed.dart';

@freezed
class RoundedRectangleFlowElement
    with _$RoundedRectangleFlowElement
    implements AbstractFlowElement {
  const RoundedRectangleFlowElement._();

  const factory RoundedRectangleFlowElement({
    required FlowTypes flowType,
    Offset? offset,
    Key? elementKey,
  }) = _RoundedRectangleFlowElement;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Transform.translate(
        key: elementKey,
        offset: offset ?? const Offset(0, 0),
        child: Draggable<RoundedRectangleFlowElement>(
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
      painter: RoundedRectangleCustomPainter(
          Theme.of(context).toggleableActiveColor),
    );
  }
}
