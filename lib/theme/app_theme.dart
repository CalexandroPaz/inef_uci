import 'package:flutter/material.dart';
import 'inef_colors.dart';

class AppTheme {
  static ThemeData get light {
    final base = ColorScheme.fromSeed(
      seedColor: InefColors.primaryDark,
      primary: InefColors.primaryDark,
      secondary: InefColors.primaryMedium,
      tertiary: InefColors.primaryLight,
      surface: InefColors.surface,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      error: InefColors.critical,
      brightness: Brightness.light,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: base,
      appBarTheme: AppBarTheme(
        backgroundColor: InefColors.primaryDark,
        foregroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        surfaceTintColor: InefColors.primaryLight,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: InefColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: InefColors.primaryMedium, width: 2),
        ),
        labelStyle: const TextStyle(color: InefColors.textTitle),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: InefColors.primaryDark,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: InefColors.primaryMedium,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: InefColors.surface,
        labelStyle: const TextStyle(fontSize: 12),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      dividerTheme: const DividerThemeData(
        color: InefColors.divider,
        thickness: 1,
      ),
      scaffoldBackgroundColor: InefColors.surface,
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: InefColors.textTitle, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(color: InefColors.textTitle, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(color: InefColors.textTitle),
        bodySmall: TextStyle(color: InefColors.textTitle, fontSize: 12),
      ),
    );
  }

  static ThemeData get dark {
    final base = ColorScheme.fromSeed(
      seedColor: InefColors.primaryDark,
      primary: InefColors.primaryLight,
      secondary: InefColors.primaryMedium,
      tertiary: InefColors.primaryDark,
      surface: const Color(0xFF1A2530),
      onPrimary: const Color(0xFF0D1B2A),
      onSecondary: Colors.white,
      error: InefColors.critical,
      brightness: Brightness.dark,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: base,
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF0D1B2A),
        foregroundColor: InefColors.primaryLight,
        centerTitle: false,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: InefColors.primaryLight,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      scaffoldBackgroundColor: const Color(0xFF111D27),
    );
  }
}
