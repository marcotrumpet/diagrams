import 'package:bloc_test/bloc_test.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/flow_elements/bloc/handle_points/handle_points_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void handlePointsBlocTest() {
  late HandlePointsBloc bloc;

  setUp(() {
    bloc = HandlePointsBloc(
      addRemoveElementBloc: AddRemoveElementBloc([]),
      drawArrowsBloc: DrawArrowsBloc(
        const DrawArrowsState(),
      ),
    );
  });
  group('handlePointsBloc', () {
    blocTest<HandlePointsBloc, HandlePointsState>(
      'is empty when initialized',
      build: () => bloc,
      expect: () => [],
      verify: (bloc) {
        if (bloc.lastDrawnPoint != Offset.zero) {
          throw Exception('lastDrawnPoint has been initialized');
        }
        if (bloc.arrowEndPointFound != null) {
          throw Exception('arrowEndPointFound is not null');
        }
        if (bloc.elementAnchorPointFound != null) {
          throw Exception('elementAnchorPointFound is not null');
        }
      },
    );
  });
}
