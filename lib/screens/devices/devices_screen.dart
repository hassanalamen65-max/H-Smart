import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/ac_units_provider.dart';
import '../../config/theme/app_theme.dart';
import 'widgets/device_search_bar.dart';
import 'widgets/device_list_item.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({Key? key}) : super(key: key);

  @override
  State<DevicesScreen> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        title: const Text('AC Units'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: DeviceSearchBar(
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query;
                  });
                },
              ),
            ),
            Expanded(
              child: Consumer<AcUnitsProvider>(
                builder: (context, acProvider, _) {
                  var units = acProvider.acUnits;
                  if (_searchQuery.isNotEmpty) {
                    units = units.where((unit) {
                      return unit.deviceName
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase())||
                          unit.roomName
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase());
                    }).toList();
                  }
                  if (units.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.devices_off_outlined,
                            size: 64,
                            color: AppColors.textSecondary.withOpacity(0.5),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No AC Units Found',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: units.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: DeviceListItem(
                          unit: units[index],
                          onTap: () {},
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
