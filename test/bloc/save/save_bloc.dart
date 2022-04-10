import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/bloc/save/save_bloc.dart';
import 'package:diagrams/services/file_operation/file_operation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

void saveBlocTest() {
  late SaveBloc bloc;
  Uint8List testData = Uint8List.fromList([
    120,
    156,
    69,
    202,
    49,
    14,
    131,
    48,
    12,
    5,
    208,
    187,
    252,
    57,
    11,
    43,
    59,
    76,
    52,
    23,
    168,
    58,
    56,
    196,
    66,
    81,
    19,
    130,
    108,
    3,
    3,
    226,
    238,
    100,
    99,
    125,
    122,
    23,
    40,
    168,
    9,
    205,
    54,
    230,
    122,
    14,
    153,
    11,
    175,
    166,
    83,
    82,
    67,
    255,
    253,
    57,
    144,
    72,
    61,
    63,
    53,
    114,
    126,
    109,
    163,
    249,
    79,
    11,
    123,
    42,
    140,
    30,
    49,
    209,
    34,
    84,
    20,
    14,
    7,
    139,
    166,
    186,
    54,
    52,
    110,
    217,
    33,
    236,
    41,
    71,
    191,
    151,
    192,
    210,
    176,
    195,
    253,
    0,
    207,
    4,
    38,
    221
  ]);

  group('saveBloc', () {
    setUp(() {
      bloc = SaveBloc(
        addRemoveElementBloc: AddRemoveElementBloc([]),
        drawArrowsBloc: DrawArrowsBloc(
          const DrawArrowsState(),
        ),
      );
    });

    blocTest<SaveBloc, SaveState>(
      'saveBloc initial',
      build: () => bloc,
      expect: () => [],
    );

    test('saveBloc collectDataToSave', () {
      when(GetIt.I<FileOperationService>().collectDataToSave(
              bloc.addRemoveElementBloc, bloc.drawArrowsBloc))
          .thenReturn(testData);

      expect(
          GetIt.I<FileOperationService>().collectDataToSave(
              bloc.addRemoveElementBloc, bloc.drawArrowsBloc),
          testData);
    });

    blocTest<SaveBloc, SaveState>(
      'saveBloc saving null path',
      build: () => bloc,
      setUp: () {
        when(GetIt.I<FileOperationService>().collectDataToSave(
                bloc.addRemoveElementBloc, bloc.drawArrowsBloc))
            .thenReturn(testData);
        when(GetIt.I<FileOperationService>().getPath())
            .thenAnswer((realInvocation) async => null);
      },
      act: (bloc) {
        bloc.add(const SaveEvent.save());
      },
      expect: () => [const SaveState.saving(), const SaveState.errorSaving()],
    );

    blocTest<SaveBloc, SaveState>(
      'saveBloc saving empty path',
      build: () => bloc,
      setUp: () {
        when(GetIt.I<FileOperationService>().collectDataToSave(
                bloc.addRemoveElementBloc, bloc.drawArrowsBloc))
            .thenReturn(testData);
        when(GetIt.I<FileOperationService>().getPath())
            .thenAnswer((realInvocation) async => '');
      },
      act: (bloc) {
        bloc.add(const SaveEvent.save());
      },
      expect: () => [const SaveState.saving(), const SaveState.errorSaving()],
    );

    blocTest<SaveBloc, SaveState>(
      'saveBloc saving in path',
      build: () => bloc,
      setUp: () {
        when(GetIt.I<FileOperationService>().collectDataToSave(
                bloc.addRemoveElementBloc, bloc.drawArrowsBloc))
            .thenReturn(testData);
        when(GetIt.I<FileOperationService>().getPath())
            .thenAnswer((realInvocation) async => 'fakePath');

        when(GetIt.I<FileOperationService>()
                .saveOnDisk(data: testData, path: 'fakePath'))
            .thenAnswer((realInvocation) async => true);
      },
      act: (bloc) async {
        bloc.add(const SaveEvent.save());
      },
      expect: () => [const SaveState.saving(), const SaveState.saved()],
    );

    blocTest<SaveBloc, SaveState>(
      'saveBloc saving in path with error',
      build: () => bloc,
      setUp: () {
        when(GetIt.I<FileOperationService>().collectDataToSave(
                bloc.addRemoveElementBloc, bloc.drawArrowsBloc))
            .thenReturn(testData);
        when(GetIt.I<FileOperationService>().getPath())
            .thenAnswer((realInvocation) async => 'fakePath');
        when(GetIt.I<FileOperationService>()
                .saveOnDisk(data: testData, path: 'fakePath'))
            .thenAnswer((realInvocation) async => false);
      },
      act: (bloc) async {
        bloc.add(const SaveEvent.save());
      },
      expect: () => [const SaveState.saving(), const SaveState.errorSaving()],
    );
  });
}
