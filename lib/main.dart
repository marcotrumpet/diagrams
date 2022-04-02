import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/bloc/handle_points/handle_points_bloc.dart';
import 'package:diagrams/bloc/resize_element/resize_element_bloc.dart';
import 'package:diagrams/bloc/save/save_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:diagrams/common/grid_property_provider.dart';
import 'package:diagrams/diagram_app.dart';
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
          create: (_) => AppTheme(),
        ),
        BlocProvider(
          create: (_) => AddRemoveElementBloc([]),
        ),
        BlocProvider(
          create: (_) => UnselectElementsBloc(
            const UnselectElementsState(
              selectedElementList: SelectedElementList(),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => DrawArrowsBloc(
            const DrawArrowsState(),
          ),
        ),
        BlocProvider(
          create: (context) => HandlePointsBloc(
            addRemoveElementBloc:
                BlocProvider.of<AddRemoveElementBloc>(context),
            drawArrowsBloc: BlocProvider.of<DrawArrowsBloc>(context),
            unselectElementsBloc:
                BlocProvider.of<UnselectElementsBloc>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ResizeElementBloc(
            addRemoveElementBloc:
                BlocProvider.of<AddRemoveElementBloc>(context),
          ),
        ),
        BlocProvider(
          create: (context) => SaveBloc(
            addRemoveElementBloc:
                BlocProvider.of<AddRemoveElementBloc>(context),
            drawArrowsBloc: BlocProvider.of<DrawArrowsBloc>(context),
          ),
        ),
      ],
      child: const DiagramsApp(),
    ),
  );
}

Future<void> getItInitialization() async {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<GridPropertyProvider>(GridPropertyProvider());
  await getIt.allReady();
}
