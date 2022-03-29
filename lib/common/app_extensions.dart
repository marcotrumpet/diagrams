import 'dart:ui';

import 'package:diagrams/common/grid_property_provider.dart';
import 'package:get_it/get_it.dart';

extension NormalizePointToGrid on Offset {
  Offset normalizedPointToGrid() {
    var newPoint = Offset(
        (dx - dx % GetIt.I<GridPropertyProvider>().secondarySquareSide),
        (dy - dy % GetIt.I<GridPropertyProvider>().secondarySquareSide));
    return newPoint;
  }

  Offset normalizedPointToClosestGrid() {
    var newPoint = Offset(
      dx.roundBaseFifteen(),
      dy.roundBaseFifteen(),
    );

    return newPoint;
  }
}

extension RoundToGrid on double {
  double roundBaseFifteen() {
    var lowest = this - (this % 15);
    var highest = (this + 15) - ((this + 15) % 15);

    return (this - lowest).abs() <= (this - highest).abs() ? lowest : highest;
  }
}
