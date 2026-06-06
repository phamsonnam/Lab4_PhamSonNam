import 'package:flutter/material.dart';

import 'app_settings.dart';

/// Exercise 4 – [Scaffold], [AppBar], [FloatingActionButton], and [themeMode].
class AppStructureDemo extends StatelessWidget {
  const AppStructureDemo({
    super.key,
    required this.appSettings,
  });

  final AppSettings appSettings;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appSettings,
      builder: (context, child) {
        final isDark = appSettings.themeMode == ThemeMode.dark;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Exercise 4 – App Structure & Theme'),
            actions: [
              const Text('Dark'),
              Switch(
                value: isDark,
                onChanged: (enabled) {
                  appSettings.setThemeMode(
                    enabled ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'This is a simple screen with theme toggle.',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('FAB pressed')),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
