import 'dart:async';

import 'package:diagrams/main.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await getItInitialization();

  return testMain();
}
