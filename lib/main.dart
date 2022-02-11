import 'dart:io';

import 'package:diagrams/desktop_system/system_tray.dart';
import 'package:diagrams/diagram_app.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/flow_elements/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:diagrams/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await getItInitialization();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppTheme(),
        ),
        BlocProvider(
          create: (context) => AddRemoveElementBloc([]),
        ),
        BlocProvider(
          create: (context) =>
              UnselectElementsBloc(UnselectElementsState(unselect: false)),
        ),
      ],
      child: const DiagramsApp(),
    ),
  );
}

Future<void> getItInitialization() async {
  GetIt getIt = GetIt.instance;
  if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    getIt.registerSingleton<AppSystemTray>(AppSystemTray());
  }
  await getIt.allReady();
}
