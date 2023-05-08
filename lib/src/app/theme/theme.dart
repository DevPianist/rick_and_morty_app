import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/app/app.dart';

mixin ThemeMixin on State<App> {
  final _theme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Color(0xFF13B9FF),
    ),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: const Color(0xFF13B9FF),
    ),
  );
  ThemeData get theme => _theme;
}
