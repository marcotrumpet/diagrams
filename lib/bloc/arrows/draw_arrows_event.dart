import 'package:diagrams/bloc/arrows/arrow_model.dart';
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
class StartNewArrowEvent
    with _$StartNewArrowEvent
    implements AbstractDrawArrowsEvent {
  const factory StartNewArrowEvent({required ArrowModel arrowModel}) =
      _StartNewArrowEvent;
}

@freezed
class ClearAllArrowEvent
    with _$ClearAllArrowEvent
    implements AbstractDrawArrowsEvent {
  const factory ClearAllArrowEvent() = _ClearAllArrowEvent;
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
    AbstractFlowElement? endElement,
    Key? startPointKey,
    Key? endPointKey,
  }) = _DrawArrowsEvent;
}

@freezed
class MovedFlowElementUpdateArrowsEvent
    with _$MovedFlowElementUpdateArrowsEvent
    implements AbstractDrawArrowsEvent {
  const factory MovedFlowElementUpdateArrowsEvent(
      {AbstractFlowElement? element}) = _MovedFlowElementUpdateArrowsEvent;
}

@freezed
class DrawArrowsAStarEvent
    with _$DrawArrowsAStarEvent
    implements AbstractDrawArrowsEvent {
  const factory DrawArrowsAStarEvent({ArrowModel? arrowModel}) =
      _DrawArrowsAStarEvent;
}

@freezed
class ResetArrowAStarStateEvent
    with _$ResetArrowAStarStateEvent
    implements AbstractDrawArrowsEvent {
  const factory ResetArrowAStarStateEvent({Key? arrowKey}) =
      _ResetArrowAStarStateEvent;
}

@freezed
class SavePathToArrowEvent
    with _$SavePathToArrowEvent
    implements AbstractDrawArrowsEvent {
  const factory SavePathToArrowEvent(
      {required Key arrowKey,
      required List<Offset> arrowPath}) = _SavePathToArrowEvent;
}

@freezed
class RemoveArrowStartingFromPointEvent
    with _$RemoveArrowStartingFromPointEvent
    implements AbstractDrawArrowsEvent {
  /// Remove arrow with startPoint corresponding to [arrowKeys]. Used when
  /// user delete an [AbstractFlowElement] from grid
  const factory RemoveArrowStartingFromPointEvent(
      {required List<Key> arrowKeys}) = _RemoveArrowStartingFromPointEvent;
}

@freezed
class UpdateArrowModelEvent
    with _$UpdateArrowModelEvent
    implements AbstractDrawArrowsEvent {
  /// Update arrow model when flow element moved
  const factory UpdateArrowModelEvent({
    required ArrowModel model,
  }) = _UpdateArrowModelEvent;
}
