import 'package:diagrams/common/grid_property_provider.dart';
import 'package:diagrams/flow_elements/abstract_flow_element.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AddRemoveElementBloc
    extends Bloc<AbstractAddRemoveElementEvent, List<AbstractFlowElement>> {
  AddRemoveElementBloc(List<AbstractFlowElement> initialState)
      : super(initialState) {
    List<AbstractFlowElement> elementsList = [];

    void updateGridBarriers(List<AbstractFlowElement> newList) {
      GetIt.I<GridPropertyProvider>().barriers.clear();
      GetIt.I<GridPropertyProvider>().barriers.addAll(
            newList.map(
              (e) => e.path
                  .getBounds()
                  .translate(e.offset?.dx ?? 0.0, e.offset?.dy ?? 0.0),
            ),
          );
      GetIt.I<GridPropertyProvider>().createGrid();
      GetIt.I<GridPropertyProvider>().addNeighbors();
    }

    on<AddElementEvent>((event, emit) {
      elementsList.add(event.elementToManipulate);
      final List<AbstractFlowElement> newList = [...elementsList];
      updateGridBarriers(newList);
      emit(newList);
    });

    on<RemoveElementEvent>(
      (event, emit) {
        elementsList.removeWhere((element) =>
            element.elementKey == event.elementToManipulate.elementKey);
        final List<AbstractFlowElement> newList = [...elementsList];
        updateGridBarriers(newList);
        emit(newList);
      },
    );

    on<MoveElementEvent>((event, emit) {
      elementsList.removeWhere((element) =>
          element.elementKey == event.elementToManipulate.elementKey);
      elementsList.add(event.elementToManipulate);
      final List<AbstractFlowElement> newList = [...elementsList];
      updateGridBarriers(newList);
      emit(newList);
    });
  }
}
