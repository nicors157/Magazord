import 'package:flutter/material.dart';

class ThemeApp {
  static final ligthTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColorLight: Colors.white,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: const Color.fromRGBO(4, 20, 35, 1),
      secondary: const Color.fromRGBO(204, 23, 66, 1.0),
      error: Colors.red,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      errorStyle: TextStyle(
        color: Colors.red,
        fontSize: 14,
      ),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w800,
        color: Color.fromRGBO(4, 20, 35, 1),
        fontSize: 16,
      ),
      hintStyle: TextStyle(
        color: Color.fromRGBO(4, 20, 35, 1),
        fontSize: 16,
      ),
    ),
  );

  static final gremioTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColorLight: Colors.black,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.blue,
      secondary: Colors.black,
      error: Colors.red,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      errorStyle: TextStyle(
        color: Colors.red,
        fontSize: 14,
      ),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.blue,
        fontSize: 16,
      ),
      hintStyle: TextStyle(
        color: Colors.blue,
        fontSize: 16,
      ),
    ),
  );

}
