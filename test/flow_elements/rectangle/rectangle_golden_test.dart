import 'package:diagrams/flow_elements/rectangle/rectangle_flow_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../golden_test.dart';

void rectangleGoldenTest() {
  testGoldens('test RectangleFlowElement', (tester) async {
    await tester.pumpWidgetBuilder(mainTestableApp());

    await tester.drag(
      find.byType(Draggable<RectangleFlowElement>),
      const Offset(250, 250),
    );

    await screenMatchesGolden(tester, 'rectangle/golden_test');

    await tester.tap(
      find.descendant(
        of: find.byType(Scaffold),
        matching: find.byKey(
          const Key('unselect_flow_elements'),
        ),
      ),
    );

    await screenMatchesGolden(tester, 'rectangle/unselected_golden_test');
  });
}
