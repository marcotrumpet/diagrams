import 'package:diagrams/common/update_barrier_model.dart';
import 'package:diagrams/helpers/a_star/barrier_model.dart';
import 'package:diagrams/helpers/a_star/tile_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class GridPropertyProvider {
  final gridKey = GlobalKey();

  var mainSquareSide = 60.0;
  var secondarySquareSide = 15.0;

  var mainStrokeWidth = 1.0;
  var secondaryStrokeWith = 0.5;

  var grid = <List<TileModel>>[];
  var barriers = <BarrierModel>[];
  var totalEndPointsToExclude = <Offset>[];

  List<Rect> barrierModelToList() {
    return barriers.map((e) => e.rect).toList();
  }

  void updateGridBarriers(UpdateBarrierModel updateBarrierModel) {
    if (updateBarrierModel.endPointsToExclude?.isNotEmpty ?? false) {
      totalEndPointsToExclude.clear();
      totalEndPointsToExclude
          .addAll(updateBarrierModel.endPointsToExclude ?? []);
    } else {
      totalEndPointsToExclude
          .addAll(updateBarrierModel.endPointsToExclude ?? []);
    }
    barriers.removeWhere((element) =>
        element.abstractElementKey ==
        updateBarrierModel.abstractFlowElement.elementKey);

    var newRect = updateBarrierModel.abstractFlowElement.path
        .getBounds()
        .translate(updateBarrierModel.abstractFlowElement.offset!.dx,
            updateBarrierModel.abstractFlowElement.offset!.dy)
        .inflate(secondarySquareSide);

    var barrierModel = BarrierModel(
      abstractElementKey: updateBarrierModel.abstractFlowElement.elementKey!,
      positions: [], // delete it
      rect: newRect,
    );
    barriers.add(barrierModel);

    createGrid(endPointsToExclude: totalEndPointsToExclude);
    addNeighbors();
  }

  void createGrid({List<Offset>? endPointsToExclude}) {
    grid = [];
    var gridPainted = gridKey.currentContext?.findRenderObject() as RenderBox;
    List.generate((gridPainted.size.width ~/ secondarySquareSide), (x) {
      List<TileModel> rowList = [];
      List.generate((gridPainted.size.height ~/ secondarySquareSide), (y) {
        final offset = Offset(x.toDouble() * secondarySquareSide,
            y.toDouble() * secondarySquareSide);
        bool? isBarrier;
        if (endPointsToExclude?.contains(offset) ?? false) {
          isBarrier = false;
        } else {
          barrierModelToList().forEach((element) {
            var endpointInRect = endPointsToExclude?.firstWhereOrNull((e) {
              return element.contains(e);
            });
            if (endpointInRect != null) {
              isBarrier = false;
            }
            isBarrier = element.contains(offset);
          });
        }
        rowList.add(
          TileModel(
            offset,
            [],
            isBarrier: isBarrier ?? false,
          ),
        );
      });
      grid.add(rowList);
    });
  }

  TileModel? findTileInGrid(Offset offset) {
    TileModel? tile;

    for (var column in grid) {
      for (var cel in column) {
        if (cel.position == offset) {
          tile = cel;
        }
      }
    }

    return tile;
  }

  /// Adds neighbors to cells
  void addNeighbors({bool withDiagonal = false}) {
    for (var e in grid) {
      for (var element in e) {
        var x = element.position.dx;
        var y = element.position.dy;

        /// adds in top
        if (y > 0) {
          final t = findTileInGrid(Offset(x, y - secondarySquareSide));
          if (t == null) return;
          if (!t.isBarrier) {
            element.neighbors.add(t);
          }
        }

        /// adds in bottom
        if (y <
            ((grid.first.length * secondarySquareSide) - secondarySquareSide)) {
          final t = findTileInGrid(Offset(x, y + secondarySquareSide));
          if (t == null) return;
          if (!t.isBarrier) {
            element.neighbors.add(t);
          }
        }

        /// adds in left
        if (x > 0) {
          final t = findTileInGrid(Offset(x - secondarySquareSide, y));
          if (t == null) return;
          if (!t.isBarrier) {
            element.neighbors.add(t);
          }
        }

        /// adds in right
        if (x < ((grid.length * secondarySquareSide) - secondarySquareSide)) {
          final t = findTileInGrid(Offset(x + secondarySquareSide, y));
          if (t == null) return;
          if (!t.isBarrier) {
            element.neighbors.add(t);
          }
        }

        // if (withDiagonal) {
        //   /// adds in top-left
        //   if (y > 0 && x > 0) {
        //     final top = findTileInGrid(Offset(x, y - secondarySquareSide));
        //     final left = findTileInGrid(Offset(x - secondarySquareSide, y));
        //     final t = findTileInGrid(
        //         Offset(x - secondarySquareSide, y - secondarySquareSide));
        //     if (t == null || top == null || left == null) return;
        //     if (!t.isBarrier && !left.isBarrier && !top.isBarrier) {
        //       element.neighbors.add(t);
        //     }
        //   }

        //   /// adds in top-right
        //   if (y > 0 &&
        //       x < ((grid.length * secondarySquareSide) - secondarySquareSide)) {
        //     final top = findTileInGrid(Offset(x, y - secondarySquareSide));
        //     final right = findTileInGrid(Offset(x + secondarySquareSide, y));
        //     final t = findTileInGrid(
        //         Offset(x + secondarySquareSide, y - secondarySquareSide));
        //     if (t == null || top == null || right == null) return;
        //     if (!t.isBarrier && !top.isBarrier && !right.isBarrier) {
        //       element.neighbors.add(t);
        //     }
        //   }

        //   /// adds in bottom-left
        //   if (x > 0 &&
        //       y <
        //           ((grid.first.length * secondarySquareSide) -
        //               secondarySquareSide)) {
        //     final bottom = findTileInGrid(Offset(x, y + secondarySquareSide));
        //     final left = findTileInGrid(Offset(x - secondarySquareSide, y));
        //     final t = findTileInGrid(
        //         Offset(x - secondarySquareSide, y + secondarySquareSide));
        //     if (t == null || bottom == null || left == null) return;
        //     if (!t.isBarrier && !bottom.isBarrier && !left.isBarrier) {
        //       element.neighbors.add(t);
        //     }
        //   }

        //   /// adds in bottom-right
        //   if (x < ((grid.length * secondarySquareSide) - secondarySquareSide) &&
        //       y <
        //           ((grid.first.length * secondarySquareSide) -
        //               secondarySquareSide)) {
        //     final bottom = findTileInGrid(Offset(x, y + secondarySquareSide));
        //     final right = findTileInGrid(Offset(x + secondarySquareSide, y));
        //     final t = findTileInGrid(
        //         Offset(x + secondarySquareSide, y + secondarySquareSide));
        //     if (t == null || bottom == null || right == null) return;
        //     if (!t.isBarrier && !bottom.isBarrier && !right.isBarrier) {
        //       element.neighbors.add(t);
        //     }
        //   }
        // }
      }
    }
  }
}
