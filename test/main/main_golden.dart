import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/bloc/theme/app_theme_cubit.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../golden_test.dart';

void mainGoldenTest() {
  setUp(() {
    appTheme = AppThemeCubit()..setDarkTheme();
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
  testGoldens('test main view', (tester) async {
    await tester.pumpWidgetBuilder(
      mainTestableApp(
        appThemeBloc: appTheme,
      ),
      wrapper: materialAppWrapper(platform: TargetPlatform.macOS),
    );
    await screenMatchesGolden(tester, 'main_golden_test');
  });
}
