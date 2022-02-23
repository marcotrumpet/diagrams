import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'draw_arrows_event.freezed.dart';

@freezed
abstract class AbstractDrawArrowsEvent with _$AbstractDrawArrowsEvent {
  const factory AbstractDrawArrowsEvent() = _AbstractDrawArrowsEvent;
}

@freezed
class DrawArrowsEvent
    with _$DrawArrowsEvent
    implements AbstractDrawArrowsEvent {
  const factory DrawArrowsEvent({
    Offset? startPoint,
    Offset? endPoint,
    Key? arrowKey,
    AbstractFlowElement? startElement,
    Key? startPointKey,
    Key? endPointKey,
  }) = _DrawArrowsEvent;
}

@freezed
class MovedFlowElementUpdateArrowsEvent
    with _$MovedFlowElementUpdateArrowsEvent
    implements AbstractDrawArrowsEvent {
  const factory MovedFlowElementUpdateArrowsEvent(
      {AbstractFlowElement? startElement}) = _MovedFlowElementUpdateArrowsEvent;
}

@freezed
class DrawArrowsAStarEvent
    with _$DrawArrowsAStarEvent
    implements AbstractDrawArrowsEvent {
  const factory DrawArrowsAStarEvent({Key? arrowKey}) = _DrawArrowsAStarEvent;
}

@freezed
class ResetArrowAStarStateEvent
    with _$ResetArrowAStarStateEvent
    implements AbstractDrawArrowsEvent {
  const factory ResetArrowAStarStateEvent({Key? arrowKey}) =
      _ResetArrowAStarStateEvent;
}
