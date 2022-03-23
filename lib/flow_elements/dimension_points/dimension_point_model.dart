import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dimension_point_model.freezed.dart';

@freezed
class DimensionPointModelMap with _$DimensionPointModelMap {
  const factory DimensionPointModelMap({
    required List<DimensionPointModel> dimensionPointList,
  }) = _DimensionPointModelMap;
}

@freezed
class DimensionPointModel with _$DimensionPointModel {
  const factory DimensionPointModel({
    required Key dimensionPointKey,
    required Alignment alignment,
    required Offset dimensionPointPosition,
    required Offset dimensionPointPositionRelativeToParent,
    required Widget child,
  }) = _DimensionPointModel;
}
