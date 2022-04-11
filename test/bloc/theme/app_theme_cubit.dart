import 'package:bloc_test/bloc_test.dart';
import 'package:diagrams/bloc/theme/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void themeCubitTest() {
  late AppThemeCubit appThemeCubit;

  group('themeCubit', () {
    setUp(() {
      appThemeCubit = AppThemeCubit();
    });

    blocTest<AppThemeCubit, ThemeData>(
      'appThemeCubit initial',
      build: () => appThemeCubit,
      expect: () => [],
    );

    blocTest<AppThemeCubit, ThemeData>(
      'appThemeCubit darkTheme',
      build: () => appThemeCubit,
      act: (cubit) {
        cubit.emit(AppThemeCubit.darkTheme);
      },
      expect: () => [AppThemeCubit.darkTheme],
    );

    blocTest<AppThemeCubit, ThemeData>(
      'appThemeCubit lightTheme',
      build: () => appThemeCubit,
      act: (cubit) {
        cubit.emit(AppThemeCubit.lightTheme);
      },
      expect: () => [AppThemeCubit.lightTheme],
    );

    blocTest<AppThemeCubit, ThemeData>(
      'appThemeCubit toggleTheme',
      build: () => appThemeCubit,
      act: (cubit) {
        cubit.toggleTheme();
      },
      expect: () => [AppThemeCubit.darkTheme],
    );

    blocTest<AppThemeCubit, ThemeData>(
      'appThemeCubit setLightTheme method',
      build: () => appThemeCubit,
      act: (cubit) {
        cubit.setLightTheme();
      },
      expect: () => [AppThemeCubit.lightTheme],
    );

    blocTest<AppThemeCubit, ThemeData>(
      'appThemeCubit setDarkTheme method',
      build: () => appThemeCubit,
      act: (cubit) {
        cubit.setDarkTheme();
      },
      expect: () => [AppThemeCubit.darkTheme],
    );
  });
}
