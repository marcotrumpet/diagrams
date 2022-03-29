import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_event.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class UnselectElementsBloc
    extends Bloc<UnselectElementsEvent, UnselectElementsState> {
  // ignore: prefer_const_constructors
  var selectedElementList = SelectedElementList(selectedElements: []);
  UnselectElementsBloc(UnselectElementsState initialState)
      : super(initialState) {
    on<UnselectElementsEvent>((event, emit) {
      if (event.elementKey == null) {
        // unselect all flow elements
        selectedElementList = selectedElementList.copyWith(
          selectedElements: selectedElementList.selectedElements
              .map((e) => e.copyWith(selected: false))
              .toList(),
        );
      } else {
        var selectedElement = selectedElementList.selectedElements
            .firstWhereOrNull(
                (element) => element.elementKey == event.elementKey);

        if (selectedElement != null) {
          selectedElement = selectedElement.copyWith(selected: event.selected);
          selectedElementList.selectedElements.removeWhere(
              (element) => element.elementKey == selectedElement?.elementKey);
          selectedElementList.selectedElements.add(selectedElement);
        } else {
          selectedElementList.selectedElements.add(
            SelectedElement(
              elementKey: event.elementKey!,
              selected: event.selected,
            ),
          );
        }
      }

      final _newList = SelectedElementList(
          selectedElements: [...selectedElementList.selectedElements]);

      emit(
        UnselectElementsState(selectedElementList: _newList),
      );
    });
  }
}
