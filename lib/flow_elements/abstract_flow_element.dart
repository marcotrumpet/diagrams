import 'package:flutter/material.dart';

abstract class AbstractFlowElement {
  final FlowTypes flowType;
  final Offset? offset;
  final Key? elementKey;

  AbstractFlowElement({
    required this.flowType,
    this.elementKey,
    this.offset,
  });

  Widget build(BuildContext context);

  Widget buildSideMenu(BuildContext context);
}

enum FlowTypes {
  rectangle,
  roundedRectangle,
}
