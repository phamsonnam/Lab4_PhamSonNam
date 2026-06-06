import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_settings.dart';
import 'router/app_router.dart';

void main() {
  runApp(const MovieApp());
}

/// App phim thống nhất – Lab 4 (nền) + Lab 5 (navigation) + Lab 6 (responsive).
class MovieApp extends StatefulWidget {
  const MovieApp({super.key});

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final AppSettings _appSettings = AppSettings();
  late final GoRouter _router = createAppRouter(_appSettings);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _appSettings,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Movie App – Flutter UI & Navigation',
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

/// Alias giữ tương thích test cũ.
typedef Lab4App = MovieApp;
