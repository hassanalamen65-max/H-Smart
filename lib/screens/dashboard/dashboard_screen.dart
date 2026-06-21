import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/rooms_provider.dart';
import '../../providers/ac_units_provider.dart';
import '../../config/theme/app_theme.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/temperature_gauge.dart';
import 'widgets/status_cards.dart';
import 'widgets/building_map.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DashboardHeader(),
                const SizedBox(height: 24),
                Consumer<RoomsProvider>(
                  builder: (context, roomsProvider, _) {
                    return TemperatureGauge(
                      temperature: roomsProvider.averageTemperature,
                    );
                  },
                ),
                const SizedBox(height: 24),
                Consumer<AcUnitsProvider>(
                  builder: (context, acProvider, _) {
                    return StatusCards(
                      activeCount: acProvider.activeCount,
                      warningCount: acProvider.warningCount,
                      criticalCount: acProvider.criticalCount,
                      totalCount: acProvider.acUnits.length,
                    );
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  'Building Map',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                const BuildingMap(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
