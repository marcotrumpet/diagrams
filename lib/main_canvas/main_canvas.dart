import 'package:diagrams/main_canvas/grid_custom_painter.dart';
import 'package:flutter/material.dart';

class MainCanvas extends StatefulWidget {
  const MainCanvas({Key? key}) : super(key: key);

  @override
  _MainCanvasState createState() => _MainCanvasState();
}

class _MainCanvasState extends State<MainCanvas> {
  double scale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InteractiveViewer(
        maxScale: 10,
        minScale: 0.1,
        child: CustomPaint(
          painter: GridCustomPainter(
              scale: scale, lineColor: Theme.of(context).dividerColor),
          child: DragTarget<String>(
            builder: (context, candidateData, rejectedData) {
              return SizedBox.expand(child: Text(candidateData.toString()));
            },
          ),
        ),
      ),
    );
  }
}
