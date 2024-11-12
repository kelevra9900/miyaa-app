import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/dashboard/dashboard/dashboard_page.dart';
import '../features/dashboard/home/presentation/home_page.dart';
import '../features/init/presentation/loading/loading_page.dart';

import '../features/init/presentation/splash_screen/splash_page.dart';
import '../features/login/presentation/login_page.dart';

class Routes {
  static const String splash = '/splash-screen';
  static const String login = '/login';
  static const String loading = '/loading';
  static const String home = '/home';
  static const String dashboard = '/dashboard';
}

final router = GoRouter(initialLocation: Routes.splash, routes: [
  GoRoute(
    path: Routes.splash,
    pageBuilder: (context, state) => page(
      state: state,
      child: const SplashScreenPage(),
    ),
  ),
  GoRoute(
    path: Routes.login,
    pageBuilder: (context, state) => page(
      state: state,
      child: const LoginPage(),
    ),
  ),
  GoRoute(
    path: Routes.loading,
    pageBuilder: (context, state) => page(
      state: state,
      child: const LoadingPage({}),
    ),
  ),
  GoRoute(
    path: Routes.home,
    pageBuilder: (context, state) => page(
      state: state,
      child: const HomePage(),
    ),
  ),
  GoRoute(
    path: Routes.dashboard,
    pageBuilder: (context, state) => page(
      state: state,
      child: const DashboardPage(),
    ),
  ),
]);

NoTransitionPage<void> page(
        {required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);
