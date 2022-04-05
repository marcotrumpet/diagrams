import 'package:bloc_test/bloc_test.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_event.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void unselectElementsBlocTest() {
  late UnselectElementsBloc unselectElementsBloc;

  setUp(() {
    unselectElementsBloc = UnselectElementsBloc(
      const UnselectElementsState(
        selectedElementList: SelectedElementList(),
      ),
    );
  });

  group('unselectElementsBloc', () {
    blocTest<UnselectElementsBloc, UnselectElementsState>(
      'is empty when initialized',
      build: () => unselectElementsBloc,
      expect: () => [],
    );

    blocTest<UnselectElementsBloc, UnselectElementsState>(
      'element selected',
      build: () => unselectElementsBloc,
      act: (bloc) => bloc.add(
        UnselectElementsEvent(
          selected: true,
          elementKey: const Key('test'),
        ),
      ),
      expect: () => [
        const UnselectElementsState(
          selectedElementList: SelectedElementList(
            selectedElements: [
              SelectedElement(
                selected: true,
                elementKey: Key('test'),
              ),
            ],
          ),
        ),
      ],
    );

    blocTest<UnselectElementsBloc, UnselectElementsState>(
      'element unselected',
      build: () => unselectElementsBloc,
      act: (bloc) => bloc.add(UnselectElementsEvent(
        selected: false,
        elementKey: const Key('test'),
      )),
      expect: () => [
        const UnselectElementsState(
          selectedElementList: SelectedElementList(
            selectedElements: [
              SelectedElement(
                selected: false,
                elementKey: Key('test'),
              ),
            ],
          ),
        ),
      ],
    );
  });
}
