import 'package:bloc_test/bloc_test.dart';
import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/resize_element/resize_element_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void resizeElementBlocTest() {
  late ResizeElementBloc bloc;

  setUp(() {
    bloc = ResizeElementBloc(addRemoveElementBloc: AddRemoveElementBloc([]));
  });

  group('resizeElementBloc', () {
    blocTest<ResizeElementBloc, ResizeElementState>(
      'is empty when initialized',
      build: () => bloc,
      expect: () => [],
      verify: (bloc) {
        if (bloc.mapScale.isNotEmpty) {
          throw Exception('macScale is not empty');
        }
        if (bloc.mapElementOffset.isNotEmpty) {
          throw Exception('mapElementOffset is not empty');
        }
      },
    );
  });
}
