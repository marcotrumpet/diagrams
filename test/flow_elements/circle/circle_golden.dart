import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:diagrams/flow_elements/circle/circle_flow_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../golden_test.dart';

void circleGoldenTest() {
  setUp(() {
    addRemoveElementBloc = AddRemoveElementBloc([]);
    unselectElementsBloc = UnselectElementsBloc(
      const UnselectElementsState(
        selectedElementList: SelectedElementList(),
      ),
    );
    drawArrowsBloc = DrawArrowsBloc(
      const DrawArrowsState(),
    );
  });
  testGoldens('test circleFlowElement', (tester) async {
    await tester.pumpWidgetBuilder(mainTestableApp());

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
}
