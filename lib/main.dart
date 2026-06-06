import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_settings.dart';
import 'router/app_router.dart';

void main() {
  runApp(const Lab4App());
}

/// Root app: [MaterialApp.router] + theme sáng/tối.
class Lab4App extends StatefulWidget {
  const Lab4App({super.key});

  @override
  State<Lab4App> createState() => _Lab4AppState();
}

class _Lab4AppState extends State<Lab4App> {
  final AppSettings _appSettings = AppSettings();
  late final GoRouter _router = createAppRouter(_appSettings);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _appSettings,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Lab 4 – Flutter UI Fundamentals',
          debugShowCheckedModeBanner: false,
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
          themeMode: _appSettings.themeMode,
          routerConfig: _router,
        );
      },
    );
  }
}
