import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menubar/menubar.dart';

class DesktopMenuBar {
  static void buildDesktopMenu() {
    setApplicationMenu([
      Submenu(label: 'File', children: [
        MenuItem(
          label: 'Open',
          enabled: true,
          shortcut:
              LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyO),
        ),
        MenuItem(
          label: 'Save',
          enabled: true,
          shortcut:
              LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.keyS),
        ),
      ]),
    ]);
  }
}
