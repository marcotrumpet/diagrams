import 'package:diagrams/flow_elements/circle/circle_flow_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../golden_test.dart';

void circleGoldenTest() {
  group('circleGoldenTest', () {
    testGoldens('test circleFlowElement', (tester) async {
      await tester.pumpWidgetBuilder(
        mainTestableApp(),
        wrapper: materialAppWrapper(
          platform: TargetPlatform.macOS,
        ),
      );

      await tester.drag(
        find.byType(Draggable<CircleFlowElement>),
        const Offset(250, 250),
      );

      await screenMatchesGolden(tester, 'circle/golden_test');

      await tester.tap(
        find.descendant(
          of: find.byType(Scaffold),
          matching: find.byKey(
            const Key('unselect_flow_elements'),
          ),
        ),
      );

      await screenMatchesGolden(tester, 'circle/unselected_golden_test');
    });
  });
}
