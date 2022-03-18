import 'package:diagrams/common/grid_property_provider.dart';
import 'package:diagrams/diagram_app.dart';
import 'package:diagrams/flow_elements/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/flow_elements/bloc/arrows/draw_arrows_state.dart';
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
          create: (context) => UnselectElementsBloc(
              const UnselectElementsState(unselect: false)),
        ),
        BlocProvider(
          create: (context) => DrawArrowsBloc(
            const DrawArrowsState(),
          ),
        ),
      ],
      child: const DiagramsApp(),
    ),
  );
}

Future<void> getItInitialization() async {
  GetIt getIt = GetIt.instance;
  // if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
  // getIt.registerSingleton<AppSystemTray>(AppSystemTray());
  // }
  getIt.registerSingleton<GridPropertyProvider>(GridPropertyProvider());
  await getIt.allReady();
}
