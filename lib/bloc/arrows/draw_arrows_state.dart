import 'package:diagrams/bloc/arrows/arrow_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'draw_arrows_state.freezed.dart';

@freezed
class DrawArrowsState with _$DrawArrowsState {
  const factory DrawArrowsState({ArrowModel? arrowModel}) = _DrawArrowState;
  const factory DrawArrowsState.remove({required Key arrowKey}) =
      _RemoveArrowState;
  const factory DrawArrowsState.removeAll() = _RemoveAllArrowState;
}
