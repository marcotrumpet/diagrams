import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnchorPoint extends StatefulWidget {
  final AnchorPointModel model;
  final ValueNotifier<double> showAnchorPointsVN;
  const AnchorPoint({
    Key? key,
    required this.model,
    required this.showAnchorPointsVN,
  }) : super(key: key);

  @override
  State<AnchorPoint> createState() => _AnchorPointState();
}

class _AnchorPointState extends State<AnchorPoint> {
  @override
  void didUpdateWidget(covariant AnchorPoint oldWidget) {
    if (widget.model.anchorPointPositionRelativeToParent !=
        oldWidget.model.anchorPointPositionRelativeToParent) {
      for (ArrowModel arrow in widget.model.arrowModelStart ?? []) {
        var model = arrow.copyWith(
          startPoint: widget.model.anchorPointPositionRelativeToParent,
          updateAStarPath: true,
        );
        context
            .read<DrawArrowsBloc>()
            .add(DrawArrowsAStarEvent(arrowModel: model));
      }
      for (ArrowModel arrow in widget.model.arrowModelEnd ?? []) {
        var model = arrow.copyWith(
          endPoint: widget.model.anchorPointPositionRelativeToParent,
          updateAStarPath: true,
        );
        context
            .read<DrawArrowsBloc>()
            .add(DrawArrowsAStarEvent(arrowModel: model));
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(
        widget.model.anchorPointPosition.dx - 10,
        widget.model.anchorPointPosition.dy - 10,
        0,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.grab,
        opaque: false,
        onEnter: (event) {
          widget.showAnchorPointsVN.value = 1.0;
        },
        onExit: (event) {
          widget.showAnchorPointsVN.value = 0.0;
        },
        child: ValueListenableBuilder<double>(
          valueListenable: widget.showAnchorPointsVN,
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
