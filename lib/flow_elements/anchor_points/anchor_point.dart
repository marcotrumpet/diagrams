import 'package:flutter/material.dart';

class AnchorPoint extends StatelessWidget {
  const AnchorPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(-20, -10, 0),
      width: 20,
      height: 20,
      child: Draggable(
        feedback: Container(
          width: 20,
          height: 20,
          color: Colors.white,
        ),
        child: Icon(
          Icons.cancel_outlined,
          color: Theme.of(context).toggleableActiveColor.withOpacity(0.5),
          size: 20,
        ),
      ),
    );
  }
}
