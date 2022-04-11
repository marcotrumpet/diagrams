import 'package:diagrams/bloc/arrows/arrow_model.dart';
import 'package:diagrams/common/json_converter_methods.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anchor_point_model.freezed.dart';
part 'anchor_point_model.g.dart';

@freezed
class AnchorPointModel with _$AnchorPointModel {
  @JsonSerializable(includeIfNull: false)
  factory AnchorPointModel({
    @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
        required Key anchorPointKey,
    @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
        required Offset anchorPointPosition,
    @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
        required Offset anchorPointPositionRelativeToParent,
    @JsonKey(toJson: alignmentToJson, fromJson: alignmentFromJson)
        required Alignment alignment,
    List<ArrowModel>? arrowModelStart,
    List<ArrowModel>? arrowModelEnd,
    @JsonKey(ignore: true) Widget? child,
  }) = _AnchorPointModel;
  factory AnchorPointModel.fromJson(Map<String, dynamic> json) =>
      _$AnchorPointModelFromJson(json);
}
