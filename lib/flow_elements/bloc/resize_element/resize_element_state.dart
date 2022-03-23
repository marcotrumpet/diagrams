part of 'resize_element_bloc.dart';

@freezed
class ResizeElementState with _$ResizeElementState {
  const factory ResizeElementState.initial() = _Initial;
  const factory ResizeElementState.resized({
    required AbstractFlowElement element,
  }) = _Resized;
}
