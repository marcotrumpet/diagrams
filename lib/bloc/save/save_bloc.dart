import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    on<SaveEvent>((event, emit) {
      event.maybeWhen(
        save: () {
          // TODO implement saving
          var _json = json.encode(addRemoveElementBloc.elementsList
              .map((e) => e.toJson())
              .toList());
          debugPrint(_json.toString());
        },
        orElse: () => null,
      );
    });
  }
}
