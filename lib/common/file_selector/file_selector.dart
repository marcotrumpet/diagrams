import 'package:file_selector/file_selector.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([FileSelector])
class FileSelector {
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
}
