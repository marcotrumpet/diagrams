import 'package:diagrams/flow_elements/rounded_rectangle/rounded_rectangle_flow_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../golden_test.dart';

void roundedRectangleGoldenTest() {
  group('roundedRectangleGoldenTest', () {
    testGoldens('test roundedRectangleFlowElement', (tester) async {
      await tester.pumpWidgetBuilder(
        mainTestableApp(),
        wrapper: materialAppWrapper(
          platform: TargetPlatform.macOS,
        ),
      );

      await tester.drag(
        find.byType(Draggable<RoundedRectangleFlowElement>),
        const Offset(250, 250),
      );

      await screenMatchesGolden(tester, 'rounded_rectangle/golden_test');

      await tester.tap(
        find.descendant(
          of: find.byType(Scaffold),
          matching: find.byKey(
            const Key('unselect_flow_elements'),
          ),
        ),
      );

      await screenMatchesGolden(
          tester, 'rounded_rectangle/unselected_golden_test');
    });
  });
}
