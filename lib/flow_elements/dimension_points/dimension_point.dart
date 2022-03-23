import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/resize_element/resize_element_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DimensionPoint extends StatefulWidget {
  final AbstractFlowElement element;
  const DimensionPoint({Key? key, required this.element}) : super(key: key);

  @override
  State<DimensionPoint> createState() => _DimensionPointState();
}

class _DimensionPointState extends State<DimensionPoint> {
  // var offset = const Offset(1, 1);

  _handleUpdate(DragUpdateDetails details) {
    var offset = details.delta;
    context.read<ResizeElementBloc>().add(
          ResizeElementEvent.resize(element: widget.element, offset: offset),
        );
  }

  // _handleEnd(DragEndDetails details) {
  //   var bounds = widget.element.path.getBounds();
  //   context.read<AddRemoveElementBloc>().add(
  //         ScaleElementEvent(
  //           elementToManipulate: widget.element.copyWith(
  //             path: widget.element.path.transform(Matrix4.diagonal3Values(
  //                     1 + offset.dx / bounds.width,
  //                     1 + offset.dy / bounds.height,
  //                     0)
  //                 .storage),
  //           ),
  //         ),
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(-7.5, -7.5, 0),
      width: 15,
      height: 15,
      child: GestureDetector(
        onPanUpdate: _handleUpdate,
        // onPanEnd: _handleEnd,
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
