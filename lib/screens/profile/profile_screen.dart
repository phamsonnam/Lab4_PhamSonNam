import 'package:flutter/material.dart';

import '../../app_settings.dart';

/// Trang cá nhân – bật/tắt dark mode qua [AppSettings].
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.appSettings});

  final AppSettings appSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cá nhân'),
      ),
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
                'Người dùng',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
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
