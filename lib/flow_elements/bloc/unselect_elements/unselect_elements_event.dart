import 'package:flutter/foundation.dart';

class UnselectElementsEvent {
  final bool unselect;
  final Key? elementKey;

  UnselectElementsEvent({required this.unselect, this.elementKey});
}
