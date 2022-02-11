import 'package:diagrams/flow_elements/abstract_custom_painter.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_event.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:diagrams/flow_elements/dimension_points/dimension_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum FlowTypes { rectangle, roundedRectangle, triangle, circle }

abstract class AbstractFlowElement {
  final FlowTypes flowType;
  final Offset? offset;
  final Key? elementKey;
  final Path path;

  AbstractFlowElement({
    required this.flowType,
    required this.path,
    this.elementKey,
    this.offset,
  }) {
    setAnchorPoints();
    setDimensionPoints();
  }

  final _showAnchorPointsValueNotifier = ValueNotifier(0.0);
  final _anchorPointsList = <Offset?>{};
  final _dimensionPointsList = <Offset?>{};

  void setAnchorPoints() {
    final boundRect = path.getBounds();
    _anchorPointsList.addAll([
      if (path.contains(boundRect.topLeft)) boundRect.topLeft,
      if (path.contains(boundRect.topCenter)) boundRect.topCenter,
      if (path.contains(boundRect.topRight)) boundRect.topRight,
      if (path.contains(boundRect.bottomLeft)) boundRect.bottomLeft,
      if (path.contains(boundRect.bottomCenter)) boundRect.bottomCenter,
      if (path.contains(boundRect.bottomRight)) boundRect.bottomRight,
      if (path.contains(Offset(boundRect.left, boundRect.height / 2)))
        Offset(boundRect.left, boundRect.height / 2),
      if (path.contains(Offset(boundRect.right, boundRect.height / 2)))
        Offset(boundRect.right, boundRect.height / 2),
    ]);
  }

  void setDimensionPoints() {
    final boundRect = path.getBounds();
    _dimensionPointsList.addAll([
      boundRect.topLeft,
      boundRect.topCenter,
      boundRect.topRight,
      boundRect.bottomLeft,
      boundRect.bottomCenter,
      boundRect.bottomRight,
      Offset(boundRect.left, boundRect.height / 2),
      Offset(boundRect.right, boundRect.height / 2),
    ]);
  }

  Widget build(BuildContext context) {
    return BlocBuilder<UnselectElementsBloc, UnselectElementsState>(
      buildWhen: (previous, current) =>
          elementKey == current.elementKey || current.elementKey == null,
      builder: (context, state) {
        return Container(
          transform:
              Matrix4.translationValues(offset?.dx ?? 0, offset?.dy ?? 0, 0),
          alignment: Alignment.topLeft,
          key: elementKey,
          child: GestureDetector(
            onTap: () {
              context.read<UnselectElementsBloc>().add(UnselectElementsEvent(
                  unselect: !state.unselect, elementKey: elementKey));
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.grab,
              onEnter: (event) {
                if (!state.unselect) return;
                _showAnchorPointsValueNotifier.value = 1.0;
              },
              onExit: (event) {
                _showAnchorPointsValueNotifier.value = 0.0;
              },
              child: SizedBox(
                height: path.getBounds().height + 30,
                width: path.getBounds().width + 30,
                child: Center(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: concreteBuild(context),
                      ),
                      if (_anchorPointsList.isNotEmpty)
                        for (var offset in _anchorPointsList)
                          Positioned(
                            right: offset?.dx,
                            top: offset?.dy,
                            child: ValueListenableBuilder<double>(
                              valueListenable: _showAnchorPointsValueNotifier,
                              builder: (context, opacity, _) {
                                return Opacity(
                                  opacity: opacity,
                                  child: const AnchorPoint(),
                                );
                              },
                            ),
                          ),
                      if (_dimensionPointsList.isNotEmpty && !state.unselect)
                        CustomPaint(
                          painter: DotLineCustomPainter(
                              path: path, context: context),
                        ),
                      if (_dimensionPointsList.isNotEmpty && !state.unselect)
                        for (var offset in _dimensionPointsList)
                          Positioned(
                            right: offset?.dx,
                            top: offset?.dy,
                            child: const DimensionPoints(),
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget concreteBuild(BuildContext context);

  Widget buildSideMenu(BuildContext context);

  AbstractFlowElement copyWith({
    FlowTypes? flowType,
    Offset? offset,
    Key? elementKey,
    Path? path,
  });
}
