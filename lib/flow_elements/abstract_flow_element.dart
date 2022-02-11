import 'dart:ui';

import 'package:flutter/material.dart';

typedef AbtractFlowElementBuilder<Widget> = Widget Function(
    BuildContext context, Widget child);

abstract class AbstractFlowElement {
  final FlowTypes flowType;
  final Offset? offset;
  final Key? elementKey;
  final Path path;

  AbstractFlowElement({
    required this.flowType,
    required this.path,
    this.elementKey,
    this.offset,
  }) {
    calculateAnchorPoint();
  }

  final _valueNotifier = ValueNotifier(0.0);
  final _offsetList = <Offset?>{};

  void calculateAnchorPoint() {
    // var intersection = Path.combine(
    //     PathOperation.intersect, path, Path()..addRect(path.getBounds()));
    // print(intersection);
    // intersection.computeMetrics().forEach((element) {
    //   if (element.length <= 0) return;
    //   Tangent? pos = element.getTangentForOffset(0);
    //   _offsetList.add(pos?.position);
    // });

    final boundRect = path.getBounds();
    _offsetList.addAll([
      if (path.contains(boundRect.topLeft)) boundRect.topLeft,
      if (path.contains(boundRect.topCenter)) boundRect.topCenter,
      if (path.contains(boundRect.topRight)) boundRect.topRight,
      if (path.contains(boundRect.bottomLeft)) boundRect.bottomLeft,
      if (path.contains(boundRect.bottomCenter)) boundRect.bottomCenter,
      if (path.contains(boundRect.bottomRight)) boundRect.bottomRight,
      if (path.contains(Offset(boundRect.left, boundRect.height / 2)))
        Offset(boundRect.left, boundRect.height / 2),
      if (path.contains(Offset(boundRect.right, boundRect.height / 2)))
        Offset(boundRect.right, boundRect.height / 2),
    ]);

    // double dashWidth = 10.0;
    // double dashSpace = 20.0;
    // debugPrint(findDivisors(540).toString());
    // double distance = 0.0;

    // _offsetList.addAll([
    // path.getBounds().topLeft,
    // path.getBounds().topCenter,
    // path.getBounds().topRight,
    // path.getBounds().bottomLeft,
    // path.getBounds().bottomCenter,
    // path.getBounds().bottomRight,
    //   Offset(path.getBounds().left, path.getBounds().top),
    //   Offset(path.getBounds().left, path.getBounds().height / 2),
    //   Offset(path.getBounds().left, path.getBounds().height),
    //   Offset(path.getBounds().right, path.getBounds().top),
    //   Offset(path.getBounds().right, path.getBounds().height / 2),
    //   Offset(path.getBounds().right, path.getBounds().height),
    // ]);

    // for (PathMetric pathMetric in path.computeMetrics()) {
    //   final dashWidth = findDivisors(pathMetric.length.toInt()) / 3;
    //   final dashSpace = findDivisors(pathMetric.length.toInt()) / 3 * 2;
    //   while (distance < pathMetric.length) {
    //     _offsetList.add(calculate(distance / pathMetric.length));
    //     distance += dashWidth;
    //     distance += dashSpace;
    //   }
    // }
  }

  Offset? calculate(value) {
    PathMetrics pathMetrics = path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos?.position;
  }

  int findDivisors(number) {
    List<int?> divisors = [];
    for (var i = 1; i < number; i++) {
      if (number % i == 0) {
        divisors.add(i);
      }
    }
    if (divisors.isEmpty) return 30;
    divisors.sort();
    return divisors[divisors.length ~/ 2] ?? 30;
  }

  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Transform.translate(
        key: elementKey,
        offset: offset ?? const Offset(0, 0),
        child: SizedBox(
          height: path.getBounds().height + 10,
          width: path.getBounds().width + 10,
          child: Center(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.grab,
                    onEnter: (event) {
                      _valueNotifier.value = 1.0;
                    },
                    onExit: (event) {
                      _valueNotifier.value = 0;
                    },
                    child: concreteBuild(context),
                  ),
                ),
                if (_offsetList.isNotEmpty)
                  for (var offset in _offsetList)
                    Positioned(
                      right: offset?.dx,
                      top: offset?.dy,
                      child: ValueListenableBuilder<double>(
                        valueListenable: _valueNotifier,
                        builder: (context, opacity, _) {
                          return Opacity(
                            opacity: opacity,
                            child: Transform.translate(
                              offset: const Offset(-5, -5),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .toggleableActiveColor
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10)),
                                width: 10,
                                height: 10,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget concreteBuild(BuildContext context);

  Widget buildSideMenu(BuildContext context);

  AbstractFlowElement copyWith({
    FlowTypes? flowType,
    Offset? offset,
    Key? elementKey,
    Path? path,
  });
}

enum FlowTypes { rectangle, roundedRectangle, triangle, circle }
