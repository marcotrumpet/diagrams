import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_barrier_model.freezed.dart';

@freezed
class UpdateBarrierModel with _$UpdateBarrierModel {
  const factory UpdateBarrierModel({
    required AbstractFlowElement abstractFlowElement,
    List<Offset>? endPointsToExclude,
  }) = _UpdateBarrierModel;
}
