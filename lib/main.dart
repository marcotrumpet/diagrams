import 'dart:io';

import 'package:diagrams/desktop_system/system_menu_bar.dart';
import 'package:diagrams/desktop_system/system_tray.dart';
import 'package:diagrams/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    AppSystemTray.initSystemTray();
    AppSystemMenuBar.updateMenubar();
  }

  runApp(const DiagramsApp());
}

class DiagramsApp extends StatelessWidget {
  const DiagramsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diagrams App',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const DiagramsHome(),
    );
  }
}
