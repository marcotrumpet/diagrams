import 'package:diagrams/flow_elements/abstract_custom_painter.dart';
import 'package:flutter/material.dart';

class RoundedRectangleCustomPainter extends AbstractCustomPainter {
  RoundedRectangleCustomPainter(
      {required Path path, required BuildContext context})
      : super(path: path, context: context);
}
