import 'package:bloc_test/bloc_test.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_event.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_state.dart';

class MockUnselectElementsBloc
    extends MockBloc<UnselectElementsEvent, UnselectElementsState>
    implements UnselectElementsBloc {}
