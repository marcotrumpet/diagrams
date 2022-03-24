import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:flutter/material.dart';

class AnchorPoint extends StatelessWidget {
  final AnchorPointModel model;
  final bool unselect;
  final ValueNotifier<double> showAnchorPointsVN;
  const AnchorPoint({
    Key? key,
    required this.model,
    required this.unselect,
    required this.showAnchorPointsVN,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(
        model.anchorPointPosition.dx - 10,
        model.anchorPointPosition.dy - 10,
        0,
      ),
      child: MouseRegion(
        cursor: !unselect ? SystemMouseCursors.basic : SystemMouseCursors.grab,
        opaque: false,
        onEnter: (event) {
          if (!unselect) return;
          showAnchorPointsVN.value = 1.0;
        },
        onExit: (event) {
          if (!unselect) return;
          showAnchorPointsVN.value = 0.0;
        },
        child: ValueListenableBuilder<double>(
          valueListenable: showAnchorPointsVN,
          builder: (context, opacity, _) {
            return Opacity(
              opacity: opacity,
              child: Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
