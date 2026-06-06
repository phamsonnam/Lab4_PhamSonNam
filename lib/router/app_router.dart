import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_settings.dart';
import '../app_structure_demo.dart';
import '../common_ui_fixes_demo.dart';
import '../core_widgets_demo.dart';
import '../input_controls_demo.dart';
import '../layout_demo.dart';
import '../screens/home/home_screen.dart';
import '../screens/lab/lab_menu_screen.dart';
import '../screens/products/product_detail_screen.dart';
import '../screens/products/products_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/shell/main_shell.dart';

/// Tạo [GoRouter] với [StatefulShellRoute] cho BottomNavigationBar.
GoRouter createAppRouter(AppSettings appSettings) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home',
    redirect: (context, state) {
      if (state.matchedLocation == '/') return '/home';
      return null;
    },
    routes: [
      // Chi tiết sản phẩm – full screen, không có BottomNav.
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/products/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProductDetailScreen(productId: id);
        },
      ),

      // Shell chính với BottomNavigationBar.
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/products',
                builder: (context, state) => const ProductsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/lab',
                builder: (context, state) => const LabMenuScreen(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: 'ex1',
                    builder: (context, state) => const CoreWidgetsDemo(),
                  ),
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: 'ex2',
                    builder: (context, state) => const InputControlsDemo(),
                  ),
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: 'ex3',
                    builder: (context, state) => const LayoutDemo(),
                  ),
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: 'ex4',
                    builder: (context, state) => AppStructureDemo(
                      appSettings: appSettings,
                    ),
                  ),
                  GoRoute(
                    parentNavigatorKey: rootNavigatorKey,
                    path: 'ex5',
                    builder: (context, state) => const CommonUiFixesDemo(),
                  ),
                ],
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
    ],
  );
}
