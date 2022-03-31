import 'package:flutter/material.dart';

/// Class used to represent each cell
class TileModel {
  final Offset position;
  TileModel? parent;
  final List<TileModel> neighbors;
  final bool isBarrier;
  int g = 0;
  int h = 0;

  int get f => g + h;

  TileModel(
    this.position,
    this.neighbors, {
    this.parent,
    this.isBarrier = false,
  });
}
