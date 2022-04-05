import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/save/file_model.dart';
import 'package:diagrams/common/device_info.dart';
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

          final savingPath = await getSavePath(
            acceptedTypeGroups: [
              XTypeGroup(
                extensions: ['dms'],
                label: 'diagrams_dms',
                macUTIs: ['dms'],
                mimeTypes: ['text/plain'],
              ),
            ],
            suggestedName: 'diagram',
          );

          if (savingPath == null || savingPath.isEmpty) {
            emit(const SaveState.errorSaving());
            return;
          }

          final data = Uint8List.fromList(
            zlib.encode(bytes),
          );
          const mimeType = 'text/plain';
          final file = XFile.fromData(
            data,
            mimeType: mimeType,
            lastModified: DateTime.now(),
          );
          await file.saveTo(savingPath);
          emit(const SaveState.saved());
        },
        orElse: () => null,
      );
    });
  }
}
