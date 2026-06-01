import 'package:flutter/material.dart';

/// Exercise 4 – [Scaffold], [AppBar], [FloatingActionButton], and [themeMode].
class AppStructureDemo extends StatelessWidget {
  const AppStructureDemo({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  bool get _isDark => themeMode == ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 4 – App Structure & Theme'),
        actions: [
          const Text('Dark'),
          Switch(
            value: _isDark,
            onChanged: (enabled) {
              onThemeModeChanged(
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
      // FAB demonstrates complete Scaffold structure from the lab.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('FAB pressed')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
