import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_event.dart';
import 'package:diagrams/main_canvas/main_canvas.dart';
import 'package:diagrams/side_menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiagramHome extends StatefulWidget {
  const DiagramHome({Key? key}) : super(key: key);

  @override
  _DiagramHomeState createState() => _DiagramHomeState();
}

class _DiagramHomeState extends State<DiagramHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GestureDetector(
        key: const Key('unselect_flow_elements'),
        behavior: HitTestBehavior.translucent,
        onTap: () {
          context
              .read<UnselectElementsBloc>()
              .add(UnselectElementsEvent(unselect: true));
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: const [
            SideMenu(),
            MainCanvas(),
          ],
        ),
      ),
    );
  }
}
