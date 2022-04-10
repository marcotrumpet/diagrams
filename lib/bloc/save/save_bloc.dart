import 'package:bloc/bloc.dart';
import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/services/file_operation/file_operation.dart';
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

          var data = GetIt.I<FileOperationService>()
              .collectDataToSave(addRemoveElementBloc, drawArrowsBloc);

          final savingPath = await GetIt.I<FileOperationService>().getPath();

          if (savingPath == null || savingPath.isEmpty) {
            emit(const SaveState.errorSaving());
            return;
          }

          var result = await GetIt.I<FileOperationService>()
              .saveOnDisk(data: data, path: savingPath);

          if (result) {
            emit(const SaveState.saved());
          } else {
            emit(const SaveState.errorSaving());
          }
        },
        orElse: () => null,
      );
    });
  }
}
