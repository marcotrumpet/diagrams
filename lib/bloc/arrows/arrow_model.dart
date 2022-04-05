import 'package:diagrams/common/json_converter_methods.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'arrow_model.freezed.dart';
part 'arrow_model.g.dart';

@freezed
class ArrowModel with _$ArrowModel {
  @JsonSerializable(includeIfNull: false)
  const factory ArrowModel({
    @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
        required Offset startPoint,
    @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
        required Key startPointKey,
    @JsonKey(toJson: offsetRequiredToJson, fromJson: offsetRequiredFromJson)
        required Offset endPoint,
    @JsonKey(toJson: keyToJson, fromJson: keyFromJson) Key? endPointKey,
    @JsonKey(toJson: keyRequiredToJson, fromJson: keyRequiredFromJson)
        required Key arrowKey,
    @JsonKey(toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
        AbstractFlowElement? startElement,
    @JsonKey(toJson: abstractFlowElementToJson, fromJson: abstractFlowElementFromJson)
        AbstractFlowElement? endElement,
    @Default(false) bool? updateAStarPath,
    @JsonKey(toJson: offsetListToJson, fromJson: offsetListFromJson)
        List<Offset>? currentArrowPath,
  }) = _ArrowModel;
  factory ArrowModel.fromJson(Map<String, dynamic> json) =>
      _$ArrowModelFromJson(json);
}
