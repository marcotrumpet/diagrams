// heavily inspired by https://github.com/RafaelBarbosatec/a_star

import 'package:diagrams/common/grid_property_provider.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

class AStarAlgorithm {
  final Offset start;
  final Offset end;
  final _doneList = <Tile>[];
  final _waitList = <Tile>[];

  late List<List<Tile>> grid;
  late List<Rect> barriers;
  late double squareSide;

  AStarAlgorithm({
    required this.start,
    required this.end,
  }) {
    grid = GetIt.I<GridPropertyProvider>().grid;
    barriers = GetIt.I<GridPropertyProvider>().barriers;
    squareSide = GetIt.I<GridPropertyProvider>().secondarySquareSide;
  }

  /// Method that starts the search
  Iterable<Offset> findThePath({ValueChanged<List<Offset>>? doneList}) {
    _doneList.clear();
    _waitList.clear();

    if (barriers.firstWhereOrNull((element) => element.contains(end)) != null) {
      return [];
    }

    var startTile = GetIt.I<GridPropertyProvider>().findTileInGrid(start);
    var endTile = GetIt.I<GridPropertyProvider>().findTileInGrid(end);

    if (startTile == null || endTile == null) return [];

    Tile? winner = _getTileWinner(
      startTile,
      endTile,
    );

    List<Offset> path = [end];

    if (winner != null) {
      Tile? tileAux = winner.parent;
      for (int i = 0; i < winner.g - 1; i++) {
        if (tileAux != null) {
          path.add(tileAux.position);
          tileAux = tileAux.parent;
        }
      }
    }
    path.add(start);
    doneList?.call(_doneList.map((e) => e.position).toList());

    return path.reversed;
  }

  /// Method recursive that execute the A* algorithm
  Tile? _getTileWinner(Tile current, Tile end) {
    if (current == end) {
      return current;
    }
    _waitList.remove(current);

    for (var element in current.neighbors) {
      _analiseDistance(element, end, parent: current);
    }

    _doneList.add(current);

    _waitList.addAll(current.neighbors.where((element) {
      return !_doneList.contains(element);
    }));

    _waitList.sort((a, b) => a.f.compareTo(b.f));

    for (final element in _waitList.toList()) {
      if (!_doneList.contains(element)) {
        final result = _getTileWinner(element, end);
        if (result != null) {
          return result;
        }
      }
    }

    return null;
  }

  /// Calculates the distance g and h
  void _analiseDistance(Tile current, Tile end, {Tile? parent}) {
    if (current.parent == null) {
      current.parent = parent;
      current.g = (current.parent?.g ?? 0) + 1;

      current.h = _distance(current, end);
    }
  }

  /// Calculates the distance between two tiles.
  int _distance(Tile tile1, Tile tile2) {
    int distX = (tile1.position.dx.toInt() - tile2.position.dx.toInt()).abs();
    int distY = (tile1.position.dy.toInt() - tile2.position.dy.toInt()).abs();
    return distX + distY;
  }

  /// Resume path
  /// Example:
  /// [(1,2),(1,3),(1,4),(1,5)] = [(1,2),(1,5)]
  // static List<Offset> resumePath(Iterable<Offset> path) {
  //   List<Offset> newPath = _resumeDirection(path, TypeResumeDirection.axisX);
  //   newPath = _resumeDirection(newPath, TypeResumeDirection.axisY);
  //   newPath = _resumeDirection(newPath, TypeResumeDirection.bottomLeft);
  //   newPath = _resumeDirection(newPath, TypeResumeDirection.bottomRight);
  //   newPath = _resumeDirection(newPath, TypeResumeDirection.topLeft);
  //   newPath = _resumeDirection(newPath, TypeResumeDirection.topRight);
  //   return newPath;
  // }

//   static List<Offset> _resumeDirection(
//     Iterable<Offset> path,
//     TypeResumeDirection type,
//   ) {
//     List<Offset> newPath = [];
//     List<List<Offset>> listOffset = [];
//     int indexList = -1;
//     double currentX = 0;
//     double currentY = 0;

//     for (var element in path) {
//       final dxDiagonal = element.dx.floor();
//       final dyDiagonal = element.dy.floor();

//       switch (type) {
//         case TypeResumeDirection.axisX:
//           if (element.dx == currentX && listOffset.isNotEmpty) {
//             listOffset[indexList].add(element);
//           } else {
//             listOffset.add([element]);
//             indexList++;
//           }
//           break;
//         case TypeResumeDirection.axisY:
//           if (element.dy == currentY && listOffset.isNotEmpty) {
//             listOffset[indexList].add(element);
//           } else {
//             listOffset.add([element]);
//             indexList++;
//           }
//           break;
//         case TypeResumeDirection.topLeft:
//           final nextDxDiagonal = (currentX - 1).floor();
//           final nextDyDiagonal = (currentY - 1).floor();
//           if (dxDiagonal == nextDxDiagonal &&
//               dyDiagonal == nextDyDiagonal &&
//               listOffset.isNotEmpty) {
//             listOffset[indexList].add(element);
//           } else {
//             listOffset.add([element]);
//             indexList++;
//           }
//           break;
//         case TypeResumeDirection.bottomLeft:
//           final nextDxDiagonal = (currentX - 1).floor();
//           final nextDyDiagonal = (currentY + 1).floor();
//           if (dxDiagonal == nextDxDiagonal &&
//               dyDiagonal == nextDyDiagonal &&
//               listOffset.isNotEmpty) {
//             listOffset[indexList].add(element);
//           } else {
//             listOffset.add([element]);
//             indexList++;
//           }
//           break;
//         case TypeResumeDirection.topRight:
//           final nextDxDiagonal = (currentX + 1).floor();
//           final nextDyDiagonal = (currentY - 1).floor();
//           if (dxDiagonal == nextDxDiagonal &&
//               dyDiagonal == nextDyDiagonal &&
//               listOffset.isNotEmpty) {
//             listOffset[indexList].add(element);
//           } else {
//             listOffset.add([element]);
//             indexList++;
//           }
//           break;
//         case TypeResumeDirection.bottomRight:
//           final nextDxDiagonal = (currentX + 1).floor();
//           final nextDyDiagonal = (currentY + 1).floor();
//           if (dxDiagonal == nextDxDiagonal &&
//               dyDiagonal == nextDyDiagonal &&
//               listOffset.isNotEmpty) {
//             listOffset[indexList].add(element);
//           } else {
//             listOffset.add([element]);
//             indexList++;
//           }
//           break;
//       }

//       currentX = element.dx;
//       currentY = element.dy;
//     }

//     for (var element in listOffset) {
//       if (element.length > 1) {
//         newPath.add(element.first);
//         newPath.add(element.last);
//       } else {
//         newPath.add(element.first);
//       }
//     }

//     return newPath;
//   }
}

/// Class used to represent each cell
class Tile {
  final Offset position;
  Tile? parent;
  final List<Tile> neighbors;
  final bool isBarrier;
  int g = 0;
  int h = 0;

  int get f => g + h;

  Tile(this.position, this.neighbors, {this.parent, this.isBarrier = false});
}

enum TypeResumeDirection {
  axisX,
  axisY,
  topLeft,
  bottomLeft,
  topRight,
  bottomRight,
}
