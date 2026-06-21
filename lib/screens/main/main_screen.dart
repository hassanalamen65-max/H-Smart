import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/ac_units_provider.dart';
import '../../providers/alerts_provider.dart';
import '../../providers/rooms_provider.dart';
import '../../config/theme/app_theme.dart';
import '../dashboard/dashboard_screen.dart';
import '../devices/devices_screen.dart';
import '../analytics/analytics_screen.dart';
import '../schedule/schedule_screen.dart';
import '../settings/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AcUnitsProvider>().startListeningToAcUnits();
      context.read<AlertsProvider>().startListeningToAlerts();
      context.read<RoomsProvider>().startListeningToRooms();
    });
  }

  final List<Widget> _screens = const [
    DashboardScreen(),
    DevicesScreen(),
    AnalyticsScreen(),
    ScheduleScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: AppColors.darkSurface,
        selectedItemColor: AppColors.statusOk,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.devices_outlined),
            label: 'Devices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule_outlined),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
