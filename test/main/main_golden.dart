import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:diagrams/theme/app_theme.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../golden_test.dart';

void mainGoldenTest() {
  setUp(() {
    appTheme = AppTheme();
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
      mainTestableApp(),
      wrapper: materialAppWrapper(
        platform: TargetPlatform.macOS,
      ),
    );
    await screenMatchesGolden(tester, 'main_golden_test');
  });
}
