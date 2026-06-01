import 'package:flutter/material.dart';

import 'app_structure_demo.dart';
import 'common_ui_fixes_demo.dart';
import 'core_widgets_demo.dart';
import 'input_controls_demo.dart';
import 'layout_demo.dart';

void main() {
  runApp(const Lab4App());
}

/// Root app: light/dark [ThemeData] and [themeMode] for Exercise 4.
class Lab4App extends StatefulWidget {
  const Lab4App({super.key});

  @override
  State<Lab4App> createState() => _Lab4AppState();
}

class _Lab4AppState extends State<Lab4App> {
  ThemeMode _themeMode = ThemeMode.light;

  void _setThemeMode(ThemeMode mode) {
    setState(() => _themeMode = mode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 4 – Flutter UI Fundamentals',
      debugShowCheckedModeBanner: false,
      // Custom themes for Exercise 4
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        cardTheme: CardThemeData(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      home: LabMenuScreen(
        themeMode: _themeMode,
        onThemeModeChanged: _setThemeMode,
      ),
    );
  }
}

/// Main menu: navigates to each exercise screen.
class LabMenuScreen extends StatelessWidget {
  const LabMenuScreen({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  static const _menuBackground = Color(0xFFE8E6F0);

  @override
  Widget build(BuildContext context) {
    final items = <_MenuEntry>[
      _MenuEntry(
        title: 'Exercise 1 – Core Widgets Demo',
        builder: (_) => const CoreWidgetsDemo(),
      ),
      _MenuEntry(
        title: 'Exercise 2 – Input Controls Demo',
        builder: (_) => const InputControlsDemo(),
      ),
      _MenuEntry(
        title: 'Exercise 3 – Layout Demo',
        builder: (_) => const LayoutDemo(),
      ),
      _MenuEntry(
        title: 'Exercise 4 – App Structure & Theme',
        builder: (_) => AppStructureDemo(
          themeMode: themeMode,
          onThemeModeChanged: onThemeModeChanged,
        ),
      ),
      _MenuEntry(
        title: 'Exercise 5 – Common UI Fixes',
        builder: (_) => const CommonUiFixesDemo(),
      ),
    ];

    return Scaffold(
      backgroundColor: _menuBackground,
      appBar: AppBar(
        title: const Text('Lab 4 – Flutter UI Fundamentals'),
        backgroundColor: _menuBackground,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final entry = items[index];
          return Card(
            child: ListTile(
              title: Text(entry.title),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: entry.builder),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _MenuEntry {
  const _MenuEntry({required this.title, required this.builder});

  final String title;
  final WidgetBuilder builder;
}
