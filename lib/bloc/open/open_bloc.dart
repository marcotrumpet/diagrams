import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/add_remove_element/add_remove_element_event.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_event.dart';
import 'package:diagrams/bloc/save/file_model.dart';
import 'package:file_selector/file_selector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_bloc.freezed.dart';
part 'open_event.dart';
part 'open_state.dart';

class OpenBloc extends Bloc<OpenEvent, OpenState> {
  final AddRemoveElementBloc addRemoveElementBloc;
  final DrawArrowsBloc drawArrowsBloc;
  OpenBloc({
    required this.addRemoveElementBloc,
    required this.drawArrowsBloc,
  }) : super(const _Initial()) {
    on<OpenEvent>((event, emit) async {
      await event.maybeWhen(
        orElse: () => null,
        open: () async {
          // TODO check if canvas is not empty and ask to save first
          emit(const OpenState.opening());

          final openingFile = await openFile(
            acceptedTypeGroups: [
              XTypeGroup(
                extensions: ['dms'],
                label: 'diagrams_dms',
                macUTIs: ['dms'],
                mimeTypes: ['text/plain'],
              ),
            ],
          );

          if (openingFile == null) {
            emit(const OpenState.errorOpening());
            return;
          }

          var bytes = await openingFile.readAsBytes();
          var zlibDecoded = zlib.decode(bytes);
          var decoded = utf8.decode(zlibDecoded);
          var _json = json.decode(decoded);

          var fileModel = FileModel.fromJson(_json);
          // TODO check package name in case of equal file extension
          // TODO check version

          // TODO populate blocs
          for (var element in fileModel.abstractFlowElementsList) {
            element = element?.copyWith(
              anchorPointsModelMap: element.updateAnchorPoints(
                  element, element.offset!, element.path),
            );
            addRemoveElementBloc
                .add(AddElementEvent(elementToManipulate: element!));
          }

          for (var arrow in fileModel.arrowModelList) {
            arrow = arrow.copyWith(updateAStarPath: true);
            drawArrowsBloc.add(DrawArrowsAStarEvent(arrowModel: arrow));
          }
        },
      );
    });
  }
}
