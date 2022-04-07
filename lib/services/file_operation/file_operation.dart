import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
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
}
