import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart';
import 'package:diagrams/bloc/arrows/draw_arrows_state.dart';
import 'package:diagrams/bloc/handle_points/handle_points_bloc.dart';
import 'package:diagrams/bloc/open/open_bloc.dart';
import 'package:diagrams/bloc/resize_element/resize_element_bloc.dart';
import 'package:diagrams/bloc/save/save_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_bloc.dart';
import 'package:diagrams/bloc/unselect_elements/unselect_elements_state.dart';
import 'package:diagrams/common/device_info.dart';
import 'package:diagrams/common/grid/grid_property_provider.dart';
import 'package:diagrams/diagram_app.dart';
import 'package:diagrams/menubar/app_menu_bar.dart';
import 'package:diagrams/services/file_operation/file_operation.dart';
import 'package:diagrams/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await getItInitialization();

  runApp(const DiagramsConfig());
}

Future<void> getItInitialization() async {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<GridPropertyProvider>(GridPropertyProvider());

  await getIt.allReady();
}

void moreGetItInitializazion(BuildContext context) async {
  if (!GetIt.I.isRegistered<DeviceInfo>()) {
    GetIt.I.registerSingletonAsync<DeviceInfo>(() async {
      final packageInfo = await PackageInfo.fromPlatform();

      return DeviceInfo(
        packageInfo: packageInfo,
      );
    });
  }
  if (!GetIt.I.isRegistered<AppMenuBar>()) {
    GetIt.I.registerSingleton<AppMenuBar>(
      AppMenuBar(
        saveBloc: BlocProvider.of<SaveBloc>(context),
        openBloc: BlocProvider.of<OpenBloc>(context),
      )..initialize(),
    );
  }
  if (!GetIt.I.isRegistered<FileOperationService>()) {
    GetIt.I.registerSingleton<FileOperationService>(FileOperationService());
  }
  GetIt.I.allReady();
}

class DiagramsConfig extends StatelessWidget {
  const DiagramsConfig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
        BlocProvider(
          create: (context) => OpenBloc(
            addRemoveElementBloc:
                BlocProvider.of<AddRemoveElementBloc>(context),
            drawArrowsBloc: BlocProvider.of<DrawArrowsBloc>(context),
          ),
        ),
      ],
      child: Builder(builder: (context) {
        moreGetItInitializazion(context);
        return const DiagramsApp();
      }),
    );
  }
}
