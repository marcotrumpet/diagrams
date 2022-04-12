import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/add_remove_element/add_remove_element_event.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/bloc/resize_element/resize_element_bloc.dart';
import 'package:diagrams/bloc/theme/color_scheme_extension.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:diagrams/side_menu/shapes_tiles/expansion_tile_list.dart';
import 'package:diagrams/side_menu/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  double toolBoxWidth = 220.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const TitleWidget(),
            Expanded(
              child: SizedBox(
                width: toolBoxWidth,
                child: DragTarget<AbstractFlowElement>(
                  onWillAccept: (data) => data != null,
                  onAccept: (data) {
                    for (AnchorPointModel item
                        in data.anchorPointsModelMap?.anchorPointList ?? []) {
                      var keys = item.arrowModelStart
                              ?.map((e) => e.arrowKey)
                              .toList() ??
                          <Key>[];
                      context.read<DrawArrowsBloc>().add(
                            RemoveArrowStartingFromPointEvent(
                              arrowKeys: keys,
                            ),
                          );
                    }
                    context.read<ResizeElementBloc>().add(
                        ResizeElementEvent.clearMap(
                            elementKey: data.elementKey!));
                    context
                        .read<AddRemoveElementBloc>()
                        .add(RemoveElementEvent(elementToManipulate: data));
                  },
                  builder: (context, candidateData, rejectedData) {
                    return const ExpansionTileList();
                  },
                ),
              ),
            ),
          ],
        ),
        MouseRegion(
          cursor: SystemMouseCursors.resizeLeftRight,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              var deltaValue = (details.globalPosition.dx - toolBoxWidth);
              var tempDelta =
                  (toolBoxWidth += deltaValue).clamp(220, 300).toDouble();
              setState(() {
                toolBoxWidth = tempDelta;
              });
            },
            child: Container(
              color: Theme.of(context).colorScheme.appBackground,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }
}
