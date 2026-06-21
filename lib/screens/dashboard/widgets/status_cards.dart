import 'package:flutter/material.dart';
import '../../../config/theme/app_theme.dart';

class StatusCards extends StatelessWidget {
  final int activeCount;
  final int warningCount;
  final int criticalCount;
  final int totalCount;

  const StatusCards({
    Key? key,
    required this.activeCount,
    required this.warningCount,
    required this.criticalCount,
    required this.totalCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _StatusCard(
          title: 'Active',
          count: activeCount,
          color: AppColors.statusOk,
          icon: Icons.check_circle_outline,
        ),
        _StatusCard(
          title: 'Warning',
          count: warningCount,
          color: AppColors.statusWarning,
          icon: Icons.warning_outlined,
        ),
        _StatusCard(
          title: 'Critical',
          count: criticalCount,
          color: AppColors.statusCritical,
          icon: Icons.error_outline,
        ),
        _StatusCard(
          title: 'Total',
          count: totalCount,
          color: AppColors.textSecondary,
          icon: Icons.devices_outlined,
        ),
      ],
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;
  final IconData icon;

  const _StatusCard({
    required this.title,
    required this.count,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        color: AppColors.darkCard,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            count.toString(),
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
