import 'package:diagrams/common/device_info.dart';
import 'package:diagrams/services/file_operation/file_operation.dart';
import 'package:diagrams/services/file_operation/file_operation.mocks.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'bloc/arrows/draw_arrows_bloc.dart';
import 'bloc/handle_points/handle_points_bloc.dart';
import 'bloc/open/open_bloc.dart';
import 'bloc/resize_element/resize_element_bloc.dart';
import 'bloc/save/save_bloc.dart';
import 'bloc/theme/app_theme_cubit.dart';
import 'bloc/unselect_elements/unselect_elements_bloc.dart';

Future<void> getItInit() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerSingletonAsync<DeviceInfo>(() async {
    final packageInfo = PackageInfo(
      appName: 'diagrams',
      packageName: 'diagrams',
      version: 'test',
      buildNumber: '1',
      buildSignature: 'diagrams_test',
    );

    return DeviceInfo(
      packageInfo: packageInfo,
    );
  });

  // Using Mockito to fake saving location
  GetIt.I.registerSingleton<FileOperationService>(MockFileOperationService());

  GetIt.I.allReady();
}

void main() {
  setUpAll(() async => await getItInit());
  group('blocTest', () {
    unselectElementsBlocTest();
    drawArrowsBlocTest();
    handlePointsBlocTest();
    resizeElementBlocTest();
    saveBlocTest();
    openBlocTest();
    themeCubitTest();
  });
}
