import 'package:diagrams/flow_elements/abstract_custom_painter.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_event.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:diagrams/flow_elements/dimension_points/dimension_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum FlowElementTypes { rectangle, roundedRectangle, triangle, circle }

abstract class AbstractFlowElement {
  final FlowElementTypes flowType;
  final Offset? offset;
  final Key? elementKey;
  final Path path;
  AnchorPointModelMap? anchorPointsModelMap;

  AbstractFlowElement(
      {required this.flowType,
      required this.path,
      this.elementKey,
      this.offset,
      this.anchorPointsModelMap = const AnchorPointModelMap(
        anchorPointList: [],
      )}) {
    _setDimensionPoints();
  }

  final _showAnchorPointsValueNotifier = ValueNotifier(0.0);

  final _dimensionPointsList = <Offset?>{};

  AnchorPointModelMap setAnchorPoints(Offset offset, Path path) {
    final boundRect = path.getBounds();
    var _anchorPointsMap = [
      if (path.contains(boundRect.topLeft))
        {Alignment.topLeft: boundRect.topLeft},
      if (path.contains(boundRect.topCenter))
        {Alignment.topCenter: boundRect.topCenter},
      if (path.contains(boundRect.topRight))
        {Alignment.topRight: boundRect.topRight},
      if (path.contains(boundRect.bottomLeft))
        {Alignment.bottomLeft: boundRect.bottomLeft},
      if (path.contains(boundRect.bottomCenter))
        {Alignment.bottomCenter: boundRect.bottomCenter},
      if (path.contains(boundRect.bottomRight))
        {Alignment.bottomRight: boundRect.bottomRight},
      if (path.contains(Offset(boundRect.left, boundRect.height / 2)))
        {Alignment.centerLeft: Offset(boundRect.left, boundRect.height / 2)},
      if (path.contains(Offset(boundRect.right, boundRect.height / 2)))
        {Alignment.centerRight: Offset(boundRect.right, boundRect.height / 2)},
    ];

    return AnchorPointModelMap(
      anchorPointList: _anchorPointsMap.map((e) {
        var key = UniqueKey();
        return AnchorPointModel(
          anchorPointKey: key,
          anchorPointPosition: e.values.first,
          anchorPointPositionRelativeToParent: e.values.first + offset,
          alignment: e.keys.first,
          child: AnchorPoint(key: key),
        );
      }).toList(),
    );
  }

  AnchorPointModelMap updateAnchorPoints(
      AbstractFlowElement data, Offset offset, Path path) {
    final boundRect = path.getBounds();
    var _anchorPointsMap = [
      {Alignment.topLeft: boundRect.topLeft},
      {Alignment.topCenter: boundRect.topCenter},
      {Alignment.topRight: boundRect.topRight},
      {Alignment.bottomLeft: boundRect.bottomLeft},
      {Alignment.bottomCenter: boundRect.bottomCenter},
      {Alignment.bottomRight: boundRect.bottomRight},
      {Alignment.centerLeft: Offset(boundRect.left, boundRect.height / 2)},
      {Alignment.centerRight: Offset(boundRect.right, boundRect.height / 2)},
    ];
    if (data.anchorPointsModelMap?.anchorPointList.isEmpty ?? true) {
      return const AnchorPointModelMap(
        anchorPointList: [],
      );
    }

    var _tmpAnchorPointList = <AnchorPointModel>[];

    for (var anchor in data.anchorPointsModelMap!.anchorPointList) {
      for (var element in _anchorPointsMap) {
        if (element[anchor.alignment] != null &&
            path.contains(element[anchor.alignment]!)) {
          _tmpAnchorPointList.add(anchor.copyWith(
            anchorPointPosition: element[anchor.alignment]!,
            anchorPointPositionRelativeToParent:
                element[anchor.alignment]! + offset,
          ));
        }
      }
    }

    return data.anchorPointsModelMap!.copyWith(
      anchorPointList: _tmpAnchorPointList,
    );
  }

  void _setDimensionPoints() {
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
        return SizedBox(
          height: path.getBounds().height,
          width: path.getBounds().width,
          child: Stack(
            children: [
              Container(
                transform: Matrix4.translationValues(
                    offset?.dx ?? 0, offset?.dy ?? 0, 0),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    context.read<UnselectElementsBloc>().add(
                        UnselectElementsEvent(
                            unselect: !state.unselect, elementKey: elementKey));
                  },
                  child: Stack(
                    key: elementKey,
                    children: [
                      concreteBuild(context),
                      if (anchorPointsModelMap!.anchorPointList.isNotEmpty)
                        for (var anchorPoint
                            in anchorPointsModelMap!.anchorPointList)
                          Container(
                            transform: Matrix4.translationValues(
                                anchorPoint.anchorPointPosition.dx,
                                anchorPoint.anchorPointPosition.dy,
                                0),
                            child: ValueListenableBuilder<double>(
                              valueListenable: _showAnchorPointsValueNotifier,
                              builder: (context, opacity, _) {
                                return Opacity(
                                  opacity: opacity,
                                  child: anchorPoint.child,
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
                          Container(
                            transform: Matrix4.translationValues(
                                offset?.dx ?? 0, offset?.dy ?? 0, 0),
                            child: const DimensionPoints(),
                          ),
                    ],
                  ),
                ),
              ),
              Container(
                transform: Matrix4.translationValues(
                    (offset?.dx ?? 0) - 15, (offset?.dy ?? 0) - 15, 0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.grab,
                  opaque: false,
                  child: SizedBox(
                    height: path.getBounds().height + 30,
                    width: path.getBounds().width + 30,
                  ),
                  onEnter: (event) {
                    if (!state.unselect) return;
                    _showAnchorPointsValueNotifier.value = 1.0;
                  },
                  onExit: (event) {
                    _showAnchorPointsValueNotifier.value = 0.0;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget concreteBuild(BuildContext context);

  Widget buildChild(BuildContext context, bool small);

  AbstractFlowElement copyWith({
    FlowElementTypes? flowType,
    Offset? offset,
    Key? elementKey,
    Path? path,
    AnchorPointModelMap? anchorPointsModelMap,
  });
}
