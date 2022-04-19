import 'package:diagrams/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menubar/menubar.dart';

class DesktopMenuBar {
  void buildDesktopMenu({
    required VoidCallback save,
    required VoidCallback open,
    required VoidCallback light,
    required VoidCallback dark,
    required VoidCallback toggleTheme,
  }) {
    setApplicationMenu([
      Submenu(label: t.menu_bar.file.main, children: [
        MenuItem(
          label: t.menu_bar.file.open,
          enabled: true,
          shortcut:
              LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyO),
          onClicked: open,
        ),
        MenuItem(
          label: t.menu_bar.file.save,
          enabled: true,
          shortcut:
              LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyS),
          onClicked: save,
        ),
      ]),
      Submenu(label: t.menu_bar.theme.main, children: [
        MenuItem(
          label: t.menu_bar.theme.light,
          enabled: true,
          shortcut: LogicalKeySet(LogicalKeyboardKey.meta,
              LogicalKeyboardKey.shift, LogicalKeyboardKey.keyL),
          onClicked: light,
        ),
        MenuItem(
          label: t.menu_bar.theme.dark,
          enabled: true,
          shortcut: LogicalKeySet(LogicalKeyboardKey.meta,
              LogicalKeyboardKey.shift, LogicalKeyboardKey.keyD),
          onClicked: dark,
        ),
        MenuItem(
          label: t.menu_bar.theme.toggle,
          enabled: true,
          shortcut: LogicalKeySet(LogicalKeyboardKey.meta,
              LogicalKeyboardKey.shift, LogicalKeyboardKey.keyT),
          onClicked: toggleTheme,
        ),
      ]),
    ]);
  }
}
