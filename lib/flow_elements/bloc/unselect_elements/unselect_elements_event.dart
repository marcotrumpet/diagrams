import 'package:flutter/foundation.dart';

class UnselectElementsEvent {
  final bool selected;
  final Key? elementKey;

  UnselectElementsEvent({required this.selected, this.elementKey});
}
