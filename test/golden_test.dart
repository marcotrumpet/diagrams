import 'package:diagrams/diagram_app.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'flow_elements/arrow/arrow_golden_test.dart';
import 'flow_elements/circle/circle_golden_test.dart';
import 'flow_elements/rectangle/rectangle_golden_test.dart';
import 'flow_elements/rounded_rectangle/rounded_rectangle_golden_test.dart';
import 'flow_elements/triangle/triangle_golden_test.dart';
import 'main/main_golden_test.dart';

late AppTheme appTheme;
late AddRemoveElementBloc addRemoveElementBloc;
late UnselectElementsBloc unselectElementsBloc;
late DrawArrowsBloc drawArrowsBloc;

Widget mainTestableApp({
  AddRemoveElementBloc? addRemoveElement,
  DrawArrowsBloc? drawArrows,
}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => appTheme,
      ),
      BlocProvider(
        create: (context) => addRemoveElement ?? addRemoveElementBloc,
      ),
      BlocProvider(
        create: (context) => unselectElementsBloc,
      ),
      BlocProvider(
        create: (context) => drawArrows ?? drawArrowsBloc,
      ),
    ],
    child: const DiagramsApp(),
  );
}

void main() {
  group('goldenTest', () {
    mainGoldenTest();
    rectangleGoldenTest();
    roundedRectangleGoldenTest();
    triangleGoldenTest();
    circleGoldenTest();
    arrowGoldenTest();
  });
}