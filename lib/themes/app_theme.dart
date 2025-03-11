import 'package:flutter/material.dart';

class AppTheme {
  // ✅ Primary Colors
  static const Color primaryColor = Color(0xFF005C65); // Teal
  static const Color secondaryColor = Color(0xFF94A3B8); // Muted Blue-Grey
  static const Color accentColor = Color(0xFF00A8B0); // Cyan
  static const Color backgroundLight = Color(0xFFFFFFFF); // White
  static const Color backgroundDark = Color(0xFF121212); // Dark Mode Background
  static const Color textPrimaryLight = Color(0xFF030303);
  static const Color textPrimaryDark = Color(0xFFF1F6F7);
  static const Color errorColor = Color(0xFFEF4444); // Red for errors

  // ✅ Font Family
  static const String fontFamily = "WorkSans";

  /// ✅ Light Theme
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundLight,
    fontFamily: fontFamily,
    colorScheme: _lightColorScheme,
    textTheme: _textThemeLight,
    appBarTheme: _appBarThemeLight,
    bottomNavigationBarTheme: _bottomNavBarThemeLight,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  /// ✅ Dark Theme
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundDark,
    fontFamily: fontFamily,
    colorScheme: _darkColorScheme,
    textTheme: _textThemeDark,
    appBarTheme: _appBarThemeDark,
    bottomNavigationBarTheme: _bottomNavBarThemeDark,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  /// ✅ Centralized Color Schemes
  static const ColorScheme _lightColorScheme = ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
    error: errorColor,
  );

  static const ColorScheme _darkColorScheme = ColorScheme.dark(
    primary: primaryColor,
    secondary: secondaryColor,
    error: errorColor,
  );

  /// ✅ Text Themes
  static const TextTheme _textThemeLight = TextTheme(
    displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textPrimaryLight),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: textPrimaryLight),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: textPrimaryLight),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: textPrimaryLight),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
  );

  static const TextTheme _textThemeDark = TextTheme(
    displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textPrimaryDark),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: textPrimaryDark),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: textPrimaryDark),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: textPrimaryDark),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
  );

  /// ✅ AppBar Themes
  static const AppBarTheme _appBarThemeLight = AppBarTheme(
    backgroundColor: primaryColor,
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
  );

  static const AppBarTheme _appBarThemeDark = AppBarTheme(
    backgroundColor: backgroundDark,
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
  );

  /// ✅ Bottom Navigation Bar Themes
  static const BottomNavigationBarThemeData _bottomNavBarThemeLight = BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: primaryColor,
    unselectedItemColor: secondaryColor,
  );

  static const BottomNavigationBarThemeData _bottomNavBarThemeDark = BottomNavigationBarThemeData(
    backgroundColor: backgroundDark,
    selectedItemColor: primaryColor,
    unselectedItemColor: secondaryColor,
  );

  /// ✅ Button Themes (Elevated & Outlined)
  static final ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );

  static final OutlinedButtonThemeData _outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: primaryColor,
      side: const BorderSide(color: primaryColor),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );

  /// ✅ Input Field Theme
  static final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: secondaryColor)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: secondaryColor)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: primaryColor)),
    errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: errorColor)),
    labelStyle: const TextStyle(color: secondaryColor),
    hintStyle: const TextStyle(color: secondaryColor),
  );
}
