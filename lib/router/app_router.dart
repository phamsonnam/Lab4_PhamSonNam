import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_settings.dart';
import '../app_structure_demo.dart';
import '../common_ui_fixes_demo.dart';
import '../core_widgets_demo.dart';
import '../input_controls_demo.dart';
import '../layout_demo.dart';
import '../screens/browse/browse_screen.dart';
import '../screens/fundamentals/fundamentals_screen.dart';
import '../screens/movies/movie_list_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/shell/main_shell.dart';

/// Router chính – một app phim thống nhất Lab 4 → 5 → 6.
GoRouter createAppRouter(AppSettings appSettings) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/movies',
    redirect: (context, state) {
      final loc = state.matchedLocation;
      if (loc == '/' || loc == '/home') return '/movies';
      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/movies',
                builder: (context, state) => const MovieListScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/browse',
                builder: (context, state) => const BrowseScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) =>
                    ProfileScreen(appSettings: appSettings),
              ),
            ],
          ),
        ],
      ),

      // Lab 4 fundamentals – mở từ Profile.
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/fundamentals',
        builder: (context, state) => const FundamentalsScreen(),
        routes: [
          GoRoute(
            path: 'ex1',
            builder: (context, state) => const CoreWidgetsDemo(),
          ),
          GoRoute(
            path: 'ex2',
            builder: (context, state) => const InputControlsDemo(),
          ),
          GoRoute(
            path: 'ex3',
            builder: (context, state) => const LayoutDemo(),
          ),
          GoRoute(
            path: 'ex4',
            builder: (context, state) =>
                AppStructureDemo(appSettings: appSettings),
          ),
          GoRoute(
            path: 'ex5',
            builder: (context, state) => const CommonUiFixesDemo(),
          ),
        ],
      ),
    ],
  );
}
