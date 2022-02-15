import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/main_canvas/canvas_helper.dart';
import 'package:diagrams/main_canvas/grid_custom_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touchable/touchable.dart';

class MainCanvas extends StatefulWidget {
  const MainCanvas({Key? key}) : super(key: key);

  @override
  _MainCanvasState createState() => _MainCanvasState();
}

class _MainCanvasState extends State<MainCanvas> {
  final _gridKey = GlobalKey();

  List<AbstractFlowElement>? calcOffsetRelativeToParent(
      List<AbstractFlowElement> elementsList) {
    // var newList = <AbstractFlowElement>[];

    // for (var element in elementsList) {
    //   var newAnchorPointsSet = element.anchorPointsList
    //       .map((e) => (e ?? Offset.zero) + element.offset!)
    //       .toSet();
    //   element.copyWith(
    //     anchorPointsSet: newAnchorPointsSet,
    //   );
    //   newList.add(element);
    // }

    return elementsList;
    // return elementsList.map((e) => e.anchorPointsList.map((el) => (el ?? Offset.zero) + e.offset!)).toList();

    // .expand((element) => element.anchorPointsList
    // .map((e) => (e ?? Offset.zero) + element.offset!))
    // .toSet();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRemoveElementBloc, List<AbstractFlowElement>>(
      builder: (context, elementsList) {
        return Expanded(
          child: InteractiveViewer(
            maxScale: 10,
            minScale: 0.1,
            child: Stack(
              clipBehavior: Clip.hardEdge,
              fit: StackFit.expand,
              children: [
                CanvasTouchDetector(
                  builder: (context) {
                    return CustomPaint(
                      key: _gridKey,
                      foregroundPainter: GridCustomPainter(
                        context: context,
                        flowElementsList: elementsList,
                      ),
                      child: DragTarget<AbstractFlowElement>(
                        onWillAccept: (data) {
                          if (elementsList.contains(data)) {
                            context.read<AddRemoveElementBloc>().add(
                                RemoveElementEvent(elementToManipulate: data!));
                          }
                          return true;
                        },
                        onMove: (details) {
                          // final newOffset = calcNewOffset(details, _gridKey);
                          // context.read<AddRemoveElementBloc>().add(
                          //     RemoveElementEvent(
                          //         elementToManipulate: details.data));
                          // handleFlowElements(details, context, newOffset);
                          // context.read<DrawArrowsBloc>().add(
                          //       UpdateArrowsEvent(startElement: details.data),
                          //     );
                        },
                        onAcceptWithDetails: (details) {
                          final newOffset = calcNewOffset(details, _gridKey);
                          handleFlowElements(details, context, newOffset);
                        },
                        builder: (context, candidateData, rejectedData) {
                          return const SizedBox.shrink();
                        },
                      ),
                    );
                  },
                ),
                BlocBuilder<DrawArrowsBloc, DrawArrowsState>(
                  builder: (context, state) {
                    return CustomPaint(
                      foregroundPainter: ArrowCustomPainter(
                        arrowModelList: state.arrowModelList,
                      ),
                    );
                  },
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
