import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_settings.dart';

/// Cá nhân – cài đặt + lối vào Lab 4 fundamentals.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.appSettings});

  final AppSettings appSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cá nhân')),
      body: ListenableBuilder(
        listenable: appSettings,
        builder: (context, child) {
          final isDark = appSettings.themeMode == ThemeMode.dark;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const CircleAvatar(
                radius: 40,
                child: Icon(Icons.person, size: 40),
              ),
              const SizedBox(height: 12),
              const Text(
                'Movie App',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Project tích hợp Lab 4 → 5 → 6:\n'
                '• Mức 1: UI Fundamentals\n'
                '• Mức 2: Danh sách & chi tiết phim\n'
                '• Mức 3: Khám phá responsive',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade700, height: 1.5),
              ),
              const SizedBox(height: 24),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.school),
                  title: const Text('UI Fundamentals'),
                  subtitle: const Text('Lab 4 – Widgets, Layout, Theme'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.push('/fundamentals'),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: SwitchListTile(
                  title: const Text('Chế độ tối'),
                  subtitle: const Text('Đổi theme toàn app'),
                  value: isDark,
                  onChanged: (enabled) {
                    appSettings.setThemeMode(
                      enabled ? ThemeMode.dark : ThemeMode.light,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
