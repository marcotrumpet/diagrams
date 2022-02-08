import 'package:diagrams/main_canvas/main_canvas.dart';
import 'package:diagrams/side_menu/side_menu.dart';
import 'package:flutter/material.dart';

class DiagramsHome extends StatefulWidget {
  const DiagramsHome({Key? key}) : super(key: key);

  @override
  _DiagramsHomeState createState() => _DiagramsHomeState();
}

class _DiagramsHomeState extends State<DiagramsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          SideMenu(),
          MainCanvas(),
        ],
      ),
    );
  }
}
