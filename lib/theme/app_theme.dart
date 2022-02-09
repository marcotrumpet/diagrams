import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTheme extends Cubit<ThemeData> {
  AppTheme()
      : super(SchedulerBinding.instance?.window.platformBrightness ==
                Brightness.light
            ? _lightTheme
            : _darkTheme);

  static final _lightTheme = ThemeData(
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    brightness: Brightness.dark,
  );

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }

  void setLightTheme() {
    emit(_lightTheme);
  }

  void setDarkTheme() {
    emit(_darkTheme);
  }
}
