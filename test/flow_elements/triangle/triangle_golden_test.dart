import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:diagrams/flow_elements/triangle/triangle_flow_element.dart';
import 'package:diagrams/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../golden_test.dart';

void triangleGoldenTest() {
  setUp(() {
    appTheme = AppTheme();
    addRemoveElementBloc = AddRemoveElementBloc([]);
    unselectElementsBloc = UnselectElementsBloc(
      const UnselectElementsState(unselect: false),
    );
    drawArrowsBloc = DrawArrowsBloc(
      const DrawArrowsState(),
    );
  });
  testGoldens('test triangleFlowElement', (tester) async {
    await tester.pumpWidgetBuilder(mainTestableApp());

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
}
