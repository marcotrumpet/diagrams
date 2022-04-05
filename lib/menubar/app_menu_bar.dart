import 'package:diagrams/bloc/open/open_bloc.dart';
import 'package:diagrams/bloc/save/save_bloc.dart';
import 'package:diagrams/menubar/desktop/desktop_menu_bar.dart';
import 'package:flutter/foundation.dart';

class AppMenuBar {
  final SaveBloc saveBloc;
  final OpenBloc openBloc;
  AppMenuBar({required this.saveBloc, required this.openBloc});

  void initialize() {
    if (kIsWeb) return;
    DesktopMenuBar().buildDesktopMenu(save: saveFile, open: openFile);
  }

  void saveFile() {
    saveBloc.add(const SaveEvent.save());
  }

  void openFile() {
    openBloc.add(const OpenEvent.open());
  }
}
