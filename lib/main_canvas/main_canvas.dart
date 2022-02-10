import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_bloc.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_event.dart';
import 'package:diagrams/main_canvas/canvas_helper.dart';
import 'package:diagrams/main_canvas/grid_custom_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCanvas extends StatefulWidget {
  const MainCanvas({Key? key}) : super(key: key);

  @override
  _MainCanvasState createState() => _MainCanvasState();
}

class _MainCanvasState extends State<MainCanvas> {
  final _gridKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRemoveBloc, List<AbstractFlowElement>>(
      builder: (context, elementsList) {
        return Expanded(
          child: InteractiveViewer(
            maxScale: 10,
            minScale: 0.1,
            child: Stack(
              clipBehavior: Clip.hardEdge,
              fit: StackFit.expand,
              children: [
                RepaintBoundary(
                  child: CustomPaint(
                    key: _gridKey,
                    foregroundPainter: GridCustomPainter(
                      lineColor: Theme.of(context).dividerColor,
                    ),
                    child: DragTarget<AbstractFlowElement>(
                      onWillAccept: (data) {
                        if (elementsList.contains(data)) {
                          context
                              .read<AddRemoveBloc>()
                              .add(RemoveEvent(elementToManipulate: data!));
                        }
                        return true;
                      },
                      onAcceptWithDetails: (details) {
                        final newOffset = calcNewOffset(details, _gridKey);
                        handleFlowElements(details, context, newOffset);
                      },
                      builder: (context, candidateData, rejectedData) {
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                ...elementsList.map((e) => e.build(context)).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
