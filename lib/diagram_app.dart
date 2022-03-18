import 'package:diagrams/diagram_home.dart';
import 'package:diagrams/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiagramsApp extends StatefulWidget {
  const DiagramsApp({Key? key}) : super(key: key);

  @override
  State<DiagramsApp> createState() => _DiagramsAppState();
}

class _DiagramsAppState extends State<DiagramsApp> {
  @override
  void initState() {
    // if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    // GetIt.I.registerSingleton<AppSystemMenuBar>(
    //   AppSystemMenuBar(context.read<AppTheme>()),
    // );
    // GetIt.I.allReadySync();

    // GetIt.I<AppSystemMenuBar>().updateMenubar();
    // GetIt.I<AppSystemTray>().initSystemTray();5
    // }
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
          home: const DiagramHome(),
        );
      },
    );
  }
}
