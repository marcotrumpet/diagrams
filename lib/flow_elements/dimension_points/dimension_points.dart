import 'package:flutter/material.dart';

class DimensionPoints extends StatelessWidget {
  const DimensionPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(-5, -5, 0),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: Theme.of(context).toggleableActiveColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
