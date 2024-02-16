import 'package:flutter/material.dart';

ThemeData appLightTheme = ThemeData(
  brightness: Brightness.light,
  dividerColor: const Color(0xffF1F1F5),
);

ThemeData appDarkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0D1F29),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0D1F29),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
    ),
    dividerColor: const Color(0xff203744));
