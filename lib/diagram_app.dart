import 'package:diagrams/bloc/theme/app_theme_cubit.dart';
import 'package:diagrams/diagram_home.dart';
import 'package:diagrams/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DiagramsApp extends StatefulWidget {
  const DiagramsApp({Key? key}) : super(key: key);

  @override
  State<DiagramsApp> createState() => _DiagramsAppState();
}

class _DiagramsAppState extends State<DiagramsApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, ThemeData>(
      builder: (_, theme) {
        return MaterialApp(
          title: 'Diagrams',
          theme: theme,
          debugShowCheckedModeBanner: false,
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: LocaleSettings.supportedLocales,
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          home: const DiagramHome(),
        );
      },
    );
  }
}
