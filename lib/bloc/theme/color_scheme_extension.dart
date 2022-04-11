import 'package:flutter/material.dart';

extension ColorSchemeExtension on ColorScheme {
  Color get appBackground {
    return brightness == Brightness.light
        ? const Color(0xFFE4E4E4)
        : const Color(0xFF242424);
  }

  Color get appCanvasBackground {
    return brightness == Brightness.light
        ? const Color(0xFFE4E4E4)
        : const Color(0xFF383838);
  }

  Color get appAccent {
    return brightness == Brightness.light
        ? const Color(0xFFE4E4E4)
        : const Color(0xFF4059F2);
  }

  Color get appBorder {
    return brightness == Brightness.light
        ? const Color(0xFF000000)
        : const Color(0xFFFDFDFD);
  }

  Color get appCanvasGrid {
    return brightness == Brightness.light
        ? const Color(0xFFE4E4E4)
        : const Color(0xFF6C6C6C);
  }
}
