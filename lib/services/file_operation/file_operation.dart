import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/save/file_model.dart';
import 'package:diagrams/common/device_info.dart';
import 'package:file_selector/file_selector.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([FileOperationService])
class FileOperationService {
  Future<String?> getPath() async {
    return await getSavePath(
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
  }

  Future<XFile?> openFromDisk() async {
    return await openFile(
      acceptedTypeGroups: [
        XTypeGroup(
          extensions: ['dms'],
          label: 'diagrams_dms',
          macUTIs: ['dms'],
          mimeTypes: ['text/plain'],
        ),
      ],
    );
  }

  Future<bool> saveOnDisk(
      {required Uint8List data, required String path}) async {
    final file = XFile.fromData(
      data,
      mimeType: 'text/plain',
      lastModified: DateTime.now(),
    );

    try {
      await file.saveTo(path);
    } catch (e) {
      return false;
    }

    return true;
  }

  Uint8List collectDataToSave(AddRemoveElementBloc addRemoveElementBloc,
      DrawArrowsBloc drawArrowsBloc) {
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

  Future<FileModel> modelFromOpenedFile(XFile openingFile) async {
    var bytes = await openingFile.readAsBytes();
    var zlibDecoded = zlib.decode(bytes);
    var decoded = utf8.decode(zlibDecoded);
    var _json = json.decode(decoded);

    var fileModel = FileModel.fromJson(_json);

    return fileModel;
  }
}
