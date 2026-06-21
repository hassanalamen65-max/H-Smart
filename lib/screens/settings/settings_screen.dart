import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../config/theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Application Settings',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              _SettingSection(
                title: 'Notifications',
                children: [
                  SwitchListTile(
                    title: const Text('Enable Alerts'),
                    value: true,
                    onChanged: (value) {},
                    activeColor: AppColors.statusOk,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _SettingSection(
                title: 'Display',
                children: [
                  SwitchListTile(
                    title: const Text('Dark Mode'),
                    value: true,
                    onChanged: (value) {},
                    activeColor: AppColors.statusOk,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _SettingSection(
                title: 'Account',
                children: [
                  ListTile(
                    title: const Text('Logout'),
                    trailing: const Icon(Icons.logout),
                    onTap: () {
                      context.read<AuthProvider>().logout();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.statusOk,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
            color: AppColors.darkCard,
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}
