import 'package:flutter/material.dart';
import '../../../config/theme/app_theme.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'H-Smart',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.statusOk,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'HVAC Control Center',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              color: AppColors.statusOk,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.menu_outlined),
              color: AppColors.statusOk,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
