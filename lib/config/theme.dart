import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

class AppTheme {
  // Colors
  static Color get darkBg => _parseHexColor(AppConstants.darkBg);
  static Color get blueAccent => _parseHexColor(AppConstants.blueAccent);
  static Color get warningAmber => _parseHexColor(AppConstants.warningAmber);
  static Color get criticalRed => _parseHexColor(AppConstants.criticalRed);
  static Color get surfaceColor => _parseHexColor(AppConstants.surfaceColor);
  static Color get borderColor => _parseHexColor(AppConstants.borderColor);
  
  static Color _parseHexColor(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse('0x$hexColor'));
  }
  
  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBg,
      primaryColor: blueAccent,
      primarySwatch: _buildMaterialColor(blueAccent),
      textTheme: _buildTextTheme(),
      inputDecorationTheme: _buildInputDecorationTheme(),
      appBarTheme: _buildAppBarTheme(),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      outlinedButtonTheme: _buildOutlinedButtonTheme(),
      cardTheme: _buildCardTheme(),
      colorScheme: ColorScheme.dark(
        primary: blueAccent,
        secondary: warningAmber,
        tertiary: criticalRed,
        surface: surfaceColor,
        error: criticalRed,
        background: darkBg,
      ),
    );
  }
  
  static MaterialColor _buildMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;
    
    final Map<int, Color> shades = {
      50: Color.fromARGB(255, red + (255 - red) ~/ 10, green + (255 - green) ~/ 10, blue + (255 - blue) ~/ 10),
      100: Color.fromARGB(255, red + (255 - red) ~/ 5, green + (255 - green) ~/ 5, blue + (255 - blue) ~/ 5),
      200: Color.fromARGB(255, red + (255 - red) ~/ 3, green + (255 - green) ~/ 3, blue + (255 - blue) ~/ 3),
      300: Color.fromARGB(255, red + (255 - red) ~/ 2, green + (255 - green) ~/ 2, blue + (255 - blue) ~/ 2),
      400: color,
      500: color,
      600: Color.fromARGB(255, (red * 0.9).toInt(), (green * 0.9).toInt(), (blue * 0.9).toInt()),
      700: Color.fromARGB(255, (red * 0.8).toInt(), (green * 0.8).toInt(), (blue * 0.8).toInt()),
      800: Color.fromARGB(255, (red * 0.7).toInt(), (green * 0.7).toInt(), (blue * 0.7).toInt()),
      900: Color.fromARGB(255, (red * 0.6).toInt(), (green * 0.6).toInt(), (blue * 0.6).toInt()),
    };
    
    return MaterialColor(color.value, shades);
  }
  
  static TextTheme _buildTextTheme() {
    return GoogleFonts.poppinsTextTheme(
      const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    );
  }
  
  static InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: surfaceColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: blueAccent, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: criticalRed),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: criticalRed, width: 2),
      ),
      hintStyle: const TextStyle(color: Colors.grey),
      labelStyle: const TextStyle(color: Colors.white),
      errorStyle: const TextStyle(color: Color(0xFFFF4D4D)),
    );
  }
  
  static AppBarTheme _buildAppBarTheme() {
    return AppBarTheme(
      backgroundColor: darkBg,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
  
  static ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: blueAccent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
      ),
    );
  }
  
  static OutlinedButtonThemeData _buildOutlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: blueAccent,
        side: BorderSide(color: blueAccent),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
  
  static CardTheme _buildCardTheme() {
    return CardTheme(
      color: surfaceColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: borderColor),
      ),
      margin: EdgeInsets.zero,
    );
  }
  
  // Glassmorphism decoration
  static BoxDecoration get glassmorph {
    return BoxDecoration(
      color: surfaceColor.withOpacity(0.7),
      border: Border.all(color: borderColor.withOpacity(0.5)),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 20,
          spreadRadius: 0,
        ),
      ],
    );
  }
}
