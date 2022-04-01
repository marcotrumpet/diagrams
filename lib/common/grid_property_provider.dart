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
  List<TileModel> sorted = [];
  var barriers = <BarrierModel>[];
  var totalEndPointsToExclude = <Offset>[];

  List<Rect> barrierModelToList() {
    return barriers.map((e) => e.rect).toList();
  }

  void updateGridBarriers(UpdateBarrierModel updateBarrierModel) {
    if (updateBarrierModel.endPointsToExclude?.isNotEmpty ?? false) {
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
      rect: newRect,
    );
    barriers.add(barrierModel);

    createGrid(endPointsToExclude: totalEndPointsToExclude);
    addNeighbors();
  }

  void createGrid({List<Offset>? endPointsToExclude}) {
    grid = [];
    sorted = [];
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
    sorted = grid.flattened.toList();
    sorted.sort((a, b) {
      if (a.position.dx.compareTo(b.position.dx) == 0) {
        return a.position.dy.compareTo(b.position.dy);
      }
      return a.position.dx.compareTo(b.position.dx);
    });
  }

  TileModel? findTileInGrid(Offset offset) {
    TileModel? tile;

    tile = binarySearch(sorted, offset);
    return tile;
  }

  TileModel? binarySearch(List<TileModel> arr, Offset userValue) {
    var min = 0, max = sorted.length - 1;
    while (max >= min) {
      // If the element is present at the middle
      int mid = ((max + min) / 2).floor();
      if (userValue == arr[mid].position) {
        return arr[mid];
      }
      // If dx match
      else if (userValue.dx == arr[mid].position.dx) {
        // Do same logic for dy
        if (userValue.dy > arr[mid].position.dy) {
          min = mid + 1;
        } else {
          max = mid - 1;
        }
      }
      // If element.dx is bigger than mid.dx, then
      // it can only be present in right subarray
      else if (userValue.dx > arr[mid].position.dx) {
        min = mid + 1;
      }
      // Else the element can only be present
      // in left subarray
      else {
        max = mid - 1;
      }
    }
    return null;
  }

  void _updateNeighbors(TileModel element) {
    var x = element.position.dx;
    var y = element.position.dy;

    element.neighbors.clear();

    /// adds in top
    if (y > 0) {
      final t = findTileInGrid(Offset(x, y - secondarySquareSide));
      if (t == null) return;
      if (!t.isBarrier) {
        element.neighbors.add(t);
      }
    }

    /// adds in bottom
    if (y < ((grid.first.length * secondarySquareSide) - secondarySquareSide)) {
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

    return;
  }

  /// Adds neighbors to cells
  void addNeighbors({bool withDiagonal = false}) {
    for (var e in grid) {
      for (var element in e) {
        _updateNeighbors(element);
      }
    }
  }
}
