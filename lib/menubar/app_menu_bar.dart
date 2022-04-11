import 'package:diagrams/bloc/open/open_bloc.dart';
import 'package:diagrams/bloc/save/save_bloc.dart';
import 'package:diagrams/bloc/theme/app_theme_cubit.dart';
import 'package:diagrams/menubar/desktop/desktop_menu_bar.dart';
import 'package:flutter/foundation.dart';

class AppMenuBar {
  final SaveBloc saveBloc;
  final OpenBloc openBloc;
  final AppThemeCubit appTheme;
  AppMenuBar({
    required this.saveBloc,
    required this.openBloc,
    required this.appTheme,
  });

  void initialize() {
    if (kIsWeb) return;
    DesktopMenuBar().buildDesktopMenu(
      save: saveFile,
      open: openFile,
      dark: setDarkTheme,
      light: setLightTheme,
      toggleTheme: toggleTheme,
    );
  }

  void saveFile() {
    saveBloc.add(const SaveEvent.save());
  }

  void openFile() {
    openBloc.add(const OpenEvent.open());
  }

  void setLightTheme() {
    appTheme.setLightTheme();
  }

  void setDarkTheme() {
    appTheme.setDarkTheme();
  }

  void toggleTheme() {
    appTheme.toggleTheme();
  }
}
