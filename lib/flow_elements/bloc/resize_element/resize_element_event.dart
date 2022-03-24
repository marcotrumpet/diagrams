part of 'resize_element_bloc.dart';

@freezed
class ResizeElementEvent with _$ResizeElementEvent {
  const factory ResizeElementEvent.resize({
    required AbstractFlowElement element,
    required Offset offset,
    required Alignment alignment,
  }) = _Resize;
  const factory ResizeElementEvent.clearMap({
    required Key elementKey,
  }) = _ClearMap;
}
