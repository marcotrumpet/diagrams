import 'package:flutter/material.dart';

class AnchorPoint extends StatefulWidget {
  const AnchorPoint({Key? key}) : super(key: key);

  @override
  State<AnchorPoint> createState() => _AnchorPointState();
}

class _AnchorPointState extends State<AnchorPoint> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.cancel_outlined,
      color: Theme.of(context).disabledColor.withOpacity(0.5),
      size: 20,
    );
  }
}
