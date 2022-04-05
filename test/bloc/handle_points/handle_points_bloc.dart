import 'package:bloc_test/bloc_test.dart';
import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/bloc/handle_points/handle_points_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:flutter_test/flutter_test.dart';

void handlePointsBlocTest() {
  late HandlePointsBloc bloc;

  setUp(() {
    bloc = HandlePointsBloc(
      addRemoveElementBloc: AddRemoveElementBloc([]),
      drawArrowsBloc: DrawArrowsBloc(
        const DrawArrowsState(),
      ),
      unselectElementsBloc: UnselectElementsBloc(
        const UnselectElementsState(
          selectedElementList: SelectedElementList(),
        ),
      ),
    );
  });
  group('handlePointsBloc', () {
    blocTest<HandlePointsBloc, HandlePointsState>(
      'is empty when initialized',
      build: () => bloc,
      expect: () => [],
      verify: (bloc) {
        if (bloc.arrowEndPointFound != null) {
          throw Exception('arrowEndPointFound is not null');
        }
        if (bloc.currentArrow != null) {
          throw Exception('currentArrow is not null');
        }
      },
    );
  });
}
