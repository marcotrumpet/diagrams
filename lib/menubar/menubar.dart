import 'package:diagrams/menubar/desktop/desktop_menu_bar.dart';
import 'package:flutter/foundation.dart';

class AppMenuBar {
  AppMenuBar();

  void initialize() {
    if (kIsWeb) return;
    DesktopMenuBar.buildDesktopMenu();
  }
}
