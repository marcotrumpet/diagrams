import 'dart:io';

import 'package:diagrams/desktop_system/system_menu_bar.dart';
import 'package:diagrams/desktop_system/system_tray.dart';
import 'package:diagrams/home.dart';
import 'package:diagrams/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DiagramsApp extends StatefulWidget {
  const DiagramsApp({Key? key}) : super(key: key);

  @override
  State<DiagramsApp> createState() => _DiagramsAppState();
}

class _DiagramsAppState extends State<DiagramsApp> {
  @override
  void initState() {
    GetIt.I.registerSingleton<AppSystemMenuBar>(
      AppSystemMenuBar(context.read<AppTheme>()),
    );
    GetIt.I.allReadySync();

    if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      GetIt.I<AppSystemMenuBar>().updateMenubar();
      GetIt.I<AppSystemTray>().initSystemTray();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppTheme, ThemeData>(
      builder: (_, theme) {
        return MaterialApp(
          title: 'Diagrams',
          theme: theme,
          debugShowCheckedModeBanner: false,
          home: const DiagramsHome(),
        );
      },
    );
  }
}