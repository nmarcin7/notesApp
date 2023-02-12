import 'package:flutter/material.dart';

ThemeData themeForDark = ThemeData(
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: Color(0xFF524D8F)),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.white),
    backgroundColor: Color(0xFF1B1A27),
  ),
  cardColor: Colors.white,
  canvasColor: Colors.white,
  textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
  scaffoldBackgroundColor: Color(0xFF1B1A27),
  colorScheme: ColorScheme.fromSwatch(
      backgroundColor: Color(0xFF232434), accentColor: Colors.yellow),
);

ThemeData themeForBright = ThemeData(
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.blueAccent),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black)),
    cardColor: Colors.grey,
    canvasColor: Colors.white,
    textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
    scaffoldBackgroundColor: Color(0xFFF6F6F6),
    colorScheme: ColorScheme.fromSwatch(
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        accentColor: Colors.pink));
