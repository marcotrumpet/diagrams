import 'package:diagrams/bloc/resize_element/resize_element_bloc.dart';
import 'package:diagrams/bloc/theme/color_scheme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DimensionPoint extends StatelessWidget {
  final Key abstractFlowElementKey;
  final Alignment alignment;
  const DimensionPoint({
    Key? key,
    required this.abstractFlowElementKey,
    required this.alignment,
  }) : super(key: key);

  _handleUpdate(DragUpdateDetails details, BuildContext context) {
    var offset = details.delta;

    context.read<ResizeElementBloc>().add(
          ResizeElementEvent.resizing(
            elementKey: abstractFlowElementKey,
            offset: offset,
            alignment: alignment,
          ),
        );
  }

  MouseCursor handleCursor() {
    if (alignment == Alignment.bottomCenter) {
      return SystemMouseCursors.resizeDown;
    } else if (alignment == Alignment.centerRight) {
      return SystemMouseCursors.resizeRight;
    } else if (alignment == Alignment.centerLeft) {
      return SystemMouseCursors.resizeLeft;
    } else if (alignment == Alignment.topCenter) {
      return SystemMouseCursors.resizeUp;
    } else if (alignment == Alignment.topLeft) {
      return SystemMouseCursors.resizeUpLeft;
    } else if (alignment == Alignment.topRight) {
      return SystemMouseCursors.resizeUpRight;
    } else if (alignment == Alignment.bottomLeft) {
      return SystemMouseCursors.resizeDownLeft;
    } else if (alignment == Alignment.bottomRight) {
      return SystemMouseCursors.resizeDownRight;
    }
    return SystemMouseCursors.resizeColumn;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: handleCursor(),
      opaque: true,
      child: SizedBox(
        width: 10,
        height: 10,
        child: GestureDetector(
          onPanUpdate: (d) => _handleUpdate(d, context),
          onPanEnd: (_) {
            context.read<ResizeElementBloc>().add(
                  ResizeElementEvent.resizeEnd(
                    elementKey: abstractFlowElementKey,
                  ),
                );
          },
          behavior: HitTestBehavior.translucent,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.appAccent,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
