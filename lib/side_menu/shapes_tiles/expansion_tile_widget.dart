import 'package:diagrams/side_menu/shapes_list.dart';
import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final basicShapes = basicShapesList(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: basicShapes
            .map(
              (e) => e,
            )
            .toList(),
      ),
    );
  }
}
