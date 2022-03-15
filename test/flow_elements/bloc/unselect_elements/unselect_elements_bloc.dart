import 'package:bloc_test/bloc_test.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_event.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void unselectElementsBlocTest() {
  late UnselectElementsBloc unselectElementsBloc;

  setUp(() {
    unselectElementsBloc =
        UnselectElementsBloc(const UnselectElementsState(unselect: false));
  });

  group('unselectElementsBloc', () {
    blocTest<UnselectElementsBloc, UnselectElementsState>(
      'is empty when initialized',
      build: () => unselectElementsBloc,
      expect: () => [],
    );

    blocTest<UnselectElementsBloc, UnselectElementsState>(
      'is true when element is unselected',
      build: () => unselectElementsBloc,
      act: (bloc) => bloc.add(UnselectElementsEvent(unselect: true)),
      expect: () => [const UnselectElementsState(unselect: true)],
    );

    blocTest<UnselectElementsBloc, UnselectElementsState>(
      'is false when element is selected',
      build: () => unselectElementsBloc,
      act: (bloc) => bloc.add(UnselectElementsEvent(unselect: false)),
      expect: () => [const UnselectElementsState(unselect: false)],
    );

    blocTest<UnselectElementsBloc, UnselectElementsState>(
      'select only if key matches',
      build: () => unselectElementsBloc,
      act: (bloc) => bloc.add(UnselectElementsEvent(
        unselect: false,
        elementKey: const Key('testKey'),
      )),
      expect: () => [
        const UnselectElementsState(
          unselect: false,
          elementKey: Key('testKey'),
        )
      ],
    );

    blocTest<UnselectElementsBloc, UnselectElementsState>(
      'unselect only if key matches',
      build: () => unselectElementsBloc,
      act: (bloc) => bloc.add(UnselectElementsEvent(
        unselect: true,
        elementKey: const Key('testKey'),
      )),
      expect: () => [
        const UnselectElementsState(
          unselect: true,
          elementKey: Key('testKey'),
        )
      ],
    );
  });
}
