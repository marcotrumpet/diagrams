import 'package:flutter/src/widgets/basic.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import '../golden_test.dart';

void mainGoldenTest() {
  testGoldens('test main view', (tester) async {
    await tester.pumpWidgetBuilder(
      mainTestableApp(),
      wrapper: materialAppWrapper(
        platform: TargetPlatform.macOS,
      ),
    );
    await screenMatchesGolden(tester, 'main_golden_test');
  });
}
