import 'package:bloc_test/bloc_test.dart';
import 'package:diagrams/bloc/handle_points/handle_points_bloc.dart';

class MockHandlePointsBloc
    extends MockBloc<HandlePointsEvent, HandlePointsState>
    implements HandlePointsBloc {}
