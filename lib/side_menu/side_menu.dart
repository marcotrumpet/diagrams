import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/side_menu/shapes_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  double toolBoxWidth = 130.0;

  @override
  Widget build(BuildContext context) {
    final basicShapes = basicShapesList(context);
    return Row(
      children: [
        SizedBox(
          width: toolBoxWidth,
          child: DragTarget<AbstractFlowElement>(
            onWillAccept: (data) => data != null,
            onAccept: (data) {
              for (AnchorPointModel item
                  in data.anchorPointsModelMap?.anchorPointList ?? []) {
                var keys =
                    item.arrowModelStart?.map((e) => e.arrowKey).toList() ??
                        <Key>[];
                context.read<DrawArrowsBloc>().add(
                      RemoveArrowStartingFromPointEvent(
                        arrowKeys: keys,
                      ),
                    );
              }
              context
                  .read<AddRemoveElementBloc>()
                  .add(RemoveElementEvent(elementToManipulate: data));
            },
            builder: (context, candidateData, rejectedData) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: basicShapes
                        .map((e) => Container(
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              child: e,
                            ))
                        .toList(),
                  ),
                ),
              );
            },
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.resizeLeftRight,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              var deltaValue = (details.globalPosition.dx - toolBoxWidth);
              var tempDelta =
                  (toolBoxWidth += deltaValue).clamp(100, 250).toDouble();
              setState(() {
                toolBoxWidth = tempDelta;
              });
            },
            child: Container(
              color: Theme.of(context).disabledColor,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }
}
