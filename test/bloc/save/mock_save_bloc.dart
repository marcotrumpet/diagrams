import 'package:bloc_test/bloc_test.dart';
import 'package:diagrams/bloc/save/save_bloc.dart';

class MockSaveBloc extends MockBloc<SaveEvent, SaveState> implements SaveBloc {}
