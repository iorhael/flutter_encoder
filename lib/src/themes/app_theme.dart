import 'package:flutter/material.dart';

import 'color_scheme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      colorScheme: MaterialTheme.lightScheme(),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: MaterialTheme.lightScheme().error,
        contentTextStyle: TextStyle(color: MaterialTheme.lightScheme().onError),
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            side: BorderSide(color: Colors.black),
            textStyle: TextStyle(fontSize: 17.0)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        borderRadius: BorderRadius.circular(20),
        borderColor: Colors.black,
        selectedBorderColor: Colors.black,
        fillColor: MaterialTheme.lightScheme().primary,
        selectedColor: MaterialTheme.lightScheme().onPrimary,
      ));

  static ThemeData darkTheme = ThemeData(
    colorScheme: MaterialTheme.darkScheme(),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: MaterialTheme.darkScheme().error,
      contentTextStyle: TextStyle(color: MaterialTheme.darkScheme().onError),
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          side: BorderSide(color: Colors.black),
          textStyle: TextStyle(fontSize: 17.0)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      borderRadius: BorderRadius.circular(20),
      borderColor: Colors.black,
      selectedBorderColor: Colors.black,
      fillColor: MaterialTheme.darkScheme().primary,
      selectedColor: MaterialTheme.darkScheme().onPrimary,
    ),
  );
}
