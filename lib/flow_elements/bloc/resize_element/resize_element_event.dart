part of 'resize_element_bloc.dart';

@freezed
class ResizeElementEvent with _$ResizeElementEvent {
  const factory ResizeElementEvent.resizing({
    required Key elementKey,
    required Offset offset,
    required Alignment alignment,
  }) = _Resizing;
  const factory ResizeElementEvent.clearMap({
    required Key elementKey,
  }) = _ClearMap;
  const factory ResizeElementEvent.resizeEnd({
    required Key elementKey,
  }) = _ResizeEnd;
}
