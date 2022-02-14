import 'package:flutter/material.dart';

class ArrowModel {
  final Path arrowPath;
  final Offset startPoint;
  final Offset endPoint;
  final Key arrowKey;

  ArrowModel({
    required this.arrowPath,
    required this.startPoint,
    required this.endPoint,
    required this.arrowKey,
  });

  ArrowModel copyWith({
    Path? arrowPath,
    Offset? startPoint,
    Offset? endPoint,
    Key? arrowKey,
  }) {
    return ArrowModel(
      arrowPath: arrowPath ?? this.arrowPath,
      startPoint: startPoint ?? this.startPoint,
      endPoint: endPoint ?? this.endPoint,
      arrowKey: arrowKey ?? this.arrowKey,
    );
  }
}
