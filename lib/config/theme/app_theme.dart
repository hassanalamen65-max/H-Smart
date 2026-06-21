import 'package:flutter/material.dart';

class AppColors {
  static const Color darkBackground = Color(0xFF0B0F14);
  static const Color darkSurface = Color(0xFF1A1F2E);
  static const Color darkCard = Color(0xFF242E3F);
  static const Color statusOk = Color(0xFF3BA8FF);
  static const Color statusWarning = Color(0xFFFFC107);
  static const Color statusCritical = Color(0xFFFF4D4D);
  static const Color textPrimary = Color(0xFFE8E8E8);
  static const Color textSecondary = Color(0xFF9E9E9E);
  static const Color divider = Color(0xFF3F4556);
  static const Color border = Color(0xFF404A5C);
}

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    primaryColor: AppColors.statusOk,
    colorScheme: ColorScheme.dark(
      primary: AppColors.statusOk,
      secondary: AppColors.statusWarning,
      error: AppColors.statusCritical,
      surface: AppColors.darkSurface,
    ),
    cardTheme: CardTheme(
      color: AppColors.darkCard,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.statusOk,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  static Color getACColor(double currentTemp) {
    if (currentTemp < 24) {
      return AppColors.statusOk;
    } else if (currentTemp >= 24 && currentTemp < 27) {
      return AppColors.statusWarning;
    } else {
      return AppColors.statusCritical;
    }
  }
}
