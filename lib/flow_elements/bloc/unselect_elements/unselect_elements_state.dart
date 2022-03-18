import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unselect_elements_state.freezed.dart';

@freezed
class UnselectElementsState with _$UnselectElementsState {
  const factory UnselectElementsState(
      {required bool unselect, Key? elementKey}) = _UnselectElementsState;
}
