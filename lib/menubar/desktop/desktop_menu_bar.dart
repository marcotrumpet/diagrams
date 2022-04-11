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
      Submenu(label: 'File', children: [
        MenuItem(
          label: 'Open',
          enabled: true,
          shortcut:
              LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyO),
          onClicked: open,
        ),
        MenuItem(
          label: 'Save',
          enabled: true,
          shortcut:
              LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyS),
          onClicked: save,
        ),
      ]),
      Submenu(label: 'Theme', children: [
        MenuItem(
          label: 'Light Mode',
          enabled: true,
          shortcut:
              LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyO),
          onClicked: light,
        ),
        MenuItem(
          label: 'Dark Mode',
          enabled: true,
          shortcut:
              LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyS),
          onClicked: dark,
        ),
        MenuItem(
          label: 'Toggle Theme',
          enabled: true,
          shortcut:
              LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyS),
          onClicked: toggleTheme,
        ),
      ]),
    ]);
  }
}
