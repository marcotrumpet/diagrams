import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
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
  const factory AddElementEvent(
      {required AbstractFlowElement elementToManipulate}) = _AddElementEvent;
}

@freezed
class RemoveElementEvent
    with _$RemoveElementEvent
    implements AbstractAddRemoveElementEvent {
  const factory RemoveElementEvent(
      {required AbstractFlowElement elementToManipulate}) = _RemoveElementEvent;
}

@freezed
class MoveElementEvent
    with _$MoveElementEvent
    implements AbstractAddRemoveElementEvent {
  const factory MoveElementEvent(
      {required AbstractFlowElement elementToManipulate}) = _MoveElementEvent;
}

@freezed
class AddStartingPointToAnchorElementEvent
    with _$AddStartingPointToAnchorElementEvent
    implements AbstractAddRemoveElementEvent {
  const factory AddStartingPointToAnchorElementEvent({
    required AbstractFlowElement elementToManipulate,
    required ArrowModel arrowModelLinkedToElement,
  }) = _AddStartingPointToAnchorElementEvent;
}

@freezed
class AddEndingPointToAnchorElementEvent
    with _$AddEndingPointToAnchorElementEvent
    implements AbstractAddRemoveElementEvent {
  const factory AddEndingPointToAnchorElementEvent({
    required AbstractFlowElement elementToManipulate,
    required ArrowModel arrowModelLinkedToElement,
  }) = _AddEndingPointToAnchorElementEvent;
}
