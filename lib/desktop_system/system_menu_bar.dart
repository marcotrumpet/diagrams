import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menubar/menubar.dart';

class AppSystemMenuBar {
  static void updateMenubar() {
    // Currently, the menubar plugin is only implemented on macOS and linux.
    if (!Platform.isMacOS && !Platform.isLinux) {
      return;
    }
    setApplicationMenu([
      Submenu(label: 'Color', children: [
        MenuItem(
            label: 'Reset',
            enabled: true,
            shortcut: LogicalKeySet(
                LogicalKeyboardKey.meta, LogicalKeyboardKey.backspace),
            onClicked: () {}),
        const MenuDivider(),
        Submenu(label: 'Presets', children: [
          MenuItem(
              label: 'Red',
              enabled: false,
              shortcut: LogicalKeySet(LogicalKeyboardKey.meta,
                  LogicalKeyboardKey.shift, LogicalKeyboardKey.keyR),
              onClicked: () {}),
          MenuItem(
              label: 'Green',
              enabled: false,
              shortcut: LogicalKeySet(LogicalKeyboardKey.meta,
                  LogicalKeyboardKey.alt, LogicalKeyboardKey.keyG),
              onClicked: () {}),
        ])
      ]),
      Submenu(label: 'Counter', children: [
        MenuItem(
            label: 'Reset',
            enabled: true,
            shortcut: LogicalKeySet(
                LogicalKeyboardKey.meta, LogicalKeyboardKey.digit0),
            onClicked: () {}),
        const MenuDivider(),
      ]),
    ]);
  }
}
