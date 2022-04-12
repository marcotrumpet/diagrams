import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../golden_test.dart';

void mainGoldenTest() {
  setUp(() async {
    // SharedPreferences.setMockInitialValues({});
    // await EasyLocalization.ensureInitialized();
    // EasyLocalization.logger.enableLevels = [
    //   LevelMessages.error,
    //   LevelMessages.warning,
    // ];
  });
  testGoldens('test main view', (tester) async {
    await tester.pumpWidget(
      mainTestableApp(),
      // wrapper: materialAppWrapper(
      // platform: TargetPlatform.macOS,
      // localeOverrides: [const Locale('en')],
      // ),
    );

    await tester.pumpAndSettle();

    await screenMatchesGolden(tester, 'main_golden_test');
  });
}
