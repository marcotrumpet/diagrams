import 'package:diagrams/flow_elements/abstract_custom_painter.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_event.dart';
import 'package:diagrams/flow_elements/bloc/resize_element/resize_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_event.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:diagrams/flow_elements/dimension_points/dimension_point.dart';
import 'package:diagrams/flow_elements/dimension_points/dimension_point_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum FlowElementTypes { rectangle, roundedRectangle, triangle, circle }

abstract class AbstractFlowElement {
  final FlowElementTypes flowType;
  final Offset? offset;
  final Key? elementKey;
  final Path path;
  AnchorPointModelMap? anchorPointsModelMap;
  DimensionPointModelMap? dimensionPointModelMap;
  final bool isSideMenu;

  AbstractFlowElement({
    required this.flowType,
    required this.path,
    this.elementKey,
    this.offset,
    this.anchorPointsModelMap = const AnchorPointModelMap(
      anchorPointList: [],
    ),
    this.dimensionPointModelMap = const DimensionPointModelMap(
      dimensionPointList: [],
    ),
    this.isSideMenu = false,
  }) {
    if (!isSideMenu &&
        (dimensionPointModelMap?.dimensionPointList.isEmpty ?? true)) {
      dimensionPointModelMap = setDimensionPoints(offset ?? Offset.zero, path);
    }
  }

  final _showAnchorPointsValueNotifier = ValueNotifier(0.0);

  bool get anchorPointsVisible => _showAnchorPointsValueNotifier.value == 1.0;

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

