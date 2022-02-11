import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_bloc.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_event.dart';
import 'package:diagrams/side_menu/shapes_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  double toolBoxWidth = 190.0;

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
              context
                  .read<AddRemoveBloc>()
                  .add(RemoveEvent(elementToManipulate: data));
            },
            builder: (context, candidateData, rejectedData) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: basicShapes,
                ),
              );
            },
          ),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.resizeLeftRight,
          child: Draggable(
            feedback: Container(
              color: Theme.of(context).indicatorColor.withOpacity(0.5),
              width: 5,
            ),
            childWhenDragging: Container(
              color: Theme.of(context).indicatorColor.withOpacity(0.5),
              width: 5,
            ),
            dragAnchorStrategy: pointerDragAnchorStrategy,
            axis: Axis.horizontal,
            onDragUpdate: (de) {
              var deltaValue = (de.localPosition.dx - toolBoxWidth);
              var tempDelta =
                  (toolBoxWidth += deltaValue).clamp(190, 400).toDouble();
              setState(() {
                toolBoxWidth = tempDelta;
              });
            },
            child: Container(
              color: Theme.of(context).indicatorColor,
              width: 5,
            ),
          ),
        ),
      ],
    );
  }
}
