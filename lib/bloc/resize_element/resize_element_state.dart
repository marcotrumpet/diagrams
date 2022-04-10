part of 'resize_element_bloc.dart';

@freezed
class ResizeElementState with _$ResizeElementState {
  const factory ResizeElementState.initial() = _Initial;
  const factory ResizeElementState.resizing({
    required AbstractFlowElement element,
  }) = _ResizingState;
  const factory ResizeElementState.resizeEnd({
    required AbstractFlowElement element,
  }) = _ResizeEndState;
  const factory ResizeElementState.resizeStart() = _ResizeStartState;
}
