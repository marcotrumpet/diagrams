import 'dart:async';
import 'dart:ui';

class Debouncer {
  final int milliseconds;
  final VoidCallback? action;
  Timer? timer;

  Debouncer({required this.milliseconds, this.action});

  run(VoidCallback action) {
    if (timer != null) {
      timer!.cancel();
    }

    timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
