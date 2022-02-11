import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_event.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnselectElementsBloc
    extends Bloc<UnselectElementsEvent, UnselectElementsState> {
  UnselectElementsBloc(UnselectElementsState initialState)
      : super(initialState) {
    on<UnselectElementsEvent>((event, emit) {
      emit(UnselectElementsState(
          unselect: event.unselect, elementKey: event.elementKey));
    });
  }
}
