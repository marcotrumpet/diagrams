import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  double toolBoxWidth = 150.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: toolBoxWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Draggable<String>(
                hitTestBehavior: HitTestBehavior.opaque,
                data: 'red',
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.red,
                  child: const Icon(Icons.access_alarms),
                ),
                feedback: const SizedBox(
                  height: 120.0,
                  width: 120.0,
                  child: Center(
                    child: Icon(Icons.access_alarms),
                  ),
                ),
              ),
            ],
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
                  (toolBoxWidth += deltaValue).clamp(150, 400).toDouble();
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
