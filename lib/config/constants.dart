/// Application Constants
class AppConstants {
  // Color Scheme
  static const String darkBg = '#0B0F14';
  static const String blueAccent = '#3BA8FF';
  static const String warningAmber = '#FFC107';
  static const String criticalRed = '#FF4D4D';
  static const String operationalBlue = '#3BA8FF';
  static const String surfaceColor = '#1A1F2E';
  static const String borderColor = '#2A3142';
  
  // Temperature Status Thresholds
  static const double operationalMaxTemp = 24.0;
  static const double warningMaxTemp = 27.0;
  
  // App Config
  static const String appName = 'H-Smart';
  static const String appTitle = 'H-Smart HVAC Monitoring System';
  static const Duration apiTimeout = Duration(seconds: 30);
  
  // Firebase Collections
  static const String acUnitsCollection = 'AC_Units';
  static const String alertsCollection = 'Alerts';
  static const String schedulesCollection = 'Schedules';
  static const String usersCollection = 'Users';
  static const String maintenanceCollection = 'Maintenance';
  
  // Room Names
  static const List<String> rooms = [
    'Conference Room',
    'Office 1',
    'Office 2',
    'Office 3',
    'Office 4',
    'Office 5',
    'Server Room',
    'Lobby',
    'Pantry',
    'Meeting Room',
  ];
  
  // Alert Types
  static const String highTemperature = 'High Temperature';
  static const String powerFailure = 'Power Failure';
  static const String sensorFailure = 'Sensor Failure';
  static const String maintenanceRequired = 'Maintenance Required';
  
  // Notification Messages
  static const String tempThresholdMsg = 'Temperature exceeds threshold';
  static const String deviceOfflineMsg = 'Device went offline';
  static const String criticalAlertMsg = 'Critical alert detected';
}

/// Duration Constants
class DurationConstants {
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);
  static const Duration realtimeUpdateInterval = Duration(seconds: 5);
  static const Duration snackbarDuration = Duration(seconds: 3);
}

/// Responsive Breakpoints
class ResponsiveBreakpoints {
  static const double mobile = 480;
  static const double tablet = 768;
  static const double desktop = 1024;
  static const double largeDesktop = 1440;
}
