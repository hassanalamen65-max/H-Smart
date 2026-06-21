import 'package:flutter/material.dart';
import 'package:h_smart/config/theme/app_theme.dart';

class ColorUtils {
  /// Get AC color based on temperature
  /// Temperature < 24°C = Blue (Operational)
  /// Temperature >= 24°C and < 27°C = Amber (Warning)
  /// Temperature >= 27°C = Red (Critical)
  static Color getACColor(double currentTemp) {
    if (currentTemp < 24.0) {
      return AppColors.operational; // Blue
    } else if (currentTemp >= 24.0 && currentTemp < 27.0) {
      return AppColors.warning; // Amber
    } else {
      return AppColors.critical; // Red
    }
  }

  /// Get status string based on temperature
  static String getStatusFromTemp(double currentTemp) {
    if (currentTemp < 24.0) {
      return 'operational';
    } else if (currentTemp >= 24.0 && currentTemp < 27.0) {
      return 'warning';
    } else {
      return 'critical';
    }
  }

  /// Get color from status string
  static Color getColorFromStatus(String status) {
    switch (status.toLowerCase()) {
      case 'operational':
        return AppColors.operational;
      case 'warning':
        return AppColors.warning;
      case 'critical':
        return AppColors.critical;
      default:
        return AppColors.operational;
    }
  }

  /// Get color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
}
