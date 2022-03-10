import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_event.dart';
import 'package:diagrams/flow_elements/bloc/arrows/arrow_model.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/flow_elements/rectangle/rectangle_flow_element.dart';
import 'package:diagrams/flow_elements/rounded_rectangle/rounded_rectangle_flow_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../golden_test.dart';

typedef SetupCanvas = Future<void> Function(WidgetTester tester);

late SetupCanvas setupBasicCanvas;
void arrowGoldenTest() {
  setUp(() {
    setupBasicCanvas = (tester) async {
      await tester.pumpWidgetBuilder(mainTestableApp());

      await tester.drag(
        find.byType(Draggable<RectangleFlowElement>),
        const Offset(150, 50),
      );

      await tester.drag(
        find.byType(Draggable<RoundedRectangleFlowElement>),
        const Offset(400, 250),
      );

      await tester.tap(
        find.descendant(
          of: find.byType(Scaffold),
          matching: find.byKey(
            const Key('unselect_flow_elements'),
          ),
        ),
      );

      var anchorStart = addRemoveElementBloc
          .elementsList.first.anchorPointsModelMap!.anchorPointList
          .firstWhere((element) => element.alignment == Alignment.bottomRight);

      var anchorEnd = addRemoveElementBloc
          .elementsList.last.anchorPointsModelMap!.anchorPointList
          .firstWhere((element) => element.alignment == Alignment.centerLeft);

      var arrowModel = ArrowModel(
        startPoint: anchorStart.anchorPointPositionRelativeToParent,
        startPointKey: anchorStart.anchorPointKey,
        endPoint: anchorEnd.anchorPointPositionRelativeToParent,
        endPointKey: anchorEnd.anchorPointKey,
        endElement: addRemoveElementBloc.elementsList.last,
        startElement: addRemoveElementBloc.elementsList.first,
        // updateAStarPath: true,
        arrowKey: const Key('arrowKey'),
      );

      addRemoveElementBloc.add(
        AddStartingPointToAnchorElementEvent(
          elementToManipulate: addRemoveElementBloc.elementsList.first,
          arrowModelLinkedToElement: arrowModel,
        ),
      );

      addRemoveElementBloc.add(
        AddEndingPointToAnchorElementEvent(
          elementToManipulate: addRemoveElementBloc.elementsList.last,
          arrowModelLinkedToElement: arrowModel,
        ),
      );

      drawArrowsBloc.add(DrawArrowsAStarEvent(
        arrowModel: arrowModel.copyWith(updateAStarPath: true),
      ));
    };
  });
  testGoldens('draw A* arrow', (tester) async {
    await setupBasicCanvas(tester);

    await screenMatchesGolden(tester, 'arrow/rect_to_rrect_arrow_golden_test');
  });

  // testGoldens('move start element and redraw arrow', (tester) async {
  //   await setupBasicCanvas(tester);

  //   await screenMatchesGolden(tester, 'arrow/move_start_element_golden_test');
  // });
}
