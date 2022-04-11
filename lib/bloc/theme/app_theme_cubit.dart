import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeCubit extends Cubit<ThemeData> {
  AppThemeCubit()
      : super(SchedulerBinding.instance?.window.platformBrightness ==
                Brightness.light
            ? lightTheme
            : darkTheme);

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
  );

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? lightTheme : darkTheme);
  }

  void setLightTheme() {
    emit(lightTheme);
  }

  void setDarkTheme() {
    emit(darkTheme);
  }
}
