import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    primarySwatch:
    Colors.blue;
    visualDensity:
    VisualDensity.adaptivePlatformDensity;
    const seedColor = Colors.deepPurple;

    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seedColor,
        listTileTheme: const ListTileThemeData(iconColor: seedColor));
  }
}
