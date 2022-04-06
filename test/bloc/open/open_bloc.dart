import 'package:bloc_test/bloc_test.dart';
import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/bloc/open/open_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void openBlocTest() {
  late OpenBloc bloc;

  group('openBloc', () {
    setUp(() {
      bloc = OpenBloc(
        addRemoveElementBloc: AddRemoveElementBloc([]),
        drawArrowsBloc: DrawArrowsBloc(
          const DrawArrowsState(),
        ),
      );
    });

    blocTest<OpenBloc, OpenState>(
      'saveBloc initial',
      build: () => bloc,
      expect: () => [],
    );
  });
}
