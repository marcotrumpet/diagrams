import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddRemoveBloc
    extends Bloc<AbstractAddRemoveEvent, List<AbstractFlowElement>> {
  AddRemoveBloc(List<AbstractFlowElement> initialState) : super(initialState) {
    List<AbstractFlowElement> elementsList = [];

    on<AddEvent>((event, emit) {
      elementsList.add(event.elementToManipulate);
      final List<AbstractFlowElement> newList = [];
      newList.addAll(elementsList);
      emit(newList);
    });

    on<RemoveEvent>(
      (event, emit) {
        elementsList.removeWhere((element) =>
            element.elementKey == event.elementToManipulate.elementKey);
        final List<AbstractFlowElement> newList = [];
        newList.addAll(elementsList);
        emit(newList);
      },
    );
  }
}
