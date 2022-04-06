import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/save/file_model.dart';
import 'package:diagrams/common/device_info.dart';
import 'package:diagrams/common/file_selector/file_selector.dart';
import 'package:file_selector/file_selector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'save_bloc.freezed.dart';
part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  final AddRemoveElementBloc addRemoveElementBloc;
  final DrawArrowsBloc drawArrowsBloc;
  SaveBloc({
    required this.addRemoveElementBloc,
    required this.drawArrowsBloc,
  }) : super(const _Initial()) {
    on<SaveEvent>((event, emit) async {
      await event.maybeWhen(
        save: () async {
          emit(const SaveState.saving());

          var data = collectDataToSave();

          final savingPath = await GetIt.I<FileSelector>().getPath();

          if (savingPath == null || savingPath.isEmpty) {
            emit(const SaveState.errorSaving());
            return;
          }

          final file = XFile.fromData(
            data,
            mimeType: 'text/plain',
            lastModified: DateTime.now(),
          );

          await file.saveTo(savingPath);

          emit(const SaveState.saved());
        },
        orElse: () => null,
      );
    });
  }

  Uint8List collectDataToSave() {
    var deviceInfo = GetIt.I<DeviceInfo>();

    var fileModel = FileModel(
      abstractFlowElementsList: addRemoveElementBloc.elementsList,
      packageName: deviceInfo.packageInfo.packageName,
      version: deviceInfo.packageInfo.version,
      buildNumber: deviceInfo.packageInfo.buildNumber,
      arrowModelList: drawArrowsBloc.arrowModelList,
    );

    var _json = json.encode(fileModel.toJson());
    final bytes = utf8.encode(_json);

    final data = Uint8List.fromList(
      zlib.encode(bytes),
    );

    return data;
  }
}
