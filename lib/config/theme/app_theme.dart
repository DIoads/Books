import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.red,
  Colors.orange,
  Colors.blue,
  Colors.purple,
  Colors.green,
  Colors.brown,
  Colors.deepPurple,
  Colors.brown,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({required this.selectedColor, required this.isDarkMode})
      : assert(selectedColor >= 0 && selectedColor < colorList.length,
            'Elegir un valor entre el rango 0 y ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      appBarTheme: const AppBarTheme(centerTitle: false));
  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
