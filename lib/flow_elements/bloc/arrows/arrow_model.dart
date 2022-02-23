import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'arrow_model.freezed.dart';

@freezed
class ArrowModel with _$ArrowModel {
  const factory ArrowModel({
    required Offset startPoint,
    required Key startPointKey,
    required Offset endPoint,
    required Key arrowKey,
    AbstractFlowElement? startElement,
    AbstractFlowElement? endElement,
    @Default(false) bool? updateAStarPath,
  }) = _ArrowModel;
}
