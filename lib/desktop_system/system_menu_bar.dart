import 'dart:io';

import 'package:diagrams/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menubar/menubar.dart';

class AppSystemMenuBar {
  final AppTheme appTheme;

  AppSystemMenuBar(this.appTheme);
  void updateMenubar() {
    // Currently, the menubar plugin is only implemented on macOS and linux.
    if (!Platform.isMacOS && !Platform.isLinux) {
      return;
    }
    setApplicationMenu([
      Submenu(label: 'Color', children: [
        Submenu(label: 'Theme', children: [
          MenuItem(
            label: 'Light',
            enabled: true,
            shortcut: LogicalKeySet(LogicalKeyboardKey.meta,
                LogicalKeyboardKey.shift, LogicalKeyboardKey.keyL),
            onClicked: () => appTheme.setLightTheme(),
          ),
          MenuItem(
            label: 'Dark',
            enabled: true,
            shortcut: LogicalKeySet(LogicalKeyboardKey.meta,
                LogicalKeyboardKey.shift, LogicalKeyboardKey.keyD),
            onClicked: () => appTheme.setDarkTheme(),
          ),
        ])
      ]),
    ]);
  }
}
