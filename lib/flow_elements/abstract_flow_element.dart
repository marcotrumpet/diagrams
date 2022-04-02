import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/add_remove_element/add_remove_element_event.dart';
import 'package:diagrams/bloc/resize_element/resize_element_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_event.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:diagrams/flow_elements/abstract_custom_painter.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point.dart';
import 'package:diagrams/flow_elements/anchor_points/anchor_point_model.dart';
import 'package:diagrams/flow_elements/dimension_points/dimension_point.dart';
import 'package:diagrams/flow_elements/dimension_points/dimension_point_model.dart';
import 'package:diagrams/main_canvas/canvas_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
        var model = AnchorPointModel(
          anchorPointKey: key,
          anchorPointPosition: e.values.first,
          anchorPointPositionRelativeToParent: e.values.first + offset,
          alignment: e.keys.first,
          child: Container(),
        );
        return model.copyWith(
          child: AnchorPoint(
            key: key,
            model: model,
            showAnchorPointsVN: _showAnchorPointsValueNotifier,
          ),
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
                var model = e.copyWith(
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
                return model.copyWith(
                  child: AnchorPoint(
                    key: e.anchorPointKey,
                    model: model,
                    showAnchorPointsVN: _showAnchorPointsValueNotifier,
                  ),
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
            abstractFlowElementKey: elementKey!,
            alignment: e.keys.first,
          ),
        );
      },
    ).toList());
  }

  DimensionPointModelMap updateDimensionPoints(Offset offset, Path path) {
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
      dimensionPointList: _refreshDimensionPointListInfo(
        _dimensionPointsList,
        offset,
      ),
    );
  }

  List<DimensionPointModel> _refreshDimensionPointListInfo(
      List<Map<Alignment, Offset>> _dimensionPointsList, Offset offset) {
    return dimensionPointModelMap?.dimensionPointList.map(
          (e) {
            var _dimensionPointPosition = _dimensionPointsList
                .firstWhere((element) => element.keys.first == e.alignment)
                .values
                .first;
            var _dimensionPointPositionRelativeToParent = _dimensionPointsList
                    .firstWhere((element) => element.keys.first == e.alignment)
                    .values
                    .first +
                offset;
            return e.copyWith(
              dimensionPointPosition: _dimensionPointPosition,
              dimensionPointPositionRelativeToParent:
                  _dimensionPointPositionRelativeToParent,
              child: DimensionPoint(
                key: e.dimensionPointKey,
                abstractFlowElementKey: elementKey!,
                alignment: e.alignment,
              ),
            );
          },
        ).toList() ??
        <DimensionPointModel>[];
  }

  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(
          (offset?.dx ?? 0) - 5, (offset?.dy ?? 0) - 5, 0),
      child: BlocBuilder<UnselectElementsBloc, UnselectElementsState>(
        buildWhen: (previous, current) {
          return (current.selectedElementList.selectedElements
                  .firstWhereOrNull((e) {
                return e.elementKey == elementKey;
              }) !=
              null);
        },
        builder: (context, unselectElementState) {
          var selectedElement = unselectElementState
              .selectedElementList.selectedElements
              .firstWhereOrNull((e) {
            return e.elementKey == elementKey;
          });
          return BlocConsumer<ResizeElementBloc, ResizeElementState>(
            listenWhen: (previous, current) {
              return current.maybeWhen(
                orElse: () => false,
                resizing: (element) => element.elementKey == elementKey,
                resizeEnd: (element) => element.elementKey == elementKey,
              );
            },
            listener: (context, resizeElementState) {
              resizeElementState.maybeWhen(
                resizing: (element) {
                  context
                      .read<AddRemoveElementBloc>()
                      .add(ScaleElementEvent(elementToManipulate: element));
                },
                resizeEnd: (element) {
                  handleFlowElements(
                    context: context,
                    element: this,
                    drawNewElement: false,
                    offset: offset!,
                  );
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
                          selected: !(selectedElement?.selected ?? false),
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
                    if (anchorPointsModelMap!.anchorPointList.isNotEmpty &&
                        !(selectedElement?.selected ?? false))
                      for (var anchorPoint
                          in anchorPointsModelMap!.anchorPointList)
                        anchorPoint.child,
                    if (dimensionPointModelMap != null &&
                        dimensionPointModelMap!.dimensionPointList.isNotEmpty &&
                        (selectedElement?.selected ?? false))
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
                        (selectedElement?.selected ?? false))
                      for (var dimensionPoint
                          in dimensionPointModelMap!.dimensionPointList)
                        Container(
                          transform: Matrix4.translationValues(
                            dimensionPoint.dimensionPointPosition.dx,
                            dimensionPoint.dimensionPointPosition.dy,
                            0,
                          ),
                          child: Container(child: dimensionPoint.child),
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AbstractFlowElement &&
          flowType == other.flowType &&
          offset == other.offset &&
          elementKey == other.elementKey &&
          path == other.path &&
          anchorPointsModelMap == other.anchorPointsModelMap &&
          dimensionPointModelMap == other.dimensionPointModelMap);

  @override
  int get hashCode => elementKey.hashCode ^ flowType.hashCode;
}
