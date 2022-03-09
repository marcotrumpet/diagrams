import 'package:diagrams/diagram_app.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:diagrams/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'flow_elements/circle/circle_golden_test.dart';
import 'flow_elements/rectangle/rectangle_golden_test.dart';
import 'flow_elements/rounded_rectangle/rounded_rectangle_golden_test.dart';
import 'flow_elements/triangle/triangle_golden_test.dart';
import 'main/main_golden_test.dart';

Widget mainTestableApp() {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AppTheme(),
      ),
      BlocProvider(
        create: (context) => AddRemoveElementBloc([]),
      ),
      BlocProvider(
        create: (context) => UnselectElementsBloc(
          const UnselectElementsState(unselect: false),
        ),
      ),
      BlocProvider(
        create: (context) => DrawArrowsBloc(
          const DrawArrowsState(),
        ),
      ),
    ],
    child: const DiagramsApp(),
  );
}

void main() {
  mainGoldenTest();
  rectangleGoldenTest();
  roundedRectangleGoldenTest();
  triangleGoldenTest();
  circleGoldenTest();
}
