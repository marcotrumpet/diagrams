import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anchor_point_model.freezed.dart';

@freezed
class AnchorPointModelMap with _$AnchorPointModelMap {
  const factory AnchorPointModelMap({
    required List<AnchorPointModel> anchorPointList,
    required Widget child,
  }) = _AnchorPointModelMap;
}

@freezed
class AnchorPointModel with _$AnchorPointModel {
  const factory AnchorPointModel({
    required Key anchorPointKey,
    required Offset anchorPointPosition,
    required Offset anchorPointPositionRelativeToParent,
    required Alignment alignment,
    @Default([]) List<ArrowModel>? arrowModelStart,
    @Default([]) List<ArrowModel>? arrowModelEnd,
  }) = _AnchorPointModel;
}
