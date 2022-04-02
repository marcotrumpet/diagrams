import 'package:diagrams/bloc/save/save_bloc.dart';
import 'package:diagrams/menubar/desktop/desktop_menu_bar.dart';
import 'package:flutter/foundation.dart';

class AppMenuBar {
  final SaveBloc saveBloc;
  AppMenuBar({required this.saveBloc});

  void initialize() {
    if (kIsWeb) return;
    DesktopMenuBar().buildDesktopMenu(save: saveFile);
  }

  void saveFile() {
    saveBloc.add(const SaveEvent.save());
  }
}
