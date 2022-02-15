import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRemoveElementBloc
    extends Bloc<AbstractAddRemoveElementEvent, List<AbstractFlowElement>> {
  AddRemoveElementBloc(List<AbstractFlowElement> initialState)
      : super(initialState) {
    List<AbstractFlowElement> elementsList = [];

    on<AddElementEvent>((event, emit) {
      elementsList.add(event.elementToManipulate);
      final List<AbstractFlowElement> newList = [...elementsList];
      emit(newList);
    });

    on<RemoveElementEvent>(
      (event, emit) {
        elementsList.removeWhere((element) =>
            element.elementKey == event.elementToManipulate.elementKey);
        final List<AbstractFlowElement> newList = [...elementsList];
        emit(newList);
      },
    );

    on<MoveElementEvent>((event, emit) {
      elementsList.removeWhere((element) =>
          element.elementKey == event.elementToManipulate.elementKey);
      elementsList.add(event.elementToManipulate);
      final List<AbstractFlowElement> newList = [...elementsList];
      emit(newList);
    });
  }
}
