import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/resize_element/resize_element_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DimensionPoint extends StatelessWidget {
  final AbstractFlowElement element;
  final Alignment alignment;
  const DimensionPoint({
    Key? key,
    required this.element,
    required this.alignment,
  }) : super(key: key);

  _handleUpdate(DragUpdateDetails details, BuildContext context) {
    var offset = details.delta;

    context.read<ResizeElementBloc>().add(
          ResizeElementEvent.resize(
            element: element,
            offset: offset,
            alignment: alignment,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10,
      height: 10,
      child: GestureDetector(
        onPanUpdate: (d) => _handleUpdate(d, context),
        behavior: HitTestBehavior.translucent,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).disabledColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
