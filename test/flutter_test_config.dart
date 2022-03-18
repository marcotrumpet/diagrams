import 'dart:async';

import 'package:diagrams/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await getItInitialization();
  await loadAppFonts();
  return testMain();
}
