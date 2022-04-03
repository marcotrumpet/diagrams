import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/arrow_model.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/bloc/handle_points/handle_points_bloc.dart';
import 'package:diagrams/common/grid/grid_property_provider.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/arrow/arrow_custom_painter.dart';
import 'package:diagrams/main_canvas/canvas_helper.dart';
import 'package:diagrams/main_canvas/grid_custom_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MainCanvas extends StatefulWidget {
  const MainCanvas({Key? key}) : super(key: key);

  @override
  _MainCanvasState createState() => _MainCanvasState();
}

class _MainCanvasState extends State<MainCanvas> {
  final _gridKey = GetIt.I<GridPropertyProvider>().gridKey;

  final _arrowModelList = <ArrowModel>[];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InteractiveViewer(
        maxScale: 10,
        minScale: 0.1,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          fit: StackFit.expand,
          children: [
            Listener(
              onPointerDown: (event) {
                context
                    .read<HandlePointsBloc>()
                    .add(HandlePointsEvent.panDown(event.localPosition));
              },
              onPointerMove: (event) {
                context
                    .read<HandlePointsBloc>()
                    .add(HandlePointsEvent.panUpdate(event.localPosition));
              },
              onPointerUp: (event) {
                context
                    .read<HandlePointsBloc>()
                    .add(HandlePointsEvent.panEnd(event.localPosition));
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
            RepaintBoundary(
              child: CustomPaint(
                key: _gridKey,
                foregroundPainter: GridCustomPainter(
                  context: context,
                ),
                child: DragTarget<AbstractFlowElement>(
                  onAcceptWithDetails: (details) {
                    final newOffset = calcNewOffset(details, _gridKey);
                    handleFlowElements(
                      element: details.data,
                      context: context,
                      offset: newOffset,
                      drawNewElement: !isElementInList(
                          context: context, element: details.data),
                    );
                  },
                  // onMove: (details) {
                  //   if (!isElementInList(
                  //       context: context, element: details.data)) return;
                  //   final newOffset = calcNewOffset(details, _gridKey);
                  //   handleFlowElements(
                  //     element: details.data,
                  //     context: context,
                  //     offset: newOffset,
                  //     drawNewElement: false,
                  //   );
                  // },
                  builder: (context, candidateData, rejectedData) {
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
            BlocConsumer<DrawArrowsBloc, DrawArrowsState>(
              listener: (context, state) {
                state.maybeWhen(
                  (arrowModel) {
                    var idx = _arrowModelList.indexWhere(
                        (element) => element.arrowKey == arrowModel!.arrowKey);

                    if (idx == -1) {
                      _arrowModelList.add(arrowModel!);
                    } else {
                      _arrowModelList.removeAt(idx);
                      _arrowModelList.insert(idx, arrowModel!);
                    }
                  },
                  remove: (arrowKey) {
                    _arrowModelList
                        .removeWhere((element) => element.arrowKey == arrowKey);
                  },
                  orElse: () => null,
                );
              },
              builder: (context, state) {
                return Stack(
                  children: _arrowModelList.map(
                    (arrow) {
                      return RepaintBoundary(
                        child: CustomPaint(
                          key: arrow.arrowKey,
                          painter: ArrowCustomPainter(
                            arrowModel: arrow,
                            context: context,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                );
              },
            ),
            BlocBuilder<AddRemoveElementBloc, List<AbstractFlowElement>>(
              builder: (context, elementsList) {
                return Stack(
                  children: elementsList.map((e) => e.build(context)).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
