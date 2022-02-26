import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'barrier_model.freezed.dart';

@freezed
class BarrierModel with _$BarrierModel {
  const factory BarrierModel({
    required Key abstractElementKey,
    required List<Offset> positions,
  }) = _BarrierModel;
}