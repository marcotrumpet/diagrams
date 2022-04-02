import 'package:diagrams/bloc/arrows/arrow_model.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_remove_element_event.freezed.dart';

@freezed
abstract class AbstractAddRemoveElementEvent
    with _$AbstractAddRemoveElementEvent {
  const factory AbstractAddRemoveElementEvent() =
      _AbstractAddRemoveElementEvent;
}

@freezed
class AddElementEvent
    with _$AddElementEvent
    implements AbstractAddRemoveElementEvent {
  /// Add new flow element to canvas
  const factory AddElementEvent({
    required AbstractFlowElement elementToManipulate,
  }) = _AddElementEvent;
}

@freezed
class RemoveElementEvent
    with _$RemoveElementEvent
    implements AbstractAddRemoveElementEvent {
  /// Remove new flow element to canvas
  const factory RemoveElementEvent(
      {required AbstractFlowElement elementToManipulate}) = _RemoveElementEvent;
}

@freezed
class MoveElementEvent
    with _$MoveElementEvent
    implements AbstractAddRemoveElementEvent {
  /// Call it when element move on the canvas
  const factory MoveElementEvent(
      {required AbstractFlowElement elementToManipulate}) = _MoveElementEvent;
}

@freezed
class ScaleElementEvent
    with _$ScaleElementEvent
    implements AbstractAddRemoveElementEvent {
  /// Call it when element move on the canvas
  const factory ScaleElementEvent(
      {required AbstractFlowElement elementToManipulate}) = _ScaleElementEvent;
}

@freezed
class AddStartingPointToAnchorElementEvent
    with _$AddStartingPointToAnchorElementEvent
    implements AbstractAddRemoveElementEvent {
  /// Add an arrow starting point to a specific flow element anchor
  const factory AddStartingPointToAnchorElementEvent({
    required AbstractFlowElement elementToManipulate,
    required ArrowModel arrowModelLinkedToElement,
  }) = _AddStartingPointToAnchorElementEvent;
}

@freezed
class AddEndingPointToAnchorElementEvent
    with _$AddEndingPointToAnchorElementEvent
    implements AbstractAddRemoveElementEvent {
  /// Add an arrow ending point to a specific flow element anchor
  /// In the same time exclude endpoint from barriers to let arrow land there
  const factory AddEndingPointToAnchorElementEvent({
    required AbstractFlowElement elementToManipulate,
    required ArrowModel arrowModelLinkedToElement,
  }) = _AddEndingPointToAnchorElementEvent;
}

@freezed
class RefreshLinkedArrowInsideElements
    with _$RefreshLinkedArrowInsideElements
    implements AbstractAddRemoveElementEvent {
  /// The refreshed arrow model needs to be updated inside anchorPoints to be consistent
  const factory RefreshLinkedArrowInsideElements({
    required ArrowModel arrowModel,
  }) = _RefreshLinkedArrowInsideElements;
}
