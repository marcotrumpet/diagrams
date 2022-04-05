import 'package:diagrams/bloc/open/open_bloc.dart';
import 'package:diagrams/bloc/save/save_bloc.dart';
import 'package:diagrams/common/device_info.dart';
import 'package:diagrams/diagram_home.dart';
import 'package:diagrams/menubar/app_menu_bar.dart';
import 'package:diagrams/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DiagramsApp extends StatefulWidget {
  const DiagramsApp({Key? key}) : super(key: key);

  @override
  State<DiagramsApp> createState() => _DiagramsAppState();
}

class _DiagramsAppState extends State<DiagramsApp> {
  @override
  void initState() {
    moreGetItInitializazion();
    super.initState();
  }

  void moreGetItInitializazion() async {
    GetIt.I.registerSingletonAsync<DeviceInfo>(() async {
      final packageInfo = await PackageInfo.fromPlatform();

      return DeviceInfo(
        packageInfo: packageInfo,
      );
    });
    GetIt.I.registerSingleton<AppMenuBar>(
      AppMenuBar(
        saveBloc: BlocProvider.of<SaveBloc>(context),
        openBloc: BlocProvider.of<OpenBloc>(context),
      )..initialize(),
    );
    GetIt.I.allReady();
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
