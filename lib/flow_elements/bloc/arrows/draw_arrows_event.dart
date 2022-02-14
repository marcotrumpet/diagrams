import 'package:flutter/material.dart';

class DrawArrowsEvent {
  final Offset? startPoint;
  final Offset? endPoint;
  final Key? arrowKey;

  DrawArrowsEvent({this.startPoint, this.endPoint, this.arrowKey});
}
