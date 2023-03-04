
import 'package:flutter/material.dart';

enum ThemeKey {
  dark,
  light
}

class ThemeManager {
  static ThemeData themeForKey(ThemeKey key) {
    return ThemeData(
      colorScheme: const ColorScheme(
        primary: Color(0xff0f0f0f),
        onPrimary: Colors.white,
        primaryContainer: Color(0xff4E4E4E),
        onPrimaryContainer: Colors.white,
        secondary: Colors.white,
        onSecondary: Colors.white,
        secondaryContainer: Color(0xff303030),
        onSecondaryContainer: Colors.white,
        background: Color(0xff1b1b1b),
        onBackground: Colors.white,
        error: Colors.red,
        onError: Colors.red,
        brightness: Brightness.dark,
        surface: Colors.white,
        onSurface: Colors.white,
      ),
      
    );
  }
}