import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/bloc/handle_points/handle_points_bloc.dart';
import 'package:diagrams/bloc/resize_element/resize_element_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/rectangle/rectangle_flow_element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../golden_test.dart';

late AddRemoveElementBloc _addRemoveElementBloc;
late DrawArrowsBloc _drawArrowsBloc;
late HandlePointsBloc _handlePointsBloc;
late ResizeElementBloc _resizeElementBloc;
late UnselectElementsBloc _unselectElements;

void resetBlocs() {
  _addRemoveElementBloc = AddRemoveElementBloc([]);
  _drawArrowsBloc = DrawArrowsBloc(
    const DrawArrowsState(),
  );
  _handlePointsBloc = HandlePointsBloc(
    addRemoveElementBloc: _addRemoveElementBloc,
    drawArrowsBloc: _drawArrowsBloc,
    unselectElementsBloc: UnselectElementsBloc(const UnselectElementsState(
      selectedElementList: SelectedElementList(),
    )),
  );
  _resizeElementBloc =
      ResizeElementBloc(addRemoveElementBloc: _addRemoveElementBloc);
  _unselectElements = UnselectElementsBloc(
    const UnselectElementsState(
      selectedElementList: SelectedElementList(),
    ),
  );
}

void rectangleGoldenTest() {
  group('rectangleTests', () {
    setUp(() async {
      resetBlocs();
    });
    tearDown(() {
      resetBlocs();
    });
    testGoldens('test rectangleFlowElement', (tester) async {
      await tester.pumpWidget(
        mainTestableApp(
          addRemoveElement: _addRemoveElementBloc,
          drawArrows: _drawArrowsBloc,
          handlePoints: _handlePointsBloc,
          resizeElementBloc: _resizeElementBloc,
          unselectElements: _unselectElements,
        ),
      );

      await tester.pumpAndSettle();

      await tester.drag(
        find.byType(Draggable<RectangleFlowElement>),
        const Offset(250, 100),
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

      await screenMatchesGolden(tester, 'rectangle/select_golden_test');
    });

    testGoldens('resize rectangleFlowElement', (tester) async {
      await tester.pumpWidget(
        mainTestableApp(
          addRemoveElement: _addRemoveElementBloc,
          drawArrows: _drawArrowsBloc,
          handlePoints: _handlePointsBloc,
          resizeElementBloc: _resizeElementBloc,
          unselectElements: _unselectElements,
        ),
      );

      await tester.pumpAndSettle();

      await tester.runAsync(() async {
        await tester.drag(
          find.byType(Draggable<RectangleFlowElement>),
          const Offset(250, 100),
        );

        await tester.pumpAndSettle();
      });

      var rectangle = _addRemoveElementBloc.elementsList.firstWhere(
          (element) => element.flowType == FlowElementTypes.rectangle);

      await tester.runAsync(() async {
        await tester.tap(find.byKey(rectangle.elementKey!));

        await tester.pumpAndSettle();
      });

      var dimensionPoint = rectangle.dimensionPointModelMap!.dimensionPointList
          .firstWhere((element) => element.alignment == Alignment.bottomRight);

      await tester.runAsync(() async {
        var gesture = await tester.startGesture(
            tester.getCenter(find.byKey(dimensionPoint.dimensionPointKey)));

        await gesture.moveBy(const Offset(50, 50));
        await gesture.moveBy(const Offset(50, 50));
        await gesture.moveBy(const Offset(50, 50));

        await tester.pumpAndSettle();

        await gesture.up();

        await tester.pumpAndSettle();
      });

      await screenMatchesGolden(tester, 'rectangle/resize_golden_test');
    });
  });
}
