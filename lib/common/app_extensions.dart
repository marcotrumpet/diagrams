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

  Offset normalizedStartPointToGrid() {
    var newPoint = Offset(
      dx.roundBaseFifteen(),
      dy.roundBaseFifteen(),
    );

    return newPoint;
  }
}

extension RoundToGrid on double {
  double roundBaseFifteen() {
    var lowest =
        this - (this % GetIt.I<GridPropertyProvider>().secondarySquareSide);
    var highest = (this + GetIt.I<GridPropertyProvider>().secondarySquareSide) -
        ((this + GetIt.I<GridPropertyProvider>().secondarySquareSide) %
            GetIt.I<GridPropertyProvider>().secondarySquareSide);

    return (this - lowest).abs() <= (this - highest).abs() ? lowest : highest;
  }
}
