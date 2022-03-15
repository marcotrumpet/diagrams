import 'package:diagrams/common/grid_property_provider.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/flow_elements/rectangle/rectangle_flow_element.dart';
import 'package:diagrams/flow_elements/rounded_rectangle/rounded_rectangle_flow_element.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../../golden_test.dart';

typedef SetupCanvas = Future<void> Function(WidgetTester tester);

late SetupCanvas setupBasicCanvas;
late AddRemoveElementBloc _addRemoveElementBloc;
late DrawArrowsBloc _drawArrowsBloc;

void resetBlocs() {
  _addRemoveElementBloc = AddRemoveElementBloc([]);

  _drawArrowsBloc = DrawArrowsBloc(
    const DrawArrowsState(),
  );
}

void arrowGoldenTest() {
  resetBlocs();
  group('arrowTest', () {
    tearDown(() {
      resetBlocs();
    });
    setUp(() {
      setupBasicCanvas = (tester) async {
        await tester.pumpWidgetBuilder(
          mainTestableApp(
            addRemoveElement: _addRemoveElementBloc,
            drawArrows: _drawArrowsBloc,
          ),
        );

        await tester.drag(
          find.byType(Draggable<RectangleFlowElement>),
          const Offset(150, 50),
        );

        await tester.drag(
          find.byType(Draggable<RoundedRectangleFlowElement>),
          const Offset(400, 250),
        );

        await tester.tap(find.byKey(const Key('unselect_flow_elements')));

        final gesture =
            await tester.createGesture(kind: PointerDeviceKind.mouse);
        addTearDown(gesture.removePointer);

        var rectangle =
            find.byKey(_addRemoveElementBloc.elementsList.first.elementKey!);

        var firstAnchor = _addRemoveElementBloc
            .elementsList.first.anchorPointsModelMap!.anchorPointList
            .firstWhere(
                (element) => element.alignment == Alignment.bottomRight);

        var secondAnchor = _addRemoveElementBloc
            .elementsList.last.anchorPointsModelMap!.anchorPointList
            .firstWhere((element) => element.alignment == Alignment.centerLeft);

        await tester.runAsync(() async {
          await gesture.addPointer(location: Offset.zero);
          await tester.pump();
          await gesture.moveTo(
            tester.getCenter(
              rectangle,
            ),
          );
          await tester.pump();
        });

        final _gridKey = GetIt.I<GridPropertyProvider>().gridKey;

        final parent = _gridKey.currentContext?.findRenderObject() as RenderBox;

        var first = parent
            .localToGlobal(firstAnchor.anchorPointPositionRelativeToParent);
        var second = parent
            .localToGlobal(secondAnchor.anchorPointPositionRelativeToParent);

        var drag =
            await tester.startGesture(first, kind: PointerDeviceKind.mouse);

        await tester.runAsync(() async {
          await drag.moveTo(
            second,
          );
        });

        await drag.up();
        await tester.pump();
      };
    });
    testGoldens('draw A* arrow', (tester) async {
      await setupBasicCanvas(tester);

      await screenMatchesGolden(
          tester, 'arrow/rect_to_rrect_arrow_golden_test');
    });

    // testGoldens('move start element and redraw arrow', (tester) async {
    //   await setupBasicCanvas(tester);
    //   debugPrint(_addRemoveElementBloc.elementsList.first.offset.toString());

    //   await screenMatchesGolden(tester, 'arrow/move_start_element_golden_test');

    //   await tester.drag(
    //     find.byKey(_addRemoveElementBloc.elementsList.first.elementKey ??
    //         _addRemoveElementBloc.elementsList.last.elementKey!),
    //     const Offset(400, 50),
    //   );

    //   debugPrint(_addRemoveElementBloc.elementsList.first.offset.toString());

    //   await screenMatchesGolden(tester, 'arrow/move_start_element_golden_test');
    // });
  });
}
