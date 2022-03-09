import 'package:diagrams/flow_elements/triangle/triangle_flow_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../golden_test.dart';

void triangleGoldenTest() {
  group('triangleGoldenTest', () {
    testGoldens('test triangleFlowElement', (tester) async {
      await tester.pumpWidgetBuilder(
        mainTestableApp(),
        wrapper: materialAppWrapper(
          platform: TargetPlatform.macOS,
        ),
      );

      await tester.drag(
        find.byType(Draggable<TriangleFlowElement>),
        const Offset(250, 250),
      );

      await screenMatchesGolden(tester, 'triangle/golden_test');

      await tester.tap(
        find.descendant(
          of: find.byType(Scaffold),
          matching: find.byKey(
            const Key('unselect_flow_elements'),
          ),
        ),
      );

      await screenMatchesGolden(tester, 'triangle/unselected_golden_test');
    });
  });
}
