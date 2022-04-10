import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/bloc/open/open_bloc.dart';
import 'package:diagrams/bloc/save/file_model.dart';
import 'package:diagrams/common/device_info.dart';
import 'package:diagrams/services/file_operation/file_operation.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

void openBlocTest() {
  late OpenBloc bloc;
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
  var xFile = XFile.fromData(
    testData,
    mimeType: 'text/plain',
    path: 'fakePath/test.dms',
    name: 'test.dms',
  );

  group('openBloc', () {
    setUp(() {
      bloc = OpenBloc(
        addRemoveElementBloc: AddRemoveElementBloc([]),
        drawArrowsBloc: DrawArrowsBloc(
          const DrawArrowsState(),
        ),
      );
    });

    blocTest<OpenBloc, OpenState>(
      'openBloc initial',
      build: () => bloc,
      expect: () => [],
    );

    blocTest<OpenBloc, OpenState>(
      'openBloc open no file',
      build: () => bloc,
      setUp: () {
        when(
          GetIt.I<FileOperationService>().openFromDisk(),
        ).thenAnswer(
          (realInvocation) async => null,
        );
      },
      act: (bloc) {
        bloc.add(const OpenEvent.open());
      },
      expect: () => [
        const OpenState.opening(),
        const OpenState.errorOpening('error'),
      ],
    );

    blocTest<OpenBloc, OpenState>(
      'openBloc open with file',
      build: () => bloc,
      setUp: () {
        when(
          GetIt.I<FileOperationService>().openFromDisk(),
        ).thenAnswer(
          (realInvocation) async => xFile,
        );
        when(
          GetIt.I<FileOperationService>().modelFromOpenedFile(
            xFile,
          ),
        ).thenAnswer((realInvocation) async {
          var deviceInfo = GetIt.I<DeviceInfo>();

          var fileModel = FileModel(
            abstractFlowElementsList: bloc.addRemoveElementBloc.elementsList,
            packageName: deviceInfo.packageInfo.packageName,
            version: deviceInfo.packageInfo.version,
            buildNumber: deviceInfo.packageInfo.buildNumber,
            arrowModelList: bloc.drawArrowsBloc.arrowModelList,
          );

          return fileModel;
        });
      },
      act: (bloc) {
        bloc.add(const OpenEvent.open());
      },
      expect: () => [
        const OpenState.opening(),
        const OpenState.opened(),
      ],
    );
  });
}
