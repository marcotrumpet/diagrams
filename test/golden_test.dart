import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/handle_points/handle_points_bloc.dart';
import 'package:diagrams/bloc/open/open_bloc.dart';
import 'package:diagrams/bloc/resize_element/resize_element_bloc.dart';
import 'package:diagrams/bloc/save/save_bloc.dart';
import 'package:diagrams/bloc/theme/app_theme_cubit.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/diagram_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'bloc_test.dart';
import 'flow_elements/arrow/arrow_golden.dart';
import 'flow_elements/circle/circle_golden.dart';
import 'flow_elements/rectangle/rectangle_golden.dart';
import 'flow_elements/rounded_rectangle/rounded_rectangle_golden.dart';
import 'flow_elements/triangle/triangle_golden.dart';
import 'main/main_golden.dart';

late AppThemeCubit appTheme;
late AddRemoveElementBloc addRemoveElementBloc;
late UnselectElementsBloc unselectElementsBloc;
late DrawArrowsBloc drawArrowsBloc;
late HandlePointsBloc handlePointsBloc;
late ResizeElementBloc resizeElementBloc;

Widget mainTestableApp({
  AddRemoveElementBloc? addRemoveElement,
  DrawArrowsBloc? drawArrows,
  HandlePointsBloc? handlePoints,
  ResizeElementBloc? resizeElementBloc,
  AppThemeCubit? appThemeBloc,
}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => appThemeBloc ?? appTheme,
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
      BlocProvider(
        create: (context) =>
            handlePoints ??
            HandlePointsBloc(
              addRemoveElementBloc:
                  BlocProvider.of<AddRemoveElementBloc>(context),
              drawArrowsBloc: BlocProvider.of<DrawArrowsBloc>(context),
              unselectElementsBloc:
                  BlocProvider.of<UnselectElementsBloc>(context),
            ),
      ),
      BlocProvider(
        create: (context) =>
            resizeElementBloc ??
            ResizeElementBloc(
              addRemoveElementBloc:
                  BlocProvider.of<AddRemoveElementBloc>(context),
            ),
      ),
      BlocProvider(
        create: (context) => SaveBloc(
          addRemoveElementBloc: BlocProvider.of<AddRemoveElementBloc>(context),
          drawArrowsBloc: BlocProvider.of<DrawArrowsBloc>(context),
        ),
      ),
      BlocProvider(
        create: (context) => OpenBloc(
          addRemoveElementBloc: BlocProvider.of<AddRemoveElementBloc>(context),
          drawArrowsBloc: BlocProvider.of<DrawArrowsBloc>(context),
        ),
      ),
    ],
    child: const DiagramsApp(),
  );
}

void main() {
  setUpAll(() async => await getItInit());
  group('goldenTest', () {
    mainGoldenTest();
    rectangleGoldenTest();
    roundedRectangleGoldenTest();
    triangleGoldenTest();
    circleGoldenTest();
    arrowGoldenTest();
  });
}
