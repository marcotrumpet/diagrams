import 'package:flutter/material.dart';

typedef AbtractFlowElementBuilder<Widget> = Widget Function(
    BuildContext context, Widget child);

abstract class AbstractFlowElement {
  final FlowTypes flowType;
  final Offset? offset;
  final Key? elementKey;

  AbstractFlowElement({
    required this.flowType,
    this.elementKey,
    this.offset,
  });

  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment.topLeft,
        child: Transform.translate(
          key: elementKey,
          offset: offset ?? const Offset(0, 0),
          child: concreteBuild(context),
        ),
      ),
    );
  }

  Widget concreteBuild(BuildContext context);

  Widget buildSideMenu(BuildContext context);

  AbstractFlowElement copyWith({
    FlowTypes? flowType,
    Offset? offset,
    Key? elementKey,
  });
}

enum FlowTypes {
  rectangle,
  roundedRectangle,
}
