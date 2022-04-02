import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unselect_elements_state.freezed.dart';

@freezed
class UnselectElementsState with _$UnselectElementsState {
  const factory UnselectElementsState(
          {required SelectedElementList selectedElementList}) =
      _UnselectElementsState;
}

@freezed
class SelectedElementList with _$SelectedElementList {
  const factory SelectedElementList(
      {@Default(<SelectedElement>[])
          List<SelectedElement> selectedElements}) = _SelectedElementList;
}

@freezed
class SelectedElement with _$SelectedElement {
  const factory SelectedElement({
    required Key elementKey,
    required bool selected,
  }) = _SelectedElement;
}
