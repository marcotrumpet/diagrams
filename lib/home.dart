import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_event.dart';
import 'package:diagrams/main_canvas/main_canvas.dart';
import 'package:diagrams/side_menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiagramsHome extends StatefulWidget {
  const DiagramsHome({Key? key}) : super(key: key);

  @override
  _DiagramsHomeState createState() => _DiagramsHomeState();
}

class _DiagramsHomeState extends State<DiagramsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GestureDetector(
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
