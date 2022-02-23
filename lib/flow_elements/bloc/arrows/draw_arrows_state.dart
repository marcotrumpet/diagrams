import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'draw_arrows_state.freezed.dart';

@freezed
class DrawArrowsState with _$DrawArrowsState {
  const factory DrawArrowsState({ArrowModel? arrowModel}) = _DrawArrowState;
}