    return AnchorPointModelMap(
        anchorPointList: data.anchorPointsModelMap?.anchorPointList.map(
              (e) {
                return e.copyWith(
                  anchorPointPosition: _anchorPointsMap
                      .firstWhere(
                          (element) => element.keys.first == e.alignment)
                      .values
                      .first,
                  anchorPointPositionRelativeToParent: _anchorPointsMap
                          .firstWhere(
                              (element) => element.keys.first == e.alignment)
                          .values
                          .first +
                      offset,
                );
              },
            ).toList() ??
            []);
  }

  DimensionPointModelMap setDimensionPoints(Offset offset, Path path) {
    final boundRect = path.getBounds();
    var _dimensionPointsList = [
      {Alignment.topLeft: boundRect.topLeft},
      {Alignment.topCenter: boundRect.topCenter},
      {Alignment.topRight: boundRect.topRight},
      {Alignment.bottomLeft: boundRect.bottomLeft},
      {Alignment.bottomCenter: boundRect.bottomCenter},
      {Alignment.bottomRight: boundRect.bottomRight},
      {Alignment.centerLeft: Offset(boundRect.left, boundRect.height / 2)},
      {Alignment.centerRight: Offset(boundRect.right, boundRect.height / 2)},
    ];

    return DimensionPointModelMap(
        dimensionPointList: _dimensionPointsList.map(
      (e) {
        var key = UniqueKey();
        return DimensionPointModel(
          dimensionPointKey: key,
          alignment: e.keys.first,
          dimensionPointPosition: e.values.first,
          dimensionPointPositionRelativeToParent: e.values.first + offset,
          child: DimensionPoint(
            key: key,
            element: this,
            alignment: e.keys.first,
          ),
        );
      },
    ).toList());
  }

  DimensionPointModelMap updateDimensionPoints(Offset offset, Path path,
      {bool updateElementPosition = false}) {
    final boundRect = path.getBounds();
    var _dimensionPointsList = [
      {Alignment.topLeft: boundRect.topLeft},
      {Alignment.topCenter: boundRect.topCenter},
      {Alignment.topRight: boundRect.topRight},
      {Alignment.bottomLeft: boundRect.bottomLeft},
      {Alignment.bottomCenter: boundRect.bottomCenter},
      {Alignment.bottomRight: boundRect.bottomRight},
      {Alignment.centerLeft: Offset(boundRect.left, boundRect.height / 2)},
      {Alignment.centerRight: Offset(boundRect.right, boundRect.height / 2)},
    ];

    var el = updateElementPosition ? copyWith(offset: offset) : this;

    return DimensionPointModelMap(
        dimensionPointList: dimensionPointModelMap?.dimensionPointList.map(
              (e) {
                var _newDimensionPointKey =
                    updateElementPosition ? UniqueKey() : e.dimensionPointKey;
                var _dimensionPointPosition = _dimensionPointsList
                    .firstWhere((element) => element.keys.first == e.alignment)
                    .values
                    .first;
                var _dimensionPointPositionRelativeToParent =
                    _dimensionPointsList
                            .firstWhere(
                                (element) => element.keys.first == e.alignment)
                            .values
                            .first +
                        offset;
                return e.copyWith(
                  dimensionPointPosition: _dimensionPointPosition,
                  dimensionPointPositionRelativeToParent:
                      _dimensionPointPositionRelativeToParent,
                  child: DimensionPoint(
                    key: _newDimensionPointKey,
                    element: el,
                    alignment: e.alignment,
                  ),
                );
              },
            ).toList() ??
            []);
  }

  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(
          (offset?.dx ?? 0) - 5, (offset?.dy ?? 0) - 5, 0),
      child: BlocBuilder<UnselectElementsBloc, UnselectElementsState>(
        buildWhen: (previous, current) =>
            elementKey == current.elementKey || current.elementKey == null,
        builder: (context, unselectElementState) {
          return BlocConsumer<ResizeElementBloc, ResizeElementState>(
            listenWhen: (previous, current) {
              return current.maybeWhen(
                orElse: () => false,
                resized: (element) => element.elementKey == elementKey,
              );
            },
            listener: (context, resizeElementState) {
              resizeElementState.maybeWhen(
                resized: (element) {
                  context
                      .read<AddRemoveElementBloc>()
                      .add(ScaleElementEvent(elementToManipulate: element));
                },
                orElse: () => null,
              );
            },
            builder: (context, _) {
              var pathBounds = path.getBounds();
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  context.read<UnselectElementsBloc>().add(
                      UnselectElementsEvent(
                          unselect: !unselectElementState.unselect,
                          elementKey: elementKey));
                },
                child: Stack(
                  key: elementKey,
                  children: [
                    SizedBox(
                      width: pathBounds.width + 10,
                      height: pathBounds.height + 10,
                      // color: Colors.red,
                    ),
                    Positioned.fill(
                      child: Center(child: concreteBuild(context)),
                    ),
                    if (anchorPointsModelMap!.anchorPointList.isNotEmpty)
                      for (var anchorPoint
                          in anchorPointsModelMap!.anchorPointList)
                        AnchorPoint(
                          model: anchorPoint,
                          unselect: unselectElementState.unselect,
                          showAnchorPointsVN: _showAnchorPointsValueNotifier,
                        ),
                    if (dimensionPointModelMap != null &&
                        dimensionPointModelMap!.dimensionPointList.isNotEmpty &&
                        !unselectElementState.unselect)
                      Container(
                        transform: Matrix4.translationValues(5, 5, 0),
                        child: RepaintBoundary(
                          child: CustomPaint(
                            painter: DotLineCustomPainter(
                              path: path,
                              context: context,
                            ),
                          ),
                        ),
                      ),
                    if (dimensionPointModelMap != null &&
                        dimensionPointModelMap!.dimensionPointList.isNotEmpty &&
                        !unselectElementState.unselect)
                      for (var dimensionPoint
                          in dimensionPointModelMap!.dimensionPointList)
                        Container(
                          transform: Matrix4.translationValues(
                            dimensionPoint.dimensionPointPosition.dx,
                            dimensionPoint.dimensionPointPosition.dy,
                            0,
                          ),
                          child: dimensionPoint.child,
                        ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget concreteBuild(BuildContext context);

  Widget buildChild(BuildContext context);

  AbstractFlowElement copyWith({
    FlowElementTypes? flowType,
    Offset? offset,
    Key? elementKey,
    Path? path,
    AnchorPointModelMap? anchorPointsModelMap,
    DimensionPointModelMap? dimensionPointModelMap,
  });
}
