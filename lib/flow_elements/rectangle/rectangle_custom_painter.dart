import 'package:diagrams/flow_elements/abstract_custom_painter.dart';
import 'package:flutter/material.dart';

class RectangleCustomPainter extends AbstractCustomPainter {
  RectangleCustomPainter({
    required Path path,
    required BuildContext context,
    Offset? scale,
  }) : super(path: path, context: context);
}
