import 'package:bloc_test/bloc_test.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_state.dart';

class MockDrawArrowsBloc
    extends MockBloc<AbstractDrawArrowsEvent, DrawArrowsState>
    implements DrawArrowsBloc {}
